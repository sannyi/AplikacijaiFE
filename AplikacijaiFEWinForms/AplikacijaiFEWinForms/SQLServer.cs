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
        public List<int> IDZaposlenih { get; set; }

        SqlConnection povezava = new SqlConnection("Data Source=83.212.126.172\\SQLEXPRESS;Initial Catalog=iFE;User id=sa;Password=iFE2016");
        SqlCommand cmd;
        List<string> s;
        DataTable dt;
        SqlDataAdapter da;


        public List<int> DobiIdZaposlenega(string ime,string priimek)
        {
            Uspeh = true;
            List<int> a = new List<int>();
            

            return a;
        }
        public List<string> ImeInPriimekZaposlenega(string tipzaposlenega)
        {
            List<string> a = new List<string>();
            Uspeh = true;
           cmd = new SqlCommand("SELECT * FROM dbo.fnDobiVseZaposlene()", povezava);
            cmd.CommandType = CommandType.Text;

            try
            {
                povezava.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                { 

                    while (reader.Read())
                    {
                        a.Add(reader.GetString(0));
                        IDZaposlenih.Add(reader.GetInt32(1));
                    }

                    reader.Close();
                }
               

                //DEFINIRAJ UKAZ
              
            }
            catch (Exception e)
            {
                ex = e;
            }
            finally
            {
                povezava.Close();
               
            }
            return a;


        }
      
        /* public List<string> ImeInPriimekZaposlenega(string TipZaposlenega)
         {
             List<string> a = new List<string>();




             return a;
         }*/
        public List<string> PodatkiZaposlenega(string TipZaposlenega)
        {
            Uspeh = true;
            List<string> a = new List<string>();




            return a;
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
            try{
                Uspeh = true;
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                ex = e; Uspeh = false;
            }
            finally {
                povezava.Close();
            }
        }
        public List<string> DobiDogodke()
        {
            s = new List<string>();
            try
            {

                Uspeh = true;
                povezava.Open();
                cmd = new SqlCommand();
                cmd.Connection = povezava;
                cmd.CommandText = "SELECT * FROM Dogodki";
                dt = new DataTable();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    s.Add(dr["Ime dogodka"].ToString() + " " + dr["Datum2"].ToString());
                }
            }
            catch (Exception e)
            {
                ex = e;
                Uspeh = false;
            }
            finally
            {
                povezava.Close();
            }
            if(Uspeh)
            {
                return s;
            }
            else
            {
                return null;
            }
            
        }
        public string Dobi_dogodek(string ime,string datum)
        {
            string a="";
            cmd = new SqlCommand("SELECT * FROM dbo.DobiDogodek(@Ime,@Datum)",povezava);

            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Ime", ime);
            cmd.Parameters.AddWithValue("@Datum", datum);
            try
            {
                SqlDataReader Reader = cmd.ExecuteReader();
                while(Reader.Read())
                {

                    a = Reader.GetString(0)+" "+Reader.GetString(1)+" "+Reader.GetString(3).ToString();
                    
                        }
                    Uspeh = true;
            }
            catch (Exception e)
            {
                ex = e;
            }
            finally
            {
                povezava.Close();
            }

            return a;
        }
    }
}
