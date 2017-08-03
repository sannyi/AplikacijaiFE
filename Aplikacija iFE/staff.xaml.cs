using System.Collections.Generic;
using Windows.UI.Core;
using Windows.UI.Xaml.Controls;
using Newtonsoft.Json;
using System.Net.Http;
using Windows.UI.Xaml.Navigation;


namespace Aplikacija_iFE
{
    public sealed partial class staff : Page
    {
        private List<Zaposlen> zaposleni = new List<Zaposlen>();
        Tools fetch_lists;
        public staff()
        {
           InitializeComponent();
           fetch_lists = new Tools();
           SystemNavigationManager.GetForCurrentView().BackRequested += Staff_BackRequested;
        }
        #region EVENTI
        private void Staff_BackRequested(object sender, BackRequestedEventArgs e)
        {
            if (Frame.CanGoBack)
            {
                Frame.GoBack();
                e.Handled = true;
            }
        }
        #endregion
        private void staff_BackRequested(object sender, BackRequestedEventArgs e)
        {
            if (Frame.CanGoBack)
            {
                Frame.GoBack();
                e.Handled = true;
            }
        }
        protected override async void OnNavigatedTo(NavigationEventArgs e)
        {
            if (fetch_lists.NetAndWiFi)
            {
                zaposleni = JsonConvert.DeserializeObject<List<Zaposlen>>(await new HttpClient().GetStringAsync("http://83.212.126.172/api/Zaposlens"));
                STAFF.ItemsSource = zaposleni;
            }
            else
            {
                STAFF.ItemsSource = new Zaposlen
                {
                    ID = -1, Ime = "Napaka omrežne povezave"
                };
                TipZaposlenih.IsEnabled = false;
                STAFF.IsEnabled = false;
            }
        }
       private void STAFF_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Frame.Navigate(typeof(Employee), STAFF.SelectedItem as Zaposlen);
        }
        private  void TipZaposlenih_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (TipZaposlenih == null) return;
            STAFF.ItemsSource = null;

            if (((ComboBoxItem)((ComboBox)sender).SelectedItem).Content.ToString() != "Vsi zaposleni")
            {
                STAFF.ItemsSource = fetch_lists.GetEmployeesBasedOnType(((ComboBoxItem)((ComboBox)sender).SelectedItem).Content.ToString(),new List<Zaposlen>(zaposleni));
                return;
            }
            STAFF.ItemsSource = zaposleni;
        }
    }
}
