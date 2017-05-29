using Microsoft.SqlServer.Server;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace AplikacijaiFEWinForms
{
    class SQLServer
    {
        public bool Uspeh { get; set; }
        public Exception ex {get; set; }

        SqlConnection povezava = new SqlConnection("Data Source=83.212.126.172\\SQLEXPRESS;Initial Catalog=iFE;User id=sa;Password=iFE2016");
        SqlCommand cmd;


        public List<int> DobiIdZaposlenega(string ime,string priimek)
        {
            List<int> a = new List<int>();
            

            return a;
        }
        public List<string> ImeInPriimekZaposlenega()
        {
            List<string> a = new List<string>();
           cmd = new SqlCommand("dbo.", povezava);

            try
            {
                povezava.Open();
                SqlDataReader reader;
                reader = cmd.ExecuteReader();
           

                //DEFINIRAJ UKAZ
                while (reader.Read())
                {
                 //   a.Add(reader.GetValues());
                }
            }
            catch (Exception e)
            {
                e.ToString();
            }
            finally
            {
                povezava.Close();
               
            }
            return a;

        }
        public List<string> ImeInPriimekZaposlenega(string TipZaposlenega)
        {
            List<string> a = new List<string>();




            return a;
        }
        public List<string> PodatkiZaposlenega(string TipZaposlenega)
        {
            List<string> a = new List<string>();




            return a;
        }
        public void DobiDogodke()
        {

        }
        public void VstaviSkodo(string opis, string prostor, int id_prijavitelja)
        {
            cmd = new SqlCommand("dbo.spVstaviSkodo",povezava);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Opis", opis);
            cmd.Parameters.AddWithValue("@Lokacija", prostor);
            cmd.Parameters.AddWithValue("@IDPrijavitelja", id_prijavitelja);

              //zenkra ne bo časa za ftp -> posodobi proceduro, posodobi to metodo      
            povezava.Open();
            try{ Uspeh = true; cmd.ExecuteNonQuery();}
            catch (Exception e) { ex = e; Uspeh = false; }
            finally { povezava.Close(); }
        }
    }
}
