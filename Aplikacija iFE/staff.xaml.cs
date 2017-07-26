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
        public staff()
        {
           InitializeComponent();
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
          zaposleni = JsonConvert.DeserializeObject<List<Zaposlen>>(await new HttpClient().GetStringAsync("http://83.212.126.172/api/Zaposlens"));
            STAFF.ItemsSource = zaposleni;
        }
       private void STAFF_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Frame.Navigate(typeof(Employee), STAFF.SelectedItem as Zaposlen);
        }

      

        private void TipZaposlenih_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            
            string content = TipZaposlenih.SelectedValue.ToString();
           if(content!="Vsi zaposleni")
            {
                STAFF.ItemsSource = new Tools().GetEmployeesBasedOnType(content, zaposleni);

            }
           else
            {
                STAFF.ItemsSource = zaposleni;
            }
            STAFF.ReloadLocalValue();

           

        }
    }
}
