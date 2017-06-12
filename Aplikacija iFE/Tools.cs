using Microsoft.Data.Sqlite;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net.NetworkInformation;
using System.Threading.Tasks;
using Windows.Storage;
//outer libraries
using Chilkat;
using EASendMailRT;

namespace Aplikacija_iFE
{
    class tools
    {      
        #region ATRIBUTI
        public bool InternetConnection { get { return NetworkInterface.GetIsNetworkAvailable(); } }
        public Exception Ex { get; set; }
        public bool Success { get; set; }
        public string Result { get; set; }
        public StorageFile File { get; set; }
        #endregion
        #region SPREMENLJIVKE
        private byte counter=0;
        #endregion
        #region SPLOŠNE METODE
        public List<string> Getdate()
        {
            List<string> a = new List<string>();
            DateTime[] dates = new DateTime[] { DateTime.Today, DateTime.Today.AddDays(1), DateTime.Today.AddDays(2) };
            foreach (DateTime date in dates)
            {
                if (date.DayOfWeek != DayOfWeek.Saturday && date.DayOfWeek != DayOfWeek.Sunday) { counter++;}
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
           Parallel.Invoke( () => SendMail(room, description), () => SendToFTP(room, description, photo));     
        }
        private async void SendMail(string room,string description)
        {
            try
            {
                SmtpMail mail = new SmtpMail("Porocilo o škodi");
                SmtpClient client = new SmtpClient();
                mail.From = new MailAddress("aleksander.kovac97@hotmail.com");//mail bo posredovan preko konstruktorja
                mail.To.Add("ak3900@student.uni-lj.si");
                mail.Subject = "V prostoru " + room + " je nastala škoda: ";
                mail.TextBody = description;

                SmtpServer mail_server = new SmtpServer("smtp.live.com");
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
        private void  SendToFTP(string room ,string description, StorageFile photo)
        {
            Ftp2 ftp = new Ftp2();
            /*success = ftp.UnlockComponent("Anything for 30-day trial");

            if (!success)
            {
                Debug.WriteLine(ftp.LastErrorText);
                return;
            }
            ftp.ClientIpAddress = "83.212.126.172";
            ftp.Username = "Administrator";
            ftp.Password = "8KINtGoV7s";
            ftp.Port = 1026;
            success = await ftp.ConnectAsync();
            if (!success)
            {
                Debug.WriteLine(ftp.LastErrorText);
                return;
            }

            success = await ftp.ChangeRemoteDirAsync("Shares/SlikeZaSkodo");
            if (!success)
            {
                Debug.WriteLine(ftp.LastErrorText);
            }
            string file2 = File;
            success = await ftp.PutFileAsync(File, file2);
            if (!success)
            {
                Debug.WriteLine(ftp.LastErrorText);
            }
            while (ftp.AsyncBytesSent64 != size)
            {
                Debug.WriteLine(Convert.ToString(ftp.AsyncBytesSent64) + " bytes sent");
                Debug.WriteLine(Convert.ToString(ftp.UploadTransferRate) + " bytes per second");

                ftp.SleepMs(1000);
            }
            if (ftp.LastMethodSuccess == true)
            {
                Debug.WriteLine("File Uploaded!");
            }
            else
            {
                Debug.WriteLine(ftp.LastErrorText);
            }
            success = await ftp.DisconnectAsync();*/       }
        #endregion
    }
 #region SQL
 public class SQLite
    {
        #region SPREMENLJIVKE
      
       SqliteConnection conn = new SqliteConnection("Filename="+Path.Combine(Windows.Storage.ApplicationData.Current.LocalFolder.Path, "iFE.sqlite"));
        private string[] queries;
       

        #endregion
        #region KONSTRUKTORJI
        public SQLite()
        {
 
            string path = Path.Combine(Windows.Storage.ApplicationData.Current.LocalFolder.Path, "iFE.sqlite");
            if (!File.Exists(path))
            {
                CreateDatabase();
            }
        }
        #endregion
        #region METODE
        public void CreateDatabase()
        {
            queries = new string[] {
                    "CREATE TABLE Settings (OnlyWifi TINYINT NOT NULL , Language VARCHAR(2) NOT NULL DEFAULT 'si', Certificate VARCHAR(40) NOT NULL DEFAULT 'c', Password VARCHAR(50) NOT NULL DEFAULT 'sha1')",
                    "CREATE TABLE User( ID INTEGER NOT NULL, Surname CHAR(50) NOT NULL, Name CHAR(50) NOT NULL, Email CHAR(20) NOT NULL, Password CHAR(40) NOT NULL)" };
        
            foreach (string a in queries)
            {
                conn.Open();
                SqliteCommand command = new SqliteCommand(a, conn);
                try{command.ExecuteNonQuery();}
                catch(SqliteException e){  conn.Close();}  
            }
            conn.Close();
        }
        public void SetAllToDefault()
        {
            queries = new string[] {"UPDATE User SET ID = 0, Surname = '', Name = '', Email = '', Password = '';","UPDATE Settings  SET OnlyWifi= 1, Language = 'si', Certificate = 'c:', SHA1Certif = 'sha1';"};
            SqliteCommand command = new SqliteCommand();
            command.Connection = conn;
            conn.Open();
            foreach (string a in queries)
            {
                command.CommandText = a;
                try { command.ExecuteReader(); } catch { conn.Close(); }
            }
            conn.Close();
        }
        public void UpdateSettings(byte column,string value)
        {
            string collumn_name;
           switch(column)
            {
                case 0:
                case 1: collumn_name = "OnlyWifi"; if(value.ToLower().Contains("false") || value.ToLower().Contains("true") ) { if (value.ToLower().Contains("true")) { column = 1; } else { column = 0; } } else { throw new Exception(); }  break;
                case 2: collumn_name = "Language";   break;
                case 3: collumn_name = "Certificate"; break;
                case 4: collumn_name = "Password";   break;
                default: throw new Exception();
            }
            if (column == 1 || column == 0) { queries = new string[] { "UPDATE Settings SET '" + collumn_name + "'='" + column + "'" }; }
            else { queries = new string[] { "UPDATE Settings SET '" + collumn_name + "'='" + value + "'" }; }
            conn.Open();
            SqliteCommand command = new SqliteCommand(queries[0], conn);
            try { command.ExecuteNonQuery(); } catch(Exception e) { e.ToString(); } finally  { conn.Close(); }   

        }
        #endregion
    }

    public class SETTINGSQLite
    {
        public bool OnlyWifi { get; set; }
        public string Language { get; set; }
        public string Certificate { get; set; }
        public string CertfKey { get; set; }
     }
    public class USERSQLite
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
    }
#endregion
}
