using System;
using System.Collections.Generic;
using System.Net.NetworkInformation;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Threading;
using System.Threading.Tasks;
using Windows.Networking;
using Windows.Networking.Sockets;
using Windows.Storage;
using Windows.Storage.Streams;
using EASendMailRT;
using System.Text;
//FTP spisan po vzorčni kodi
//https://github.com/kiewic/FtpClient/blob/master/FtpClientSample/FtpClient.cs
namespace Aplikacija_iFE
{
    class tools : IDisposable
    {
        #region ATRIBUTI
        public bool InternetConnection { get { return NetworkInterface.GetIsNetworkAvailable(); } }
        public Exception Ex { get; set; }
        public bool Success { get; set; }
        public string Result { get; set; }
        public StorageFile File { get; set; }
        #endregion
        #region LOKALNE SPREMENLJIVKE
        private byte counter = 0;
        private StreamSocket ControlStreamSocket, DataSocket;
        private HostName hostname;

        private DataReader reader;
        private DataWriter writer;
        private AutoResetEvent loadCompleteEvent;
        private Task readTask;
        private List<string> readCommands;
        private string MessageLeft;

        //spreme
        #endregion
        #region USTVARI DATOTEKE
        public async void CreateLocalDB()
        {
            StorageFile SqliteDatabase = await ApplicationData.Current.LocalFolder.CreateFileAsync("iFe.sqlite", CreationCollisionOption.ReplaceExisting);
        }
        #endregion
        #region SPLOŠNE METODE
        public List<string> Getdate()
        {
            List<string> a = new List<string>();
            DateTime[] dates = new DateTime[] { DateTime.Today, DateTime.Today.AddDays(1), DateTime.Today.AddDays(2) };
            foreach (DateTime date in dates)
            {
                if (date.DayOfWeek != DayOfWeek.Saturday && date.DayOfWeek != DayOfWeek.Sunday) { counter++; }
                {
                    a.Add(date.ToString("dd. MMMM yyy"));
                }
                a.Add("Več na spletni strani");
            }
            return a;
        }
        #endregion
        #region PODATKOVNI PRENOS
        public void MailAndFTP(string room, string description, StorageFile photo)
        {
            Parallel.Invoke(() => SendMail(room, description), () => SendToFTP(room, description, photo));
        }
        private async void SendMail(string room, string description)
        {
            try
            {
                SmtpMail mail = new SmtpMail("Porocilo o škodi");
                SmtpClient client = new SmtpClient();
                Attachment a = new Attachment();
                mail.From = new MailAddress("aleksander.kovac97@hotmail.com");//mail bo posredovan preko konstruktorja
                mail.To.Add("ak3900@student.uni-lj.si");
                mail.Subject = "V prostoru " + room + " je nastala škoda: ";
                mail.TextBody = description;
              //  a.A =await
                SmtpServer mail_server = new SmtpServer("smtp.live.com");
                mail_server.Port =25;
                mail_server.Password = "Phoenix176";
                mail_server.User = "aleksander.kovac97@hotmail.com";
                
                mail_server.ConnectType = SmtpConnectType.ConnectSTARTTLS;

                await client.SendMailAsync(mail_server, mail);
                Result = "Obvestilo uspesno poslano!";


            }
            catch (Exception e)
            {
                e = Ex; Success = false;
                Result = "Zgodila se je napaka";
            }
        }
        private async void SendToFTP(string room, string desctiption, StorageFile photo)
        { }
        #region FTP PODMETODE
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
                () => { reader = new DataReader(ControlStreamSocket.InputStream);
                    reader.InputStreamOptions = InputStreamOptions.Partial;
                    writer = new DataWriter(ControlStreamSocket.OutputStream); },
                () => { readCommands = new List<string>();
                    loadCompleteEvent = new AutoResetEvent(false);
                    readTask = InfiniteReadAsync(); });


            FtpResponse response;
            response = await GetResponseAsync();
            VerifyResponse(response, 220);

            response = await ExecAsync(user,"USER");
            VerifyResponse(response, 331);

            response = await ExecAsync(password,"PASS");
            VerifyResponse(response, 230);
         }
        internal async Task UploadAsync(string filepath,byte[] filecontent)
        {
            if (ControlStreamSocket == null) { throw new InvalidOperationException("Najprej se naj izvede ConnectAsync()."); }
            FtpResponse response;
            response = await ExecuteAsync("I","TYPE");
            VerifyResponse(response, 200);

            response = await ExecuteAsync("","EPSV");
            VerifyRespone(response, 229);

            await OpenDataConnectionAsync(response.DataPort);

            response = await ExecuteAsync(filepath,"STOR");
            VerifyResponse(response, new uint[] { 125, 150 });

            await WriteAndCloseAsync(filecontent.AsBuffer());
            response = await GetResponseAsync();
            VerifyResponse(response, 226);
        }
        internal async Task OpenDataConnectionAsync(uint port)
        {
            if(DataSocket!= null)
            throw new InvalidOperationException("Podatkovna povezava se je že začela.");
            
            DataSocket = new StreamSocket();
            await DataSocket.ConnectAsync(hostname, port.ToString());
        }
        internal Task<FtpResponse> ExecuteAsync(string value, string type)
        {
            //StorAsync -> filenam >> value, "STOR" >> type
            //RetrAsync -> filename >> value, "RETR" >> type
            //SizeAsync -> filename >> value, "SIZE" >> type
            //EpsvAsync -> "" >> value, "EPSV" >> type
            //TypeAsync -> type >> value, "TYPE" >> type
            //PassAsync -> password >> value, "PASS" >>type
            //UserAsync -> user >> value, "USER" >> type
            return SendCommandAndGetResponseAsync(String.Format(type + " {0}\r\n", value);
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
        internal static void VerifyResponse(FtpResponse response,uint expectedReplyCode)
        {
            VerifyResponse(response, new uint[] { expectedReplyCode });
        }
        internal static void VerifyResponse(FtpResponse response, uint[] expectedReplyCodes)
        {
            foreach(uint expectedReplyCode in expectedReplyCodes)
            {
                if(expectedReplyCode == response.ReplyCode)
                {
                    return;
                }
            }
            throw new Exception(
                String.Format("FTP: Pričakovana odzivna koda je bila {0}, vendar je strežnik vrnil kodo: {1}",
                JoinRetryCodes(expectedReplyCodes),
                response.ToString().Trim()));
        }
         private static string JoinRetryCodes(uint [] values)
        {
            StringBuilder builder = new StringBuilder();
            foreach(uint value in values)
            {
                if(builder.Length!=0)
                {
                    builder.Append(" or ");
                }
                builder.Append(value.ToString());
            }
            return builder.ToString();
        }
    }






        #endregion
        #endregion

        //https://github.com/kiewic/FtpClient/blob/master/FtpClientSample/FtpClient.cs
    }
}
    
     

