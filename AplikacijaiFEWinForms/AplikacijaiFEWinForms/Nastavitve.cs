using System;
using System.Data.SQLite;
using System.IO;
using System.Windows.Forms;

namespace AplikacijaiFEWinForms
{
    public partial class Nastavitve : Form
    {
        SQLiteConnection povezava;
        private string geslo;
        private int VpisnaSt;
        private string Geslo; 
        private string Jezik;
        private byte SamoWifi;

        public Nastavitve()
        {
            InitializeComponent();
            SQLServer s = new SQLServer();
        }

        private void button3_Click(object sender, EventArgs e)
        {

            int vpisna = int.Parse(textBox1.Text);
            string geslo = textBox2.Text;
            SQLServer s = new SQLServer();
            
            MessageBox.Show(s.AliObstajaStudent(vpisna, geslo).ToString());
           
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
