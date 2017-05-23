using SQLite.Net.Attributes;
using System;

using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;
using System.Net.NetworkInformation;
using System.Threading.Tasks;


using System.Xml;
using Windows.Storage;

namespace Aplikacija_iFE
{
    class tools
    {
        #region SPREMENLJIVKE
        byte counter=0;
        #endregion
        
        #region XML FILE
      
        #endregion
        #region DELO S HRAMBO
        #endregion
        #region DELO S PODATKOVNO BAZO
        /*

namespace Aplikacija_iFE
{
class remote_database
{
    private void connect_to_remote_db()
    {
    }
    //creating & connecting to the local database with table creating, data insertion, selection and manipulation
    private string[] get_menu_for_today()
    {
        return null;
    }
    private string[][] get_instructors()
    {
        return null;
    }
    private string[] get_info_about_instructor(string name, string surname)
    {
        return null;
    }
}
class local_sqlite_database
{
    public string email { get; set; }
    public string password { get; set; }
    public int index_number { get; set; }

    //Add props to the student: Name and surname, ID, password (encrypted), and all other data
    //connect to the db
    private void db_connection()
    {

    }
    //create a local table student and fill it with mandatory data like
    public void create()
    {
        var path = Path.Combine(Windows.Storage.ApplicationData.Current.LocalFolder.Path, "lokalna_ife_baza.db");
        using (SQLite.Net.SQLiteConnection connection = new SQLite.Net.SQLiteConnection(new SQLite.Net.Platform.WinRT.SQLitePlatformWinRT(), path))
        {
            connection.CreateTable<Student>();
        }
    }
    //gets the desired value of the specified column
    private string get_value(string column)
    {

        return column;
    }
    private void insert_into_db(string column, string value)
    {

    }
    private void update_db()
    {

    }

}
//classes (tables) for the database;
public class Student
    {
        public string email { get; set; }
        public string password { get; set; }
        public string index_number { get; set;}
    }


}

         * 
         * 
         * 
         * 
         * */
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
    public class SQLServer
    {
        

        SqlConnection cs = new SqlConnection("Data Source=tcp:83.212.126.172;Initial Catalog=iFE;User ID=sa;Password=iFE2016");

        public List<string> ReturnTypeOfStaff()
        { 
          
            List<string> a = new List<string>();
            SqlCommand cmd = new SqlCommand("SELECT iFE.dbo.fnDobiVseTipeZaposlenih",cs);
            SqlDataReader reader;
           
            cmd.Connection = cs;
            try
            {
                cs.Open();
                reader = cmd.ExecuteReader();

                    while(reader.Read())
                    {
                    var TypeOfStaff = reader.GetString(0);
                    a.Add(TypeOfStaff);
                    }
            }
        
            finally
            {
                cs.Close();
            }
    
            return a;
        }
             
    }
 public class SQLite
    {

    }
}
