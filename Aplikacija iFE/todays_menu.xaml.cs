using System;
using Windows.System;
using Windows.UI.Core;
using Windows.UI.Popups;
using Windows.UI.Xaml.Controls;

// The Blank Page item template is documented at http://go.microsoft.com/fwlink/?LinkId=234238

namespace Aplikacija_iFE
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class todays_menu : Page
    {
        #region SPREMENLJIVKE
        tools tools_for_menu = new tools();
        #endregion
        public todays_menu()
        {   
            this.InitializeComponent();
            SystemNavigationManager.GetForCurrentView().BackRequested += Todays_menu_BackRequested;
            if (!(tools_for_menu.Connected_net()))
            {

                
            }
            else
            {

               // refresh_menu();
                string[] days = tools_for_menu.Getdate();
                foreach (string day1 in days)
                {
                   Dnevi_za_prikaz.Items.Add(day1);
                }
                TextBlock[] a = new TextBlock[] {meso1, meso2, meso3, testenine, zlica, solata1};
                byte counter = 0;
               
            }
   
        }

        private void Todays_menu_BackRequested(object sender, BackRequestedEventArgs e)
        {
            if (Frame.CanGoBack)
            {
                Frame.GoBack();
                e.Handled = true;
            }
        }
        #region METODE V PRIDAJOČEM CLASS-u
        private void Refresh_menu(string day)
        {
            TextBlock[] a = new TextBlock[] { meso1, meso2, meso3, testenine, zlica, solata1 };
            byte counter = 0;
            foreach (TextBlock text in a)
            {
                //  text.Name=
                // counter++;
            }
            
        }
        #endregion

        #region GUMBI
        private async void Dnevi_za_prikaz_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            int get_item_count = Dnevi_za_prikaz.Items.Count-1;
            if(Dnevi_za_prikaz.SelectedIndex==get_item_count)
            {
                var URI = new Uri(@"http://www.fe.uni-lj.si/o_fakulteti/restavracija/tedenski_meni/");
                var URIlaunched = await Launcher.LaunchUriAsync(URI);
                if(!URIlaunched)
                {
                    URI = new Uri(@"https://www.fe.uni-lj.si/o_fakulteti/restavracija/tedenski_meni/");
                    URIlaunched = await Launcher.LaunchUriAsync(URI);
                    if(!URIlaunched)
                    {
                        var message = new MessageDialog("Do spletne strani trenutno ni mogoče dostopati ");
                    }
                }

            }
            //refresh_menu(dnevi_za_prikaz.);
        }
        #endregion
    }
}
