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
            string path = Path.Combine(Windows.Storage.ApplicationData.Current.LocalFolder.Path, "iFE.sqlite");

            if (!File.Exists(path))
            {

                
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
        private void Camera_click(object sender, RoutedEventArgs e) { Navigator(1);}
        private void Menu_Click(object sender, RoutedEventArgs e) { Navigator(2);}
        private void Nastavitve_Click(object sender, RoutedEventArgs e) { Navigator(6);}
        private void Profesorji_Click(object sender, RoutedEventArgs e) { Navigator(3);}
               #endregion
        #region FUNKCIJE IN METODE
        private async void Navigator(byte stran)
        {
            if (new Tools().NetAndWiFi)
            {
                messagedialog = new MessageDialog("0");
                switch (stran)
                {
                    #region NAVIGACIJA MED DEJANSKIMI STRANMI
                    case 1:
                        if (new Tools().IsCameraPresent)
                            Frame.Navigate(typeof(Camera_report));
                        else
                            messagedialog = new MessageDialog("Preverite ali je vaša kamera priključena.");
                        break;
                    case 2:
                        if (new Tools().SaturdaySundayOrHoliday)
                            messagedialog = new MessageDialog("Danes kuhinja ne obratuje");
                        else
                            Frame.Navigate(typeof(Todays_menu));
                        break;
                    case 3:
                        string StaffJson = await (new Tools("https://83.212.126.172/restApi.php", new string[] { "tip" }, new string[] { "zaposleni" })).StringFromPost();
                        Frame.Navigate(typeof(staff),StaffJson as string);
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
                    #endregion
                    #region TEST CASE
                    case 10:
                       
                        break;
                    #endregion
                    default: throw new NotImplementedException();
                }
                if (messagedialog.Content != "0")
                    await messagedialog.ShowAsync();
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

