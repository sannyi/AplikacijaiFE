using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace AplikacijaiFEWinForms
{
    public partial class Zaposleni : Form
    {
        List<string> zaposleni = new List<string>();
        SQLServer s = new SQLServer();

        private int id;
        public Zaposleni(int ID)
        {
            id = ID;
            InitializeComponent();
            zaposleni = s.PodatkiZaposlenega(ID);
            Label[] label_array = new Label[] {label1,label2,label3,label11,label4,label5,label6,label7,label8,label9,label10,label9};

            for (int i = 0; i < zaposleni.Count; i++)
                label_array[i].Text = label_array[i].Text + ": " + zaposleni[i];
        }

        private void Zaposleni_Load(object sender, EventArgs e)
        {

        }
    }
}
