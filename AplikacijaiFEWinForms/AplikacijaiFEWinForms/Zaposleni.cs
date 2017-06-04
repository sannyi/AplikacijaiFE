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
    public partial class Zaposleni : Form
    {
       
        List<string> zaposleni = new List<string>();
        
        SQLServer s = new SQLServer();
        
        public Zaposleni(int ID)
        {
            id = ID;
            InitializeComponent();
            zaposleni = s.PodatkiZaposlenega(ID);
            Label[] label_array = new Label[] {label1,label2,label3,label4,label5,label5,label6,label7,label8,label9,label10,label11};
            int counter = 0;
         //MessageBox.Show(s.ex.ToString());
            foreach (string z in zaposleni)
            {
                label_array[counter].Text =zaposleni[counter]; ;
                counter++;
                if(counter == 11)
                {
                    break;
                }
            }
            MessageBox.Show(id.ToString());
            

        }

        private void Zaposleni_Load(object sender, EventArgs e)
        {

        }
    }
}
