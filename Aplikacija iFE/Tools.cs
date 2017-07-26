using Microsoft.Data.Sqlite.Internal;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Threading.Tasks;
using Windows.Devices.Enumeration;
using Windows.Networking;
using Windows.Networking.Connectivity;
using Windows.Storage;
//od tu naprej  je vprašljiva licenca;
using Nager.Date;
using HtmlAgilityPack; //licenca
using EASendMailRT; //licenca


//FTP spisan po vzorčni kodi
//https://github.com/kiewic/FtpClient/blob/master/FtpClientSample/FtpClient.cs
namespace Aplikacija_iFE
{
    class Tools
    {
        #region ATRIBUTI
        private ConnectionCost connectionhost = NetworkInformation.GetInternetConnectionProfile().GetConnectionCost();
        public bool NetAndWiFi => (NetworkInterface.GetIsNetworkAvailable() && NetworkInformation.GetInternetConnectionProfile().IsWlanConnectionProfile ||    (connectionhost.NetworkCostType==NetworkCostType.Unknown || connectionhost.NetworkCostType==NetworkCostType.Unrestricted));
        public bool SaturdaySundayOrHoliday => (DateTime.Today.DayOfWeek == DayOfWeek.Saturday || DateTime.Today.DayOfWeek == DayOfWeek.Sunday || DateSystem.IsPublicHoliday(DateTime.Now, CountryCode.SI));
        public bool IsCameraPresent => (Camera_present().Result);
        public Exception Ex { get; set; }
        public bool Success { get; set; }
        public string Result { get; set; }
        public StorageFile File { get; set; }
        public sbyte Flag { get; set; }
        #endregion
        public Tools()
        {
            Flag = 0;
        }
        #region USTVARI DATOTEKE
        public void CreateLocalDB()
        {
            //create sqlite database
            SqliteEngine.UseWinSqlite3();
            SQLite offline_baza = new SQLite();
          //  StorageFile SqliteDatabase = await ApplicationData.Current.LocalFolder.CreateFileAsync("iFe.sqlite", CreationCollisionOption.ReplaceExisting);
        }
        #endregion
        #region SPLOŠNE METODE
        #region METODE KI VRAČAJO LIST<OBJEKT>
        public List<Zaposlen> GetEmployeesBasedOnType(string content, List<Zaposlen> all_employees )
        {
           return (all_employees.Where(a_emp => a_emp.TipZaposlenega == content)).ToList();
        }
        public List<string> GetSiteContent(byte type,string uri)
        {         
            if(!NetAndWiFi)
            {
                Ex = new Exception("Preverite ali ste povezani z internetom preko povezave WiFi."); // ni interneta
                return null;
            }
            List<string> Content = new List<string>();

            Stream stream = GetResponse(uri).Result.GetResponseStream();
            string result = "";

            using (StreamReader sr = new StreamReader(stream))
                                            result = sr.ReadToEnd();
            
            HtmlDocument MobileDocument = new HtmlDocument();
            MobileDocument.LoadHtml(result);
            try
            {
                switch (type)
                {
                    case 1:
                        var images = MobileDocument.DocumentNode.SelectNodes("//img[@class='pull-right']");
                                                 
                        foreach (var image in images)
                            Content.Add(image.Attributes[@"title"].Value);
                        break;
                    case 2:
                        List<string> headers = new List<string>(), soups = new List<string>(), meals = new List<string>();
                        Parallel.Invoke(
                            () =>
                            {
                                var h5 = MobileDocument.DocumentNode.SelectNodes("//strong[@class=' color-blue']");
                                foreach (var h in h5)
                                    headers.Add(h.InnerText);
                            },
                            () =>
                            {
                                var soup = MobileDocument.DocumentNode.SelectNodes("//ul[@class='list-unstyled']/li/i[@class='text-bold color-dark icon-food-090']");
                                foreach (var s in soup)
                                    soups.Add(s.InnerText);
                            },    
                            () =>
                            {
                                var meal = MobileDocument.DocumentNode.SelectNodes("//i[@class='text-bold color-dark']");
                                foreach (var m in meal)
                                    if (m.InnerText != "")
                                        meals.Add(m.InnerText);
                            });
                       

                            sbyte legth = Convert.ToSByte(meals.Count);
                            for (int i = 0; i < headers.Count; i++)
                            {
                                if (i + 1 == headers.Count)
                                    Content.Add(headers[i] + Environment.NewLine + soups[i] + Environment.NewLine + meals[i]);
                                else
                                    Content.Add(headers[i] + Environment.NewLine + soups[i] + Environment.NewLine + meals[i]);
                            }
                        break;
                    default: throw new NotImplementedException();
                }
            }
            catch (NullReferenceException e)
            {
                Ex = new NullReferenceException();
                return null;
            }                            
         return Content;
        }
        #endregion
        #region METODE TIPA ASYNC TASK
        private async Task<WebResponse> GetResponse(string uri)
        {
                return await WebRequest.Create(uri).GetResponseAsync();
        }
        private async Task<bool> Camera_present()
        {
           var devices = await DeviceInformation.FindAllAsync(DeviceClass.VideoCapture);
           return (devices.Count >= 1);
          
        }
        #endregion
        #endregion
        #region PODATKOVNI PRENOS
        public void MailAndFTP(string room, string description, string photo)
        {
            Parallel.Invoke(() => SendMail(room, description,photo));
        }
        private async void SendMail(string room, string description, string filename)
        {
            try
            {
                SmtpClient client = new SmtpClient();
                SmtpMail mail = new SmtpMail("Porocilo o škodi");
                SmtpServer mail_server = new SmtpServer("smtp.live.com");
                Attachment a = new Attachment();
                mail.From = new MailAddress("aleksander.kovac97@hotmail.com");

                Parallel.Invoke(
                    () =>
                    {
                        mail.To.Add("ak3900@student.uni-lj.si");
                        mail.Subject = "V prostoru " + room + " je nastala škoda: ";
                        mail.TextBody = description;  
                    },
                    () =>
                    {
                        mail_server.Port = 25;
                        mail_server.Password = "Phoenix176";
                        mail_server.User = "aleksander.kovac97@hotmail.com";
                        mail_server.ConnectType = SmtpConnectType.ConnectSTARTTLS;
                    });

                await mail.AddAttachmentAsync(filename);
                await client.SendMailAsync(mail_server, mail);
                Result = "Obvestilo uspesno poslano!";
            }
            catch (Exception e)
            {
                e = Ex; Success = false;
                Result = "Zgodila se je napaka";
            }
        }
        private async void SendToFTP(string photo)
        {
            Uri uri = new Uri("ftp://83.212.126.172");
            FtpClient client = new FtpClient();
            await client.ConnectAsync(new HostName(uri.Host),"1026","Administrator", "8KINtGoV7s");

          /*  byte [] data;
            await Task.Run(() =>
            {



            }


            );*/

            //await client.UploadAsync(uri.AbsolutePath, data);
        }
        #endregion
    }
    #region CLASSI ZA OBJEKTE
    class Zaposlen
    {
        public int ID { get; set; }
        public string Ime { get; set; }
        public string Priimek { get; set; }
        public string Eposta { get; set; }
        public string Telefonska { get; set; }
        public string GovorilneUre { get; set; }
        public string Prostor { get; set; }
        public string Naziv { get; set; }
        public string TipZaposlenega { get; set; }
        public string Laboratorij { get; set; }
        public string Tajnica { get; set; }
        public string Vloga { get; set; }
    }
    #endregion
}


    
     

