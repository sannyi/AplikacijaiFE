using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace AplikacijaiFEWinForms
{
    public partial class Osebje : Form
    {
        List<string> ImenaPriimkiInIdentitete = new List<string>();
        List<int> identitete = new List<int>();
        SQLServer s;

        public Osebje()
        {
            InitializeComponent();
            comboBox1.SelectedIndex = 0;
            s = new SQLServer();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
            s = new SQLServer();

            ImenaPriimkiInIdentitete.Clear();
            identitete.Clear();
            ImenaPriimkiInIdentitete = s.ImePriimekInIdZaposlenega(comboBox1.GetItemText(comboBox1.SelectedItem));

            foreach (string a in ImenaPriimkiInIdentitete)
            {
                listBox1.Items.Add(a.Split('ő')[0]);
            }
            foreach (string a in ImenaPriimkiInIdentitete)
            {
                identitete.Add(int.Parse(a.Split('ő')[1]));
            }
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string priimek = listBox1.GetItemText(listBox1.SelectedItem);
            if (priimek=="" || priimek==" " || priimek==null) { return; }
            int ID = identitete[listBox1.SelectedIndex];
            Zaposleni z = new Zaposleni(ID);
            z.Show();

        }
    }
}
