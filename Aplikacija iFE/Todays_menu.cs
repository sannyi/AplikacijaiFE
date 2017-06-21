﻿using System;
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
                List<string> days = new List<string>(), type = new List<string>();
                
                Parallel.Invoke( ()=> { days = tools_for_menu.Getdate();}, () => { type = tools_for_menu.GetTypesOfFood(); });
                if (tools_for_menu.flag == -3)
                {
                    Frame.GoBack();
                }
                foreach ( string d in days)
                                    Dnevi_za_prikaz.Items.Add(d);
                
                foreach (string t in type)
                {
                    PivotItem p = new PivotItem();
                    ScrollViewer sv = new ScrollViewer();
                    TextBlock txtb = new TextBlock();
                              
                    p.Name = t;
                    p.Header = t;
                        sv.Name = t;
                            txtb.Name = t;
                        sv.Content = txtb;
                        sv.VerticalScrollBarVisibility = ScrollBarVisibility.Auto;
                    p.Content = sv;
                    jedilnik.Items.Add(p);
                }
                                  
            }
        }

        private void Todays_menu_BackRequested(object sender, BackRequestedEventArgs e)
        {
            if (Frame.CanGoBack) { Frame.GoBack(); e.Handled = true; } }

        #region METODE V PRIDAJOČEM CLASS-u
       /* private void Refresh_menu(string day)
        {
        }*/

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
        private async void Menu_Loaded(object sender, RoutedEventArgs e)
        {
        }
    }
}