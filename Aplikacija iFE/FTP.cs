using System;
using System.Collections.Generic;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Windows.Networking;
using Windows.Networking.Sockets;
using Windows.Storage.Streams;

namespace Aplikacija_iFE
{
    internal class FtpResponse
    {
        public string[] Commands { get; set; }
        public uint ReplyCode { get; set; }
        public uint DataPort { get; set; }
        public uint FileLength { get; set; }

        internal FtpResponse(string[] commands)
        {
            Commands = commands ?? throw new ArgumentNullException("commands");
            ParseCommands();
        }
        private void ParseCommands()
        {
            foreach (var command in Commands)
            {
                string codeString = command.Substring(0, 3);
                uint code = 0;
                if (UInt32.TryParse(codeString, out code))
                {
                    ReplyCode = code;
                    int index;
                    switch (code)
                    {
                        case 213:
                            index = command.IndexOf(" ");
                            if (index < 0) return;

                            uint fileLength;
                            if (UInt32.TryParse(command.Substring(index + 1), out fileLength))
                                FileLength = fileLength;
                            break;

                        case 229:
                            int prefixIndex = command.IndexOf("|||");
                            int postFixIndex = command.IndexOf("|", prefixIndex + 3);

                            if (prefixIndex < 0 || postFixIndex < 0) return;
                            uint port;
                            if (UInt32.TryParse(command.Substring(prefixIndex + 3, postFixIndex - prefixIndex - 3), out port)) { DataPort = port; }
                            break;
                        default:
                            throw new NotImplementedException();
                    }
            }
                }
        }
        public override string ToString()
        {
            StringBuilder builder = new StringBuilder();
            foreach (var command in Commands)
                builder.AppendLine(command);

            return builder.ToString();
        }
    }
    internal class FtpClient : IDisposable
    {
        private StreamSocket ControlStreamSocket, DataSocket;
        private HostName hostname;

        private DataReader reader;
        private DataWriter writer;
        private AutoResetEvent loadCompleteEvent;
        private Task readTask;
        private List<string> readCommands;
        private string MessageLeft;

