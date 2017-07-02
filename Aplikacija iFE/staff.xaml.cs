using System;
using System.Collections.Generic;
using Windows.UI.Core;
using Windows.UI.Popups;
using Windows.UI.Xaml.Controls;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Net.Http;
using Windows.UI.Xaml.Navigation;
using Windows.UI.Xaml;

namespace Aplikacija_iFE
{
   
    public sealed partial class staff : Page
    {
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
            
        } 
        private void staff_loaded(object sender, RoutedEventArgs e)
        {
            HttpClient client = new HttpClient();
            var JsonResponse = client.GetStringAsync("http://localhost:54348/api/Zaposlens");
            var staffResult = JsonConvert.DeserializeObject<List<Zaposlen>>(JsonResponse);
            seznamZaposlenih.ItemsSource = staffResult;
        }
    }
}
