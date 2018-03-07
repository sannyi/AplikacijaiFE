using System;
using Windows.UI.Core;
using Windows.UI.Popups;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Navigation;

namespace Aplikacija_iFE
{
    public sealed partial class Employee : Page
    {
        public Employee()
        {
            InitializeComponent();
            SystemNavigationManager.GetForCurrentView().BackRequested += Employee_BackRequested;
        }
        private void Employee_BackRequested(object sender, BackRequestedEventArgs e)
        {
            if (Frame.CanGoBack)
            {
                Frame.GoBack();
                e.Handled = true;
            }
        }
        protected override void OnNavigatedTo(NavigationEventArgs e)
        {  
            Zaposlen employee = e.Parameter as Zaposlen;
            string[] props = new string[]             {employee.Eposta, employee.Telefonska, employee.GovorilneUre, employee.Prostor, employee.TipZaposlenega, employee.Laboratorij, employee.Vloga};
            TextBlock[] textblocks = new TextBlock [] {Eposta,          Telefonska,          GovorilneUre,          Prostor,          TipZaposlenega,          Laboratorij,          Vloga};

            
            Ime_in_priimek.Text = employee.Ime + " " + employee.Priimek;


            for (byte i =0; i<textblocks.Length;i++)
            {
                textblocks[i].Text = props[i];
            }
               
        }

        private  async void Poslji_hitro_sporocilo_Click(object sender, Windows.UI.Xaml.RoutedEventArgs e)
        {
            MessageDialog sporocilo = new MessageDialog("");
            if (
                (!String.IsNullOrEmpty(Zadeva.Text) && !String.IsNullOrWhiteSpace(Zadeva.Text))
                &&
                (!String.IsNullOrEmpty(HitroSporocilo.Text) && !String.IsNullOrWhiteSpace(HitroSporocilo.Text))
              )
            {
                string responseString = await (new Tools(
                    "https://83.212.126.172/sendMail.php",
                    new string[]
                    {
                        "naslovnik", "posiljatelj","zadeva","sporocilo"
                    },
                    new string[]
                    {
                        //posiljatelj bo za test ak3900@student.uni-lj.si
                        //naslovnik bo aleksander.kovac97@hotmail.com
                        "ak3900@student.uni-lj.si",
                        "aleksander.kovac97@hotmail.com",
                        Zadeva.Text,
                        HitroSporocilo.Text
                    }        



                    ).StringFromPost());
                if(responseString!="N/A")
                {
                    sporocilo.Content = responseString;
                }
                Zadeva.Text = ""; HitroSporocilo.Text = "";
            }
            else
            {
                sporocilo.Content = "Sporočilo ni bilo poslano, ker niso izpoljena vsa polja. ";
            }
            await sporocilo.ShowAsync();
        }
    }
}
