using Microsoft.Data.Sqlite.Internal;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;


using System.Net.NetworkInformation;


using System.Threading.Tasks;
using Windows.Devices.Enumeration;

using Windows.Networking.Connectivity;
using Windows.Security.Cryptography;
using Windows.Security.Cryptography.Certificates;
using Windows.Security.Cryptography.Core;
using Windows.Storage;
using Windows.Storage.Streams;
using Windows.Web.Http;
using Windows.Web.Http.Filters;
//od tu naprej  je vprašljiva licenca;
using Nager.Date;
using HtmlAgilityPack; //licenca
using System.Globalization;




//FTP spisan po vzorčni kodi
//https://github.com/kiewic/FtpClient/blob/master/FtpClientSample/FtpClient.cs
namespace Aplikacija_iFE
{
    class Tools
    {
        #region ATRIBUTI
        private static ConnectionCost connectionhost = NetworkInformation.GetInternetConnectionProfile().GetConnectionCost();
        private static DateTimeFormatInfo datetimeinfo = new CultureInfo("sl-SI").DateTimeFormat;
        private static HttpClient client = new HttpClient();
      

        public bool NetAndWiFi => (NetworkInterface.GetIsNetworkAvailable() && NetworkInformation.GetInternetConnectionProfile().IsWlanConnectionProfile || (connectionhost.NetworkCostType == NetworkCostType.Unknown || connectionhost.NetworkCostType == NetworkCostType.Unrestricted));
        public bool SaturdaySundayOrHoliday => (DateTime.Today.DayOfWeek == DayOfWeek.Saturday || DateTime.Today.DayOfWeek == DayOfWeek.Sunday || DateSystem.IsPublicHoliday(DateTime.Now, CountryCode.SI));

        public List<string> WorkingDays
        {
            get
            {
                byte i = 0;
                DateTime Today = DateTime.Now;

                while (DateTime.Today.DayOfWeek != DayOfWeek.Saturday || DateTime.Today.DayOfWeek != DayOfWeek.Sunday)
                {
                    WorkingDays.Add(DateTimeFormatInfo.CurrentInfo.GetDayName(Today.AddDays(i).DayOfWeek));
                    if (Today.AddDays(i + 1).DayOfWeek == DayOfWeek.Saturday)
                        break;
                    i++;
                }

                return WorkingDays;
            }
        }
        public bool IsCameraPresent => (Camera_present().Result);
        #endregion
        #region PROPERTIES
       
        public Exception Ex { get ; set; }
        public bool Success { get;set; }
        public string Result { get; set; }
        public StorageFile File { get; set; }
        public sbyte Flag { get; set; }


        #endregion
        #region SLOVARJI

        private static Dictionary<string, string> POSTvalues = new Dictionary<string, string>();
        private static Dictionary<string, byte> Days = new Dictionary<string, byte>
        {
            {"Ponedeljek",1 }, {"Torek",2}, {"Sreda",3},{"Četrtek",4},{"Petek",5}
        };
        private static Dictionary<byte, string> ErrorDescriptions = new Dictionary<byte, string>
        {   {0, "OK"},
            {1, "Napake internetne povezave." },{2,"Vnos ni vpisna številka!" },
            {5, "Zapisi o študentu v podatkovni bazi ne obstajajo!" },{6, "Uspešno prijavljen!" }, {7,"Dan v tednu (Sobota/Nedelja) ni veljavna izbira!"}
        };
       

        #endregion
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
        #region NON VOID METODE
        public byte GetDayNumber(string Day)
        {
            if (Days.ContainsKey(Day))
                return Days[Day];
            return 7;
        }
        public string GetErrorDescription(byte Code)
        {
            if (ErrorDescriptions.ContainsKey(Code))
                return ErrorDescriptions[Code];
            return "Opisa napake v slovarju napak (še) ni. V primeru, da se je zgodila napaka, razvijalcu aplikacije pošljite opis napake s screenshotom vred.";
        }
        #endregion

        #region VOID METODE
        public void GetCredentialsAndUpdateDatabase(string credential, string password)
        {
            /*
            // string original_passoword = password;
            //string SHA1password = TextToHash("SHA1", password);
            // string AES = Encrypt(SHA1password.ToUpper());
            MySQL prijava = new MySQL();
            tester = prijava.Count("student", new string[]  { credential, password });
            if (tester == 0)  {Flag = 5;return;}
            else if (tester == -1) { Flag = 2; }
            else
            {
                Student s;
             /*   if(credential.Length==24 || credential.Length==6)                  
                        credential = credential[2].ToString() + credential[3].ToString() + credential[4].ToString() + credential[5].ToString();

             //   s = prijava.ReturnStudent(1, new string[] { credential, password });
            }*/







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
        }//DELA

