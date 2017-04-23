using SQLite.Net.Attributes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using Windows.Storage;

namespace Aplikacija_iFE
{
    class tools
    {
        //različna orodja

        //spremenljivke tipa get kot npr. default destination folder

        //     kot so shrani fotografijo 
        #region XML FILE
        
        public async Task create_XML_file()
        {
            XmlDocument document = new XmlDocument();
            XmlElement element = (XmlElement)document.AppendChild(document.CreateElement("Student"));
            element.SetAttribute("e-mail", "");
            element.SetAttribute("password", "");
            element.SetAttribute("index","");
            element.SetAttribute("certificate_path", "");
            
            // stackoverflow.com/questions/37065972 > poglej uradno stran od M$  
            using (FileStream fs = new FileStream("student.xml", FileMode.Create))
            {
                document.Save(fs);
            }
            
        }
       


        public void update_XML_file(string element, string value)
        {

        }
        #endregion
        #region DELO S HRAMBO
        public async Task save_files_to_windows_storage()
        {
            StorageFolder folder = ApplicationData.Current.LocalFolder;
            StorageFile file = await folder.CreateFileAsync("student.xml", CreationCollisionOption.ReplaceExisting);

        }
        #endregion
        #region DELO S PODATKOVNO BAZO
        /*
         * using SQLite.Net.Attributes;

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
        public bool connected_net()
        {

            return NetworkInterface.GetIsNetworkAvailable();
        }
        #endregion
    }
}
