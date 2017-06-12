using System.Collections.Generic;
using Windows.UI.Core;
using Windows.UI.Popups;
using Windows.UI.Xaml.Controls;

using Newtonsoft.Json;
using System.Net.Http;
using Windows.UI.Xaml.Navigation;


// The Blank Page item template is documented at http://go.microsoft.com/fwlink/?LinkId=234238

namespace Aplikacija_iFE
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class staff : Page
    {
        public staff()
        {
            this.InitializeComponent();
            SystemNavigationManager.GetForCurrentView().BackRequested += Staff_BackRequested;
        /*    SQLServer get_data = new SQLServer();
            List<string> a = new List<string>();
            a = get_data.ReturnTypeOfStaff();
            var msgDialog = new MessageDialog(a.Count.ToString());
          
            foreach(var b in a)
            { 
               
            TipZaposlenih.Items.Add(b);
            } */
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

        private void TipZaposlenih_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
                  
        private void Zaposleni_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            HttpClient client = new HttpClient();
         /*  var JsonResponse = await client.GetStreamAsync();
            var staffResult = JsonConvert.DeserializeObject<List<staff>>(JsonResponse);
            Zaposleni.ItemsSource = staffResult;*/




        }
        //WTF
        

        



       
    }
}
