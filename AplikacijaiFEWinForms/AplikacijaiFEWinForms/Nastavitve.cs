using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SQLite;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AplikacijaiFEWinForms
{
    public partial class Nastavitve : Form
    {
        SQLiteConnection povezava;
        private string geslo;
        private int VpisnaSt;
        private string Geslo; //nikoli v praksi public
        private string Jezik;
        private byte SamoWifi;

        public Nastavitve()
        {
            InitializeComponent();
            string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments),"iFE.db");
          if(!File.Exists(path))
            {
                File.Create(path);
                SQLite s = new SQLite();
                s.CreateOrUpdate("CREATE");
                if(s.Uspeh==false)
                {
                    MessageBox.Show(s.ex.ToString());
                }
            }
          //naloži privzete vrednosti
        }

        private void button3_Click(object sender, EventArgs e)
        {

            
            // preveri če obstaja uporabnik in vpiši podatke
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if(checkBox1.Checked)
            {
                checkBox1.Checked = false;
                SamoWifi = 0;
            }
            else
            {
                checkBox1.Checked = true;
                SamoWifi = 1;
            }
           
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Jezik = comboBox2.SelectedItem.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // shrani nastavitve
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //DEfault nastavitve
        }
    }
}
