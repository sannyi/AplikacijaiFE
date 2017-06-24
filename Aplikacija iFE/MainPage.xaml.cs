using System;
using System.IO;
using Windows.UI.Popups;
using Windows.UI.Core;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

namespace Aplikacija_iFE
{
    public sealed partial class MainPage : Page
    {
        private MessageDialog messagedialog;
        public MainPage()
        {
            InitializeComponent();
            string path = Path.Combine(Windows.Storage.ApplicationData.Current.LocalFolder.Path,"iFE.sqlite");
   
           if (!File.Exists(path))
            {
              
                //create sqlitefile
            }
            SystemNavigationManager.GetForCurrentView().BackRequested += MainPage_BackRequested;
        }
#region NAVIGACIJA MED STRANMI
        private void MainPage_BackRequested(object sender, BackRequestedEventArgs e)
        {
            Frame rootFrame = Window.Current.Content as Frame;
            if (rootFrame == null)
            {
                return;
            }
            if ((rootFrame.CanGoBack) && (!e.Handled))
            {
                e.Handled = true;
                rootFrame.GoBack();
            }
        }
#endregion
        #region GUMBI
        private void Camera_click(object sender, RoutedEventArgs e)
        {
            Navigiraj_po_straneh(1);
        }
        private void Menu_Click(object sender, RoutedEventArgs e)
        {
            Navigiraj_po_straneh(2);
        }
        private void Nastavitve_Click(object sender, RoutedEventArgs e)
        {
            Navigiraj_po_straneh(6);
        }
        private void Profesorji_Click(object sender, RoutedEventArgs e)
        {
            Navigiraj_po_straneh(3);
        }
        #endregion
        #region FUNKCIJE IN METODE
        private async void Navigiraj_po_straneh(byte stran)
        {
            if (new Tools().NetAndWiFi)
            {
                switch (stran)
                {
                    case 1:
                        Frame.Navigate(typeof(camera_report));
                        break;
                    case 2:
                        if (new Tools().SaturdaySundayOrHoliday)
                        {
                            messagedialog = new MessageDialog("Danes kuhinja ne obratuje");
                            await messagedialog.ShowAsync();
                        }
                        else
                            Frame.Navigate(typeof(Todays_menu));
                        break;
                    case 3:
                        Frame.Navigate(typeof(staff));
                        break;
                    case 4:
                        Frame.Navigate(typeof(profile));
                        break;
                    case 5:
                        throw new NotImplementedException();
                       // break;
                    case 6:
                        Frame.Navigate(typeof(Settings));
                        break;
                    default: throw new NotImplementedException();
                        
                }
            }
            else
            {
                messagedialog = new MessageDialog("Preverite če ste povezani s spetom preko WiFi-ja.");
                await messagedialog.ShowAsync();
            }
        }

        #endregion

      
    }
}
