using System;
using System.Windows.Forms;

namespace AplikacijaiFEWinForms
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Navigiraj(3);
        }
     
        private void Navigiraj(byte izbira)
        {
            switch(izbira)
            {
                case 1:
                    Skoda s = new Skoda();
                    s.Show();
                    break;
                case 2:
                        //navigacija
                    break;
                case 3:
                    Nastavitve n = new Nastavitve();
                    n.Show();
                    break;
                case 4:
                    Jedilnik j = new Jedilnik();
                    j.Show();
                    break;
                case 5:
                    Osebje o = new Osebje();
                    o.Show();
                    break;
                case 6:
                    Dogodki d = new Dogodki();
                    d.Show();
                    break;
                default: throw new NotImplementedException();
            }


        }

        private void button2_Click(object sender, EventArgs e)
        {
            Navigiraj(2);
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Navigiraj(4);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Navigiraj(1);
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Navigiraj(5);
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Navigiraj(6);
        }
        private void button7_Click(object sender, EventArgs e)
        {
            Navigiraj(7);
        }
      
             
    }
}
