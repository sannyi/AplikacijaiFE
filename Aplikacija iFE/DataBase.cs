using Microsoft.Data.Sqlite;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aplikacija_iFE
{
    class MySQL
    {
        public MySQL()
            {
            Connection = new MySqlConnection(ConnectionString);
            }
        private const string ConnectionString = "server=83.212.126.172;user=root;database=ife;password=iFE2017";
        private MySqlConnection Connection = new MySqlConnection();
    
        public int Count(string TableName,string [] Parameters)
        {
            MySqlCommand Command = new MySqlCommand();
           
            int Counter = 0;
            
            switch (TableName)
            {
                
                case "student":
                    if (Parameters[0].Length == 8 && (int.TryParse(Parameters[0], out Counter)))
                    {
                        if(int.TryParse(Parameters[0],out Counter)) { return -1; }
                        Command.CommandText = "SELECT COUNT(*) FROM student WHERE ID=@ID" ;
                        Command.Parameters.AddWithValue("@ID", int.Parse(Parameters[0]));
                    }
                   /* else if ((Parameters[0].Length == 24 && Parameters[0].Contains("@")) || 
                        (Parameters[0].Length==6 && int.TryParse(Parameters[0].Substring(2,4),out Counter))|| 
                        (Parameters[0].Length == 4 && (int.TryParse(Parameters[0], out Counter))))
                        {
                            
                            if (Parameters[0].Length == 24 && Parameters[0].Contains("@"))
                            {
                            Parameters[0] = Parameters[0].Substring(2, 4);
                        }
                            else if(Parameters[0].Length == 6 && int.TryParse(Parameters[0].Substring(0, 4), out Counter))
                            {
                            Parameters[0] = Parameters[0].Substring(2, 4);
                        }
                            Command.CommandText="SELECT COUNT(*) FROM student WHERE "
                            else { return 0; }
                        }*/
                         else { return 0; }
                    string hashed = new Tools().TextToHash("SHA265", Parameters[1]);
                    //naredi hash
                    Command.Parameters.AddWithValue("@Geslo",new Tools().TextToHash("SHA256", Parameters[1]).ToLower());

                    break;
                default:
                    throw new Exception();

            }
            Command.Connection = Connection;
            try { Connection.Open(); Counter = int.Parse(Command.ExecuteScalar().ToString());}
            catch(Exception e) {
                Counter = 0; e.ToString();

            }
            finally { Connection.Close(); }
            return Counter;
        }
   /*     public Student ReturnStudent(sbyte CredentialType,string [] Parameters)
        {
            MySqlCommand Commmand = new MySqlCommand();
            switch(CredentialType)
            {
                case 1: //id
                   Command.CommandText = "SELECT * FROM student WHERE ID=@ID AND Geslo=@Geslo";
                    Command.Parameters.AddWithValue("@ID", int.Parse(Parameters[0]));
                    break;
             case 2: Ne vem kako je implementirano drugje - samo id sprejmememo
                    break;
                default: throw new Exception();
            }
            Command.Parameters.AddWithValue("@Geslo", new Tools().TextToHash("SHA256", Parameters[1]));
            Command.Connection = Connection;
            Student s;
            s = null; //!!!!!!!!!!!!!!!!!!!!!!!
            
            try
            {
                Connection.Open();
                MySqlDataReader reader = Command.ExecuteReader();
                while(reader.Read())
                                 s = new Student(reader.GetInt32("ID"), reader.GetString("Ime"), reader.GetString("Priimek"), reader.GetString("StudentskiMail"), reader.GetString("Telefonska"),reader.GetString("Geslo"));
                
            }
            catch
            {
                s = null;
               //ERRORHANDLING !!!!!!!!!!!!!!
            }
            finally
            {
                Connection.Close();
            }
            return s;


        }*/
        public List<Zaposlen> ReturnEmployees()
        {
            List<Zaposlen> Z = new List<Zaposlen>();
            return Z;
        }
    }
#region SQLITE
    class SQLite
    {
        private string[] queries;
        private static string SQLitePath => Path.Combine(Windows.Storage.ApplicationData.Current.LocalCacheFolder.Path, "iFE.sqlite");
        SqliteConnection Conn => new SqliteConnection("Filename=" + SQLitePath);
        Tools b = new Tools();
        
        #region KONSTRUKTORJI
        public SQLite()
        {


            string path = Path.Combine(Windows.Storage.ApplicationData.Current.LocalFolder.Path, "iFE.sqlite");
            if (!File.Exists(SQLitePath))
            {
                CreateDatabase();

            }
        }
        #endregion
        #region METODE
        public void CreateDatabase()
        {
            b.CreateLocalDB();
        queries = new string[] {
                    "CREATE TABLE Settings (OnlyWifi TINYINT NOT NULL , Language VARCHAR(2) NOT NULL DEFAULT 'si', Certificate VARCHAR(40) NOT NULL DEFAULT 'c', Password VARCHAR(50) NOT NULL DEFAULT 'sha1')",
                    "CREATE TABLE User( ID INTEGER NOT NULL, Surname CHAR(50) NOT NULL, Name CHAR(50) NOT NULL, Email CHAR(20) NOT NULL, Password CHAR(40) NOT NULL)" };

            foreach (string a in queries)
            {
                Conn.Open();
                SqliteCommand command = new SqliteCommand(a, Conn);
                try { command.ExecuteNonQuery(); }
                catch (SqliteException Exception)
                {
                   
                }
                finally
                {
                    Conn.Close();
                }
            }
            Conn.Close();
        }
        public void SetAllToDefault()
        {
            queries = new string[] { "UPDATE User SET ID = 0, Surname = '', Name = '', Email = '', Password = '';", "UPDATE Settings  SET OnlyWifi= 1, Language = 'si', Certificate = 'c:', SHA1Certif = 'sha1';" };
            SqliteCommand command = new SqliteCommand(){Connection = Conn};
            Conn.Open();
            foreach (string a in queries)
            {
                command.CommandText = a;
                try { command.ExecuteReader(); } catch { Conn.Close(); }
            }
            Conn.Close();
        }
        public void UpdateSettings(byte column, string value)
        {
            string collumn_name;
            switch (column)
            {
                case 0:
                case 1: collumn_name = "OnlyWifi"; if (value.ToLower().Contains("false") || value.ToLower().Contains("true")) { if (value.ToLower().Contains("true")) { column = 1; } else { column = 0; } } else { throw new Exception(); } break;
                case 2: collumn_name = "Language"; break;
                case 3: collumn_name = "Certificate"; break;
                case 4: collumn_name = "Password"; break;
                default: throw new Exception();
            }
            if (column == 1 || column == 0) { queries = new string[] { "UPDATE Settings SET '" + collumn_name + "'='" + column + "'" }; }
            else { queries = new string[] { "UPDATE Settings SET '" + collumn_name + "'='" + value + "'" }; }
            Conn.Open();
            SqliteCommand command = new SqliteCommand(queries[0], Conn);
            try { command.ExecuteNonQuery(); } catch (Exception e) { e.ToString(); } finally { Conn.Close(); }

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
