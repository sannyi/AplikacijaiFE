using System;
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

        SqlConnection povezava = new SqlConnection("Data Source=83.212.126.172\\SQLEXPRESS;Initial Catalog=iFE;User id=sa;Password=iFE2016");
        
        public List<int> DobiIdZaposlenega(string ime,string priimek)
        {
            List<int> a = new List<int>();
            

            return a;
        }
        public List<string> ImeInPriimekZaposlenega()
        {
            List<string> a = new List<string>();
            string Ime="";
            string Priimek="";

            
            while()
            {
                a.Add(Ime + ' ' + Priimek);
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
        public void VstaviSkodo(string prostor, string opis, int id_prijavitelja)
        {

        }
    }
}
