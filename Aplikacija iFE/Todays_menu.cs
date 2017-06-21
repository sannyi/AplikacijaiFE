using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Windows.System;
using Windows.UI.Core;
using Windows.UI.Popups;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

namespace Aplikacija_iFE
{
    public sealed partial class Todays_menu : Page
    {
        #region SPREMENLJIVKE
        Tools tools_for_menu = new Tools();
        #endregion
        public Todays_menu()
        {   
            InitializeComponent();
            SystemNavigationManager.GetForCurrentView().BackRequested += Todays_menu_BackRequested;
            if (!(tools_for_menu.InternetConnection))
            {
                if (Frame.CanGoBack)
                {
                    Frame.GoBack();
                }
            }
                                                  
            
            else
            {
                Parallel.Invoke(

                    ()=> {


                        List<string> days = new List<string>();


                        days = tools_for_menu.Getdate();
                        foreach (string day1 in days)
                        {
                            Dnevi_za_prikaz.Items.Add(day1);
                        }
                        TextBlock[] a = new TextBlock[] { meso1, meso2, meso3, testenine, zlica, solata1 };


                    },
                    () =>
                    {
                        List<string> type = new List<string>();
                        type = tools_for_menu.GetTypesOfFood();

                        foreach (string f1 in type)
                        {
                            jedilnik.Items.Add(f1);
                        }
                        var Message = new MessageDialog("uj");
                        Message.ShowAsync();
                    }

                    );
                   
              
            }
        }

        private void Todays_menu_BackRequested(object sender, BackRequestedEventArgs e)
        { if (Frame.CanGoBack) { Frame.GoBack(); e.Handled = true; } }

        #region METODE V PRIDAJOČEM CLASS-u
        private void Refresh_menu(string day)
        {
            TextBlock[] a = new TextBlock[] { meso1, meso2, meso3, testenine, zlica, solata1 };
            byte counter = 0;
            foreach (TextBlock text in a)
            {
            }   
        }
        #endregion
        #region GUMBI
        private async void Dnevi_za_prikaz_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(Dnevi_za_prikaz.SelectedIndex==Dnevi_za_prikaz.Items.Count-1)
            {
                var URI = new Uri(@"http://www.fe.uni-lj.si/o_fakulteti/restavracija/tedenski_meni/");
                var URIlaunched = await Launcher.LaunchUriAsync(URI);
                if(!URIlaunched)
                {
                    URI = new Uri(@"https://www.fe.uni-lj.si/o_fakulteti/restavracija/tedenski_meni/");
                    URIlaunched = await Launcher.LaunchUriAsync(URI);
                    if(!URIlaunched)
                    {
                        var message = new MessageDialog("Do spletne strani trenutno ni mogoče dostopati.");
                        await message.ShowAsync();
                    }
                }
            }
        }
      #endregion
      private void Menu_Loaded(object sender, RoutedEventArgs e)
        {/*
            
            */
        }
    }
}
