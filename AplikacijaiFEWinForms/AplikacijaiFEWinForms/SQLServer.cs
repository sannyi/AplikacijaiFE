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

        public List<string> ImePriimekInIdZaposlenega(string tipzaposlenega)
        {
            s = new List<string>();
            Uspeh = true;
           cmd = new SqlCommand("SELECT * FROM dbo.fnZaposleniPoTipu(@TipZaposlenega)", povezava);
            cmd.Parameters.AddWithValue("@TipZaposlenega", tipzaposlenega);
            cmd.CommandType = CommandType.Text;

            try
            {
                povezava.Open();
                dt = new DataTable();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    s.Add(dr["ImeInPriimek"].ToString() + "ő" + dr["ID"].ToString());
                }

            }
            catch (Exception e)
            {
                ex = e;
            }
            finally
            {
                povezava.Close();
               
            }
            return s;
        }
      
      
        public List<string> PodatkiZaposlenega(int id)
        {
            Uspeh = true;
            s = new List<string>();
            cmd = new SqlCommand("SELECT * FROM dbo.fnKompletniZaposleni(@ID)", povezava);
            cmd.Parameters.AddWithValue("@ID", id);
            cmd.CommandType = CommandType.Text;

            try
            {
                povezava.Open();
                dt = new DataTable();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    s.Add(dr["ImeZaposlenega"].ToString());
                    s.Add(dr["PriimekZaposlenega"].ToString());
                    s.Add(dr["Eposta"].ToString());
                    s.Add(dr["GovorilneUre"].ToString());
                    s.Add(dr["Prostor"].ToString());
                    s.Add(dr["Naziv"].ToString());
                    s.Add(dr["TipZaposlenega"].ToString());
                    s.Add(dr["Laboratorij"].ToString());
                    s.Add(dr["Tajnica"].ToString());
                    s.Add(dr["Vloga"].ToString());
                    s.Add(dr["Telefonska"].ToString());
                    break;
                }
            }
            catch(Exception e)
            {
                ex = e;
            }
            finally
            {
                povezava.Close();
            }
            return s;
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
        public List<string> Dobi_dogodek(string ime,string datum)
        {
            s = new List<string>();
            cmd = new SqlCommand("SELECT * FROM dbo.DobiDogodek(@Ime,@Datum)",povezava);

          
           
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Ime", ime);
                cmd.Parameters.AddWithValue("@Datum", Convert.ToDateTime(datum));
                dt = new DataTable();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    s.Add(dr["Opis dogodka"].ToString() + "ő" + dr["Lokacija"].ToString() + "ő" + dr["PovezavaDoSpletnegaMesta"].ToString() + "ő"+dr["Ura"].ToString());
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

            return s;
        }
    }
}
