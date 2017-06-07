using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;


namespace AplikacijaiFEWinForms
{
    class SQLServer
    {
        public bool Uspeh { get; set; }
        public Exception ex { get; set; }
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
            cmd = new SqlCommand("SELECT * FROM dbo.fnVsiPodatkiZaposlenega(@ID)", povezava);
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
                    s.Add(dr["Telefonska"].ToString());
                    s.Add(dr["GovorilneUre"].ToString());
                    s.Add(dr["Prostor"].ToString());
                    s.Add(dr["Naziv"].ToString());
                    s.Add(dr["TipZaposlenega"].ToString());
                    s.Add(dr["Laboratorij"].ToString());
                    s.Add(dr["Tajnica"].ToString());
                    s.Add(dr["Vloga"].ToString());
                    break;
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
        public bool AliObstajaStudent(int vpisna, string geslo)
        {
            bool a = false;
            Uspeh = true;
            

            cmd = new SqlCommand("SELECT dbo.fnObstajaStudent(@Vpisna,@Geslo)", povezava);
            cmd.Parameters.AddWithValue("@Vpisna", vpisna);

            cmd.Parameters.AddWithValue("@Geslo", geslo);
           
            try
            {
              povezava.Open();
              int result =(int)cmd.ExecuteScalar();
            
                if (result==1)
                {
                    a = true;     
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

            return a;
        }
        public void VstaviSkodo(string opis, string prostor, int id_prijavitelja)
        {
            cmd = new SqlCommand("dbo.spVstaviSkodo", povezava);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Opis", opis);
            cmd.Parameters.AddWithValue("@Lokacija", prostor);
            cmd.Parameters.AddWithValue("@IDPrijavitelja", id_prijavitelja);

            //zenkrat ne bo časa za ftp -> posodobi proceduro, posodobi to metodo      
            povezava.Open();
            try {
                Uspeh = true;
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                ex = e; Uspeh = false;
            }
            finally
            {
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
            if (Uspeh)
            {
                return s;
            }
            else
            {
                return null;
            }
        }
        public List<string>[] VrniFunkcijeInProcedure()
        {
            List<string>[] a = new List<string>[5];
            for (int i = 0; i < a.Length; i++)
            {
                a[i] = new List<string>();
            }
            try
            {
                Uspeh = true;
                povezava.Open();
                cmd = new SqlCommand();
                cmd.Connection = povezava;
                cmd.CommandText = "SELECT * FROM dbo.fnSeznam()";
                dt = new DataTable();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    a[1].Add(dr["Objekt v PB"].ToString());
                    a[2].Add(dr["Vhod / Izhod"].ToString());
                    a[3].Add(dr["ImeParametra"].ToString());
                    a[4].Add(dr["PodatkovniTip"].ToString());
                    a[0].Add(dr["Ime objekta v podatkovni bazi"].ToString());
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
            if (Uspeh)
            {
                if (a[0].Count > 1)
                {
                    string p = "";
                    for (int i = 0; i < a[0].Count; i++)
                    {
                        p = a[0][i];
                        if (i + 1 != a[0].Count)
                        {
                            for (int j = (i + 1); j < a[0].Count; j++)
                            {
                                if (p != a[0][j])
                                {
                                    break;
                                }
                                a[0][j] = "";
                                a[1][j] = "";
                            }
                        }
                    }
                }
            }
            return a;
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
