using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Windows.System;
using Windows.UI.Core;
using Windows.UI.Popups;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Navigation;

namespace Aplikacija_iFE
{
    public sealed partial class Todays_menu : Page
    {
        #region SPREMENLJIVKE
        Tools tools_for_menu = new Tools();
        private MessageDialog message;
        #endregion
        public Todays_menu()
        {
            InitializeComponent();
            SystemNavigationManager.GetForCurrentView().BackRequested += Todays_menu_BackRequested;
         
                List<string> type = new List<string>(), food = new List<string>();
                Parallel.Invoke(
                  
                    () =>          {                        type = tools_for_menu.GetSiteContent(1, "https://www.studentska-prehrana.si/sl/restaurant/Details/2521");                   },
                    () =>          {                        food = tools_for_menu.GetSiteContent(2, "https://www.studentska-prehrana.si/sl/restaurant/Details/2521");                   });
                if (tools_for_menu.Flag == -3)
                                        Frame.GoBack();

                /*   foreach (string d in days) Dnevi_za_prikaz.Items.Add(d);*/
                byte m = 0;
            foreach (string t in type)
            {
                PivotItem p = new PivotItem();
                ScrollViewer sv = new ScrollViewer();
                TextBlock txtb = new TextBlock();
                Parallel.Invoke(
                        () => { p.Name = t; p.Header = t; },
                        () => { sv.Name = t; txtb.Name = t; },
                        () => { txtb.Text = food[m]; sv.VerticalScrollBarVisibility = ScrollBarVisibility.Auto; });

                sv.Content = txtb;
                p.Content = sv;
                jedilnik.Items.Add(p);
                m++;
            }
            
        }
        private bool ListDownLoaded = false;

        private void Todays_menu_BackRequested(object sender, BackRequestedEventArgs e)
        {
            if (Frame.CanGoBack) { Frame.GoBack(); e.Handled = true;}
        }
        #region GUMBI
        private async void GoToWebSite_Click(object sender, RoutedEventArgs e)
        {
                var URIlaunched = await Launcher.LaunchUriAsync(new Uri(@"https://www.fe.uni-lj.si/o_fakulteti/restavracija/tedenski_meni/"));
                if(!URIlaunched)
                {
                    URIlaunched = await Launcher.LaunchUriAsync(new Uri(@"http://www.fe.uni-lj.si/o_fakulteti/restavracija/tedenski_meni/"));
                    if(!URIlaunched)
                    {
                        message = new MessageDialog("Do spletne strani trenutno ni mogoče dostopati.");
                        await message.ShowAsync();
                    }
                }
        }
        #endregion
        private async void Menu_Loaded(object sender, RoutedEventArgs e)
        {
        }
        protected override async void OnNavigatedTo(NavigationEventArgs e)
        {
                }
    }
}