        internal async Task ConnectAsync(HostName hostname, string serviceName, string user, string password)
        {
            if (ControlStreamSocket != null)
            {
                throw new InvalidOperationException("Kontrolna povezava je že v teku.");
            }
            ControlStreamSocket = new StreamSocket();
            await ControlStreamSocket.ConnectAsync(hostname, serviceName);

            Parallel.Invoke(
                () => { this.hostname = hostname; },
                () => {
                    reader = new DataReader(ControlStreamSocket.InputStream)
                    {
                        InputStreamOptions = InputStreamOptions.Partial
                    };
                    writer = new DataWriter(ControlStreamSocket.OutputStream);
                },
                () => {
                    readCommands = new List<string>();
                    loadCompleteEvent = new AutoResetEvent(false);
                    readTask = InfiniteReadAsync();
                });


            FtpResponse response;
            response = await GetResponseAsync();
            VerifyResponse(response, 220);

            response = await ExecuteAsync(user, "USER");
            VerifyResponse(response, 331);

            response = await ExecuteAsync(password, "PASS");
            VerifyResponse(response, 230);
        }
        internal async Task UploadAsync(string filepath, byte[] filecontent)
        {
            if (ControlStreamSocket == null) { throw new InvalidOperationException("Najprej se naj izvede ConnectAsync()."); }
            FtpResponse response;
            response = await ExecuteAsync("I", "TYPE");
            VerifyResponse(response, 200);

            response = await ExecuteAsync("", "EPSV");
            VerifyResponse(response, 229);

            await OpenDataConnectionAsync(response.DataPort);

            response = await ExecuteAsync(filepath, "STOR");
            VerifyResponse(response, new uint[] { 125, 150 });

            await WriteAndCloseAsync(filecontent.AsBuffer());
            response = await GetResponseAsync();
            VerifyResponse(response, 226);
        }
        internal async Task OpenDataConnectionAsync(uint port)
        {
            if (DataSocket != null)
                throw new InvalidOperationException("Podatkovna povezava se je že začela.");

            DataSocket = new StreamSocket();
            await DataSocket.ConnectAsync(hostname, port.ToString());
        }
        internal Task<FtpResponse> ExecuteAsync(string value, string type)
        {
            //StorAsync -> filenam >> value, "STOR" >> type   //RetrAsync -> filename >> value, "RETR" >> type  //SizeAsync -> filename >> value, "SIZE" >> type
            //EpsvAsync -> "" >> value, "EPSV" >> type       //TypeAsync -> type >> value, "TYPE" >> type       //PassAsync -> password >> value, "PASS" >>type
            //UserAsync -> user >> value, "USER" >> type
            return SendCommandAndGetResponseAsync(String.Format(type + " {0}\r\n", value));
        }
        internal async Task<uint> WriteAndCloseAsync(IBuffer buffer)
        {
            uint bytesWritten = await DataSocket.OutputStream.WriteAsync(buffer);
            DataSocket.Dispose();
            DataSocket = null;
            return bytesWritten;
        }
        internal Task QuitAsync()
        {
            return SendCommandAsync(String.Format("QUIT \r\n"));
        }
        internal async Task<FtpResponse> SendCommandAndGetResponseAsync(string command)
        {
            loadCompleteEvent.Reset();
            await SendCommandAsync(command);
            return await GetResponseAsync();

        }
        internal async Task SendCommandAsync(string command)
        {
            await SendCommandAndGetResponseAsync(command);
            uint bytesWritten = await writer.StoreAsync();
        }
        internal Task<FtpResponse> GetResponseAsync()
        {
            return Task.Run(() =>
            {
                loadCompleteEvent.WaitOne();
                FtpResponse response = new FtpResponse(readCommands.ToArray());
                readCommands = new List<string>();
                return response;
            });
        }
        internal static void VerifyResponse(FtpResponse response, uint expectedReplyCode)
        {
            VerifyResponse(response, new uint[] { expectedReplyCode });
        }
        internal static void VerifyResponse(FtpResponse response, uint[] expectedReplyCodes)
        {
            foreach (uint expectedReplyCode in expectedReplyCodes)
            {
                if (expectedReplyCode == response.ReplyCode)
                {
                    return;
                }
            }
            throw new Exception(
                String.Format("FTP: Pričakovana odzivna koda je bila {0}, vendar je strežnik vrnil kodo: {1}",
                JoinRetryCodes(expectedReplyCodes),
                response.ToString().Trim()));
        }
        private static string JoinRetryCodes(uint[] values)
        {
            StringBuilder builder = new StringBuilder();
            foreach (uint value in values)
            {
                if (builder.Length != 0)
                {
                    builder.Append(" or ");
                }
                builder.Append(value.ToString());
            }
            return builder.ToString();
        }
        private async Task InfiniteReadAsync()
        {
            uint bytesRead = 1;
            while (bytesRead > 1)
            {
                bytesRead = await reader.LoadAsync(1000);
                while (reader.UnconsumedBufferLength > 0)
                {
                    string message = reader.ReadString(reader.UnconsumedBufferLength);
                    ProcessLoad(message);
                }
                loadCompleteEvent.Set();
            }
        }
        private void ProcessLoad(string message)
        {
            message = MessageLeft + message;
            int index = message.IndexOf("\r\n");

            while (index >= 0)
            {
                string command = message.Substring(0, index);
                message = message.Substring(index + 2);
                index = message.IndexOf("\r\n");
            }
            MessageLeft = message;
        }
        public void Dispose()
        {
            if (DataSocket != null)
            {
                DataSocket.Dispose(); DataSocket = null;
            }
            if (ControlStreamSocket != null)
            {
                ControlStreamSocket.Dispose(); ControlStreamSocket = null;
            }
        }
    }

}
