using System.Collections.Generic;
using Windows.UI.Core;
using Windows.UI.Popups;
using Windows.UI.Xaml.Controls;

using Newtonsoft.Json;
using System.Net.Http;
using Windows.UI.Xaml.Navigation;

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
        private void TipZaposlenih_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {}
                  
        private void Zaposleni_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {}
        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            HttpClient client = new HttpClient();
            /*  var JsonResponse = await client.GetStreamAsync();
               var staffResult = JsonConvert.DeserializeObject<List<staff>>(JsonResponse);
               Zaposleni.ItemsSource = staffResult;*/
        } 
    }
}
