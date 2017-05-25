using Microsoft.Data.Sqlite;
using Microsoft.Data.Sqlite.Internal;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Net.NetworkInformation;

namespace Aplikacija_iFE
{
    class tools
    {
        #region SPREMENLJIVKE
        byte counter=0;
        #endregion
        #region OSTALE FUNKCIJE IN METODE
        public bool Connected_net() { return NetworkInterface.GetIsNetworkAvailable();}

        public string [] Getdate()
        {
            DateTime[] dates = new DateTime[] { DateTime.Today, DateTime.Today.AddDays(1), DateTime.Today.AddDays(2) };
            foreach (DateTime date in dates)
            {
                if (date.DayOfWeek != DayOfWeek.Saturday && date.DayOfWeek != DayOfWeek.Sunday) { counter++;}           
            }

            //lahko tudi dolocimo najprej samo tiste dneve,ko so vikendi, prazniki in odpadanje Pedgoškega procesa odpade
            string[] meaningful_dates = new string[counter+1];
            counter = 0;
            foreach (DateTime date in dates)
            {
                if(date.DayOfWeek != DayOfWeek.Saturday && date.DayOfWeek != DayOfWeek.Sunday )
                {
                    meaningful_dates[counter] = date.ToString("dd. MMMM yyy");
                    counter++;
                }  
            }
            meaningful_dates[counter++] = "Več na spletni strani";
            return meaningful_dates;
         }
        #endregion
    }
  
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

    }
