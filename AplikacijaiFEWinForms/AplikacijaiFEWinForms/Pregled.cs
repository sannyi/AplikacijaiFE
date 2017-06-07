using System.Collections.Generic;
using System.Windows.Forms;

namespace AplikacijaiFEWinForms
{
    public partial class Pregled : Form
    {
        public Pregled()
        {
            InitializeComponent();
            SQLServer s = new SQLServer();
            List<string>[] b = new List<string>[5];
            for (int i = 0; i < b.Length; i++)
            {
                b[i] = new List<string>();
            }

            b = s.VrniFunkcijeInProcedure();
            if(!s.Uspeh)
            MessageBox.Show(s.ex.ToString());

            string[] a = new string[5] { "ImeObjekta", "TipObjekta", "VhodIzhod", "ImeParametra", "PodatkovniTip" };
            dataGridView1.Rows.Add(b[1].Count);
            for (int i = 0; i < b[1].Count; i++)
            {
                for (int j = 0; j < 5; j++)
                {
                    
                    dataGridView1.Rows[i].Cells[a[j]].Value = b[j][i];
                }
            }


        }

    }
}
