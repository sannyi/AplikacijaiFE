using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace AplikacijaiFEWinForms
{
    public partial class Dogodki : Form
    {
        List<string> dogodki;
        public Dogodki()
        {
            InitializeComponent();
            SQLServer s = new SQLServer();
             dogodki = new List<string>();
            
            dogodki = s.DobiDogodke();
            if(dogodki==null)
            {
               MessageBox.Show(s.ex.ToString());
            }
            foreach(string a in dogodki)
            {
                listBox1.Items.Add(a);
            }
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ime_dogodka = listBox1.GetItemText(listBox1.SelectedItem);
            if(ime_dogodka==" " || ime_dogodka ==null)
            {
                return;
            }
            int i = ime_dogodka.Length;
            char[] z = new char[i];
            z = ime_dogodka.ToCharArray();
            i = 0;

            while (!(System.Char.IsDigit(z[i])))
            {
                i++;
            }
            char[] l = new char[i - 1];
            for (int o = 0; o < (i - 1); o++) l[o] = z[o];
            ime_dogodka = new string(l);

            Label[] array_label = new Label[] {label3, label4, label6, label5};
            l = new char[10];
            string datum;
            i = 0;
            while (!(System.Char.IsDigit(z[i])))
            {
                i++;
            }
            int j = z.Length;
            int k = 0;
            while (i < j)
            {
                l[k] = z[i];
                k++;
                i++;
            }
            datum = new string(l);

            List<string> d = new List<string>();
            SQLServer s = new SQLServer(); d=s.Dobi_dogodek(ime_dogodka, datum);
            
            label1.Text = ime_dogodka;
            label2.Text = datum;
            i = 0;
            ime_dogodka = String.Join("", d);
            foreach (Label a in array_label)
            {
                a.Text = ime_dogodka.Split('ő')[i];
                i++;
            }
        }
    }
}
