using System;
using System.Collections.Generic;
using System.Net.NetworkInformation;
using System.Threading.Tasks;
using Windows.Networking;
using Windows.Networking.Connectivity;
using Windows.Storage;
using HtmlAgilityPack;
using EASendMailRT;

//FTP spisan po vzorčni kodi
//https://github.com/kiewic/FtpClient/blob/master/FtpClientSample/FtpClient.cs
namespace Aplikacija_iFE
{
    class Tools
    {
        #region ATRIBUTI
        public bool InternetConnection => NetworkInterface.GetIsNetworkAvailable();
        public bool IsWlanConnection => NetworkInformation.GetInternetConnectionProfile().IsWlanConnectionProfile;
        #endregion
        #region SPREMENLJIVKE
        public Exception Ex { get; set; }
        public bool Success { get; set; }
        public string Result { get; set; }
        public StorageFile File { get; set; }
        #endregion
        #region USTVARI DATOTEKE
        public async void CreateLocalDB()
        {
            StorageFile SqliteDatabase = await ApplicationData.Current.LocalFolder.CreateFileAsync("iFe.sqlite", CreationCollisionOption.ReplaceExisting);
        }
        #endregion
        #region SPLOŠNE METODE
        public List<string> Getdate()
        {/*
            List<string> a = new List<string>();
            DateTime[] dates = new DateTime[] { DateTime.Today, DateTime.Today.AddDays(1), DateTime.Today.AddDays(2)};
            foreach (DateTime date in dates)
            {
                if (date.DayOfWeek != DayOfWeek.Saturday && date.DayOfWeek != DayOfWeek.Sunday) 
                {
                    a.Add(date.ToString("dd. MMMM yyy"));
                }
                a.Add("Več na spletni strani");
            }
            return a;*/
            byte counter = 0;
            
            DateTime[] dates = new DateTime[] { DateTime.Today, DateTime.Today.AddDays(1), DateTime.Today.AddDays(2) };
                        foreach (DateTime date in dates)
                         {
                                if (date.DayOfWeek != DayOfWeek.Saturday && date.DayOfWeek != DayOfWeek.Sunday) { counter++; }
                         }
            
                    //lahko tudi dolocimo najprej samo tiste dneve,ko so vikendi, prazniki in odpadanje Pedgoškega procesa odpade
            string[] meaningful_dates = new string[counter + 1];
           counter = 0;
                       foreach (DateTime date in dates)
                       {
                           if (date.DayOfWeek != DayOfWeek.Saturday && date.DayOfWeek != DayOfWeek.Sunday)
                           {
           meaningful_dates[counter] = date.ToString("dd. MMMM yyy");
           counter++;
                           }
                       }
            meaningful_dates[counter++] = "Več na spletni strani";
            List<string> a = new List<string>();
            a.AddRange(meaningful_dates);
                         return a;
        }
        public List<string> GetTypesOfFood(string website)
        {
            List<string> TypesOfFood = new List<string>();

            HtmlDocument document = GetHtmlOfPage(website).Result;
            /* HtmlNode docNodes = document.DocumentNode;
             HtmlNode ul = docNodes.Element("id('ContentHolderMain_ContentHolderMainContent_ContentHolderMainContent_pnlDaily')/x:div/x:ol/x:li[1]/x:ul[@title]");*/


            HtmlNode div = document.GetElementbyId("ContentHolderMain_ContentHolderMainContent_ContentHolderMainContent_pnlDaily");
            if(div!=null)
            {
                var ul = div.Element("//div[@class='holderRestaurantInfo']/ol/li[1]/ul/@title").GetAttributeValue("title", "title");
                    string a = ul;

                TypesOfFood.Add(a);
            }
        

            return TypesOfFood;
        }
        private static async Task<HtmlDocument> GetHtmlOfPage(string website)
        {
               return await new HtmlWeb().LoadFromWebAsync(website);
        }
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
                Parallel.Invoke(
                    () =>
                    {
                        mail.From = new MailAddress("aleksander.kovac97@hotmail.com");
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
                    }
                    );

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

            byte [] data;
            await Task.Run(() =>
            {



            }


            );

            //await client.UploadAsync(uri.AbsolutePath, data);
        }
        #endregion
    }
}



    
        //https://github.com/kiewic/FtpClient/blob/master/FtpClientSample/FtpClient.cs


    
     

