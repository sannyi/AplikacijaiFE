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
    public partial class Osebje : Form
    {
        public Osebje()
        {
            InitializeComponent();
            listBox1.SelectedIndex = 0;
            SQLServer s = new SQLServer();
            List<string> ImenaInPriimki = new List<string>();
            List<int> identitete = new List<int>();
      //      ImenaInPriimki = s.ImeInPriimekZaposlenega(string tipZaposlega);
            identitete = s.IDZaposlenih;
            foreach (var a in ImenaInPriimki)
            {
                listBox1.Items.Add(a.ToString());

            }
        }


        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
            // pokliči 
            SQLServer s = new SQLServer();
            List<string> ImenaInPriimki= new List<string>();
            List<int> identitete = new List<int>();

      //      ImenaInPriimki = s.ImeInPriimekZaposlenega();
            identitete = s.IDZaposlenih;
            
         

            //imena_in_priimki = s.ImeInPriimekZaposlenega(comboBox1.SelectedItem.ToString());
            foreach( var a in ImenaInPriimki)
            {
                listBox1.Items.Add(a.ToString());
               
            }
            
      
        }
    }
}
