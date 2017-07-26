using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AplikacijaiFEWinForms
{
    public partial class Skoda : Form
    {
        public Skoda()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SQLServer s = new SQLServer();
            s.VstaviSkodo(textBox1.Text,comboBox1.SelectedItem.ToString(),int.Parse(textBox3.Text));
            if(s.ex!=null)
            {
                MessageBox.Show(s.ex.ToString());
            }

            if(s.Uspeh!=false)
            {
                textBox1.Clear();
                textBox3.Clear();
            }
            
        }
    }
}
