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
           
           // var staffResult = JsonConvert.DeserializeObject<List<Zaposlen>>(JsonResponse);
          //STAFF.ItemsSource = staffResult;
          STAFF.ItemsSource = JsonConvert.DeserializeObject<List<Zaposlen>>(await new HttpClient().GetStringAsync("http://aleksander.api/api/Zaposlens"));
        }

    }
}
