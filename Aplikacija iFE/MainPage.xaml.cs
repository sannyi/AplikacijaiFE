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
           if (!File.Exists(Path.Combine(Windows.Storage.ApplicationData.Current.LocalFolder.Path, "student.xml")))
            {

                tools a = new tools();
                a.create_XML_file();
            }
            

            
        }

        #region GUMBI
        private void Camera_click(object sender, RoutedEventArgs e)
        {
            navigiraj_po_straneh(1);
        }
        private void Menu_Click(object sender, RoutedEventArgs e)
        {
            navigiraj_po_straneh(2);
        }
        #endregion




        #region FUNKCIJE IN METODE
        private void navigiraj_po_straneh(byte stran)
        {
           if(new tools().connected_net())
            {
                switch(stran)
                {
                    case 1:
                        // go to camera report
                        Frame.Navigate(typeof(camera_report));
                        break;
                    case 2:
                        Frame.Navigate(typeof(todays_menu));
                        break;
                    case 3:
                        //profesorji
                        break;
                    case 4:
                        //moj profil
                        break;
                    case 5:
                        //navigacija
                        break;
                    case 6:
                        //settings
                        break;
                    default:
                        break;
                }
            }
           else
            {
                //preveri, če se lahko povežeš preko wifi-ja
                //če so wifi točke vklopljene potem idi v nastavitve wifi
             //ce ne poglej če lahko greš na mobilne podatke, če je 
             // vklopi mobilne podatke
            }
        }
        #endregion
    }
}
