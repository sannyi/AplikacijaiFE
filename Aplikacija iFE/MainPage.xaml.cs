
using Microsoft.Data.Sqlite.Internal;
using System.IO;
using Windows.UI.Core;
using Windows.UI.Xaml;

using Windows.UI.Xaml.Controls;

using Windows.UI.Xaml.Navigation;
// The Blank Page item template is documented at http://go.microsoft.com/fwlink/?LinkId=402352&clcid=0x409

namespace Aplikacija_iFE
{

    public sealed partial class MainPage : Page
    {
        public MainPage()
        {
            this.InitializeComponent();
            string path = Path.Combine(Windows.Storage.ApplicationData.Current.LocalFolder.Path,"iFE.sqlite");
   
           if (!File.Exists(path))
            {
                SqliteEngine.UseWinSqlite3();
                SQLite offline_baza = new SQLite();
                SystemNavigationManager.GetForCurrentView().BackRequested += MainPage_BackRequested;
            }            
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
        private void Navigiraj_po_straneh(byte stran)
        {
           if(new tools().Connected_net()  )
            {
                switch(stran)
                {
                    case 1:
                        Frame.Navigate(typeof(camera_report));
                        break;
                    case 2:
                        Frame.Navigate(typeof(todays_menu));
                        break;
                    case 3:
                        Frame.Navigate(typeof(staff));
                        break;
                    case 4:
                        Frame.Navigate(typeof(profile));
                        break;
                    case 5:
                        
                        break;
                    case 6:
                        Frame.Navigate(typeof(settings));
                        break;
                    default: 
                        break;
                }
            }
           else
            {
                
            }
        }

        #endregion

      
    }
}