        /* public List<string>[] GetLunchForDayOfWeek(byte day)
         {
             List<string>[]  = new List<string>[]; // 
             if(!NetAndWiFi)
             {
                 Flag = 1;
                 return null;
             }
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
         }*/
        #endregion
        #region METODE TIPA ASYNC TASK
        /*private async Task<WebResponse> GetResponse(string uri)
        {
            return await WebRequest.Create(uri).GetResponseAsync();
        }*/
        private async Task<bool> Camera_present()
        {
            DeviceInformationCollection devices = await DeviceInformation.FindAllAsync(DeviceClass.VideoCapture);
            return (devices.Count >= 1);

        }
        #endregion
        #endregion
        #region PODATKOVNI PRENOS
        //funkcija za pridobitev JSON stringa za parsanje 
        public async Task<string>StringFromPost(string url,string script, string [] keys, string [] values)
        {
            if(keys.Length!=values.Length)
            {
                return "Stevilo kljucev in vrednosti se morata ujemati!";
            }
            POSTvalues.Clear();
            for(int i=0;i<keys.Length; i++)
            {
                POSTvalues.Add(keys[i],values[i]);
            }
           
            HttpFormUrlEncodedContent content = new HttpFormUrlEncodedContent(POSTvalues);
            HttpResponseMessage response = new HttpResponseMessage();
            try
            {
                client = new HttpClient();
                response = await client.PostAsync(new Uri(url + script), content);
            }
            catch (Exception e)
            {
                //TE FILTERJE UPORABLJATI SAMO IZKLJUČNO ZA TESTIRANJE
                HttpBaseProtocolFilter filter = new HttpBaseProtocolFilter();
                ChainValidationResult[] results = new ChainValidationResult[]
                {
                                ChainValidationResult.Untrusted,                    ChainValidationResult.WrongUsage,
                                ChainValidationResult.BasicConstraintsError,        ChainValidationResult.Expired,
                                ChainValidationResult.IncompleteChain,             ChainValidationResult.InvalidCertificateAuthorityPolicy,
                                ChainValidationResult.InvalidName,                  ChainValidationResult.OtherErrors,
                                ChainValidationResult.RevocationFailure,            ChainValidationResult.RevocationInformationMissing,
                                ChainValidationResult.Revoked,                      ChainValidationResult.UnknownCriticalExtension
                };

                for (int i = 0; i < results.Length; i++)
                {
                    try
                    {
                        filter.IgnorableServerCertificateErrors.Add(results[i]);
                        client = new HttpClient(filter);
                        response = await client.PostAsync(new Uri(url + script), content);
                    }
                    catch
                    {
                        continue;
                    }
                }
                client = new HttpClient(filter);
                response = await client.PostAsync(new Uri(url +script), content);
            }
            finally
            {
                client.Dispose();
            }
            if(response.Content.ToString()!="NA")
               return response.Content.ToString();
            return "Vsebine ni mogoče prikazati! Preverite vašo WiFi povezavo!";
        }
        /*   private async void SendToFTP(string photo)
        {
            Uri uri = new Uri("ftp://83.212.126.172");
            FtpClient client = new FtpClient();
            await client.ConnectAsync(new HostName(uri.Host), "1026", "Administrator", "8KINtGoV7s");

            /*  byte [] data;
              await Task.Run(() =>
              {



              }


              );

            //await client.UploadAsync(uri.AbsolutePath, data);
        }*/
        #endregion
        #region KRIPTO
        /* private string Encrypt(string text)
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
         }*/
        public string TextToHash(string algorithm, string text)
        {
            IBuffer buffUTF8Msg = CryptographicBuffer.ConvertStringToBinary(text, BinaryStringEncoding.Utf8);
            HashAlgorithmProvider objAlgProv = HashAlgorithmProvider.OpenAlgorithm(algorithm);
            string algorithmUsed = objAlgProv.AlgorithmName;
            IBuffer buffHash = objAlgProv.HashData(buffUTF8Msg);
            if (buffHash.Length != objAlgProv.HashLength)
            {
                throw new Exception("Napaka pri kreiranju HASHA");
            }
            return CryptographicBuffer.EncodeToBase64String(buffHash).ToLower();
        }
        #endregion
    }

}

    
     

