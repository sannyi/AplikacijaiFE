using Microsoft.Data.Sqlite.Internal;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using Windows.Devices.Enumeration;
using Windows.Networking;
using Windows.Networking.Connectivity;
using Windows.Security.Cryptography;
using Windows.Security.Cryptography.Core;
using Windows.Storage;
using Windows.Storage.Streams;
//od tu naprej  je vprašljiva licenca;
using Nager.Date;
using HtmlAgilityPack; //licenca




//FTP spisan po vzorčni kodi
//https://github.com/kiewic/FtpClient/blob/master/FtpClientSample/FtpClient.cs
namespace Aplikacija_iFE
{
    class Tools
    {
        #region ATRIBUTI
        private ConnectionCost connectionhost = NetworkInformation.GetInternetConnectionProfile().GetConnectionCost();
        public bool NetAndWiFi => (NetworkInterface.GetIsNetworkAvailable() && NetworkInformation.GetInternetConnectionProfile().IsWlanConnectionProfile || (connectionhost.NetworkCostType == NetworkCostType.Unknown || connectionhost.NetworkCostType == NetworkCostType.Unrestricted));
        public bool SaturdaySundayOrHoliday => (DateTime.Today.DayOfWeek == DayOfWeek.Saturday || DateTime.Today.DayOfWeek == DayOfWeek.Sunday || DateSystem.IsPublicHoliday(DateTime.Now, CountryCode.SI));
        public bool IsCameraPresent => (Camera_present().Result);
        public Exception Ex { get; set; }
        public bool Success { get; set; }
        public string Result { get; set; }
        public StorageFile File { get; set; }
        public sbyte Flag { get; set; }
        /*
         * 
         * 
         * 
         * 
         * 
         * Flag = 5 > ni študenta
         * Flag = 6 > študent je v bazi
         * Flag
         * */
        #endregion
        public Tools()
        {
            Flag = 0;
        }
        public string Errors(int Flag)
        {
            switch(Flag)
            {
                case 5:
                    return "Zapisi o študentu v PB ne obstajo";
                case 6:
                    return "Uspešno prijavljen";
                default:
                    throw new Exception();
            }
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


        #region VOID METODE
        public void GetCredentialsAndUpdateDatabase(string credential, string password)
        {
            string original_passoword = password;
            string SHA1password = TextToHash("SHA1", password);
            string AES = Encrypt(SHA1password.ToUpper());
            int type;
            if (credential.Length == 8)
                type = 1;
            else
            {
                credential = credential.Substring(0, 6);
                type = 2;
            }
                    /*
             1 pošlji query na server in dobi response ,v primeru, da je vse null daj flag (definiraj jih) sicer posodobi SQLite DB
             
             
             */
        



            

        }


        #endregion
        #region METODE KI VRAČAJO LIST<OBJEKT>
        public List<Zaposlen> GetEmployeesBasedOnType(string type_of_employee, List<Zaposlen> all_employees)
        {
            foreach (Zaposlen e in all_employees.ToList())
                if (e.TipZaposlenega != type_of_employee)
                    all_employees.Remove(e);
            //ČISTA LINQ METODA, BREZ ZANK !!!!!!!!!!!!!!!!!!!!
            return all_employees;
        }
        public List<string> GetSiteContent(byte type, string uri)
        {
            if (!NetAndWiFi)
            {
                Ex = new Exception("Preverite ali ste povezani z internetom preko povezave WiFi."); // ni interneta
                return null;
            }
            List<string> Content = new List<string>();

            string result = "";

            using (StreamReader sr = new StreamReader(GetResponse(uri).Result.GetResponseStream()))
                result = sr.ReadToEnd();

            HtmlDocument MobileDocument = new HtmlDocument();
            MobileDocument.LoadHtml(result);
            try
            {
                switch (type)
                {
                    case 1:
                       HtmlNodeCollection images = MobileDocument.DocumentNode.SelectNodes("//img[@class='pull-right']");
                        foreach (HtmlNode image in images)
                            Content.Add(image.Attributes[@"title"].Value);
                        break;
                    case 2:
                        List<string> headers = new List<string>(), soups = new List<string>(), meals = new List<string>();
                        Parallel.Invoke(
                            () =>
                            {
                                HtmlNodeCollection h5 = MobileDocument.DocumentNode.SelectNodes("//strong[@class=' color-blue']");
                                foreach (HtmlNode h in h5)
                                    headers.Add(h.InnerText);
                            },
                            () =>
                            {
                                HtmlNodeCollection soup = MobileDocument.DocumentNode.SelectNodes("//ul[@class='list-unstyled']/li/i[@class='text-bold color-dark icon-food-090']");
                                foreach (HtmlNode s in soup)
                                    soups.Add(s.InnerText);
                            },
                            () =>
                            {
                                HtmlNodeCollection meal = MobileDocument.DocumentNode.SelectNodes("//i[@class='text-bold color-dark']");
                                foreach (HtmlNode m in meal)
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
      
    
        private async void SendToFTP(string photo)
        {
            Uri uri = new Uri("ftp://83.212.126.172");
            FtpClient client = new FtpClient();
            await client.ConnectAsync(new HostName(uri.Host), "1026", "Administrator", "8KINtGoV7s");

            /*  byte [] data;
              await Task.Run(() =>
              {



              }


              );*/

            //await client.UploadAsync(uri.AbsolutePath, data);
        }
        #endregion
        #region Kriptografija
        private string Encrypt(string text)
        {
            string CRYPTOPASS = "E8CA77DA07CB749474775F5ADACFF45A771E16D2C7566544EF2AAE81BE1ADAAF";
            byte[] clearBytes = Encoding.Unicode.GetBytes(text);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(CRYPTOPASS, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Dispose();
                    }
                    text = Convert.ToBase64String(ms.ToArray());
                }
            }
            return text;
        }
        public string TextToHash(string algorithm, string text)
        {
            IBuffer buffUTF8Msg = CryptographicBuffer.ConvertStringToBinary(text, BinaryStringEncoding.Utf8);
            HashAlgorithmProvider objAlgProv = HashAlgorithmProvider.OpenAlgorithm(algorithm);
            string algorithmUsed = objAlgProv.AlgorithmName;
            IBuffer buffHash = objAlgProv.HashData(buffUTF8Msg);
            if(buffHash.Length != objAlgProv.HashLength)
            {
                throw new Exception("Napaka pri kreiranju HASHA");
            }
            return CryptographicBuffer.EncodeToBase64String(buffHash);
        }
        #endregion
    }
  
}

    
     

