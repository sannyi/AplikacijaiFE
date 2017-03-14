using SQLite.Net.Attributes;
using System;
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
        /*    if (!File.Exists(Path.Combine(Windows.Storage.ApplicationData.Current.LocalFolder.Path, "lokalna_ife_baza.db")))
            {
                
                local_sqlite_database new_base = new local_sqlite_database();
                new_base.create();
            }
            */

            
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
        
        }

        private void Domov_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Camera_click(object sender, RoutedEventArgs e)
        {
         Frame.Navigate(typeof(camera_report));
        }

       

        private void Menu_Click(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(typeof(todays_menu));
        }
    }
}
