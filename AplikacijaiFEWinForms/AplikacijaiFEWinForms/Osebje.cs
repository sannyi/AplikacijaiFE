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
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
            // pokliči 
            SQLServer s = new SQLServer();
            List<string> ImenaInPriimki= new List<string>();
            
            List<int> identitete = new List<int>();

            //imena_in_priimki = s.ImeInPriimekZaposlenega(comboBox1.SelectedItem.ToString());
        /*    foreach( var a in imena)
            {
                listBox1.Items.Add(a.ToString());
               
            }
*/
            
      
        }
    }
}
