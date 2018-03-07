using Microsoft.Data.Sqlite.Internal;

using Nager.Date;
using HtmlAgilityPack;

using System;
using System.Collections.Generic;
using System.Globalization;
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




//FTP spisan po vzorčni kodi
//https://github.com/kiewic/FtpClient/blob/master/FtpClientSample/FtpClient.cs
namespace Aplikacija_iFE
{
    class Tools
    {
        #region KONSTRUKTORJI
        public Tools() { }
        public Tools(string url, string[] keys, string[] values)
        {
            POSTvalues.Clear();
            for (int i = 0; i < keys.Length; i++)
            {
                POSTvalues.Add(keys[i], values[i]);
            }
            this.url = url;
           
        }
        #endregion
        #region ATRIBUTI
        private static ConnectionCost connectionhost = NetworkInformation.GetInternetConnectionProfile().GetConnectionCost();
        private static DateTimeFormatInfo datetimeinfo = new CultureInfo("sl-SI").DateTimeFormat;
        private static HttpClient client;

        private string url;

        #endregion
        #region PROPERTIES
        public Exception Ex { get ; set; }
        public bool Success { get;set; }
        public string Result { get; set; }
        public StorageFile File { get; set; }
        public sbyte Flag { get; set; }
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
                        return WorkingDays;
                    i++;
                }
                return WorkingDays;
            }
        }

        public bool IsCameraPresent => (Camera_present().Result);
        public string POSTDATA => (StringFromPost().Result);


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
            {5, "Zapisi o študentu v podatkovni bazi ne obstajajo!" },{6, "Uspešno prijavljen!" }, {7,"Dan v tednu (Sobota/Nedelja) ni veljavna izbira!"},
            {127,"Napake ni zabelezene v bazi" }
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
            return ErrorDescriptions[127];
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
         }*/
       
        #endregion
        #region METODE TIPA ASYNC TASK
      
        private async Task<bool> Camera_present() { return ((await DeviceInformation.FindAllAsync(DeviceClass.VideoCapture)).Count >= 1);}
        //Naredi private
        public async Task<string> StringFromPost()
        {
            if(!NetAndWiFi)
            {
                return GetErrorDescription(1);

            }
            HttpFormUrlEncodedContent content = new HttpFormUrlEncodedContent(POSTvalues);
            HttpResponseMessage response = new HttpResponseMessage();
            try
            {
             HttpClient   client = new HttpClient();
                response = await client.PostAsync(new Uri(url), content);
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
                        response = await client.PostAsync(new Uri(url), content);
                    }
                    catch
                    {
                        continue;
                    }
                }
                client = new HttpClient(filter);
                response = await client.PostAsync(new Uri(url), content);
            }
            finally
            {
                client.Dispose();
            }
            if (response.Content.ToString() != "N/A")
                return response.Content.ToString();
            return "Vsebine ni mogoče prikazati! Preverite vašo WiFi povezavo!";
        }
        //Naredi private, probaj vrnit objekt.
        public async Task<List<Menu>> GetSiteContent(byte type, string url)
        {
            List<Menu> m = new List<Menu>();
            if (!NetAndWiFi)
            {
                GetErrorDescription(1);
                return null;
            }

            HttpClient client = new HttpClient();
            HttpResponseMessage response = await client.GetAsync(new Uri(url));
            string HTML = await response.Content.ReadAsStringAsync();


            HtmlDocument MobileDocument = new HtmlDocument();
            MobileDocument.LoadHtml(HTML);
            try
            {
                switch (type)
                {
                    default:
                    case 1:

                        HtmlNodeCollection images = MobileDocument.DocumentNode.SelectNodes("//img[@class='pull-right']");
                        HtmlNodeCollection headers = MobileDocument.DocumentNode.SelectNodes("//strong[@class=' color-blue']");
                        HtmlNodeCollection soup = MobileDocument.DocumentNode.SelectNodes("//ul[@class='list-unstyled']/li/i[@class='text-bold color-dark icon-food-090']");
                        HtmlNodeCollection meal = MobileDocument.DocumentNode.SelectNodes("//i[@class='text-bold color-dark']");

                     
                        List<string> meals = new List<string>();
                        for (int k = 0; k < meal.Count;k++)
                        {
                            if(meal[k].InnerText!="")
                                meals.Add(meal[k].InnerText);
                        }
                        for ( byte i = 0; i < images.Count; i++)
                        {
                            if (i + 1 == images.Count)
                            {
                               m.Add(new Menu(headers[i].InnerText.Remove(1, 7), soup[i].InnerText, meals[i], meal[images.Count + 1].InnerText, images[i].Attributes[@"title"].Value));
                            }
                            else
                            {
                                m.Add(new Menu(headers[i].InnerText.Remove(1, 7), soup[i].InnerText, meals[i], null, images[i].Attributes[@"title"].Value));
                            }
                        }
                        break;
                }

            }
            catch (Exception e) {return null;} finally { client.Dispose(); }
            return m;
        }
        }
        #endregion
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
         }
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
        }*/
        #endregion
    }



    
     

