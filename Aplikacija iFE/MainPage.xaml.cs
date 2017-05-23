using SQLite.Net.Attributes;
using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// The Blank Page item template is documented at http://go.microsoft.com/fwlink/?LinkId=402352&clcid=0x409

namespace Aplikacija_iFE
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class MainPage : Page
    {
        public MainPage()
        {
            
            this.InitializeComponent();
           if (!File.Exists(Path.Combine(Windows.Storage.ApplicationData.Current.LocalFolder.Path, "student.xml")))
            {

                tools a = new tools();
        
            }
            

            
        }

        #region GUMBI
        private void Camera_click(object sender, RoutedEventArgs e)
        {
            Navigiraj_po_straneh(1);
        }
        private void Menu_Click(object sender, RoutedEventArgs e)
        {
            Navigiraj_po_straneh(2);
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Navigiraj_po_straneh(3);
        }
        #endregion




        #region FUNKCIJE IN METODE
        private void Navigiraj_po_straneh(byte stran)
        {
           if(new tools().Connected_net())
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

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {

        }
    }
}
