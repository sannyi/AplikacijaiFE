using System;
using System.IO;
using Windows.UI.Popups;
using Windows.UI.Core;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

namespace Aplikacija_iFE
{
    public sealed partial class Settings : Page
    {
        public Settings()
        {
            InitializeComponent();
            SystemNavigationManager.GetForCurrentView().BackRequested += Settings_BackRequested;
        }  
        #region EVENTI
        private void Settings_BackRequested(object sender, BackRequestedEventArgs e)
        {
            if (Frame.CanGoBack)
            {
                Frame.GoBack();
                e.Handled = true;
            }
        }
        private void Privzeto_Click(object sender, Windows.UI.Xaml.RoutedEventArgs e)
        {
            new SQLite().SetAllToDefault();
        }

        private void Languages_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
        private void Save_Click(object sender, RoutedEventArgs e)
        {

        }
        private void Defaults_Click(object sender, RoutedEventArgs e)
        {

        }
        private void GoBack_Click(object sender, RoutedEventArgs e)
        {
            if(Frame.CanGoBack)
            {
                Frame.GoBack();
            }
        }
        private async void LogIn_Click(object sender, RoutedEventArgs e)
        {
            MessageDialog m = new MessageDialog("");
            m.Content = "Pozdravljeni Aleksander Kovač! Vaš e-mail: ak3900@student.uni-lj.si!";
            m.Content += " Vaše podatki so uspešno shranjeni!";

            await m.ShowAsync();

            Tools t = new Tools("https://83.212.126.172/restApi.php", new string[] { "tip", "id", "password" }, new string[] { "student", IDOrMail.Text,PasswordLogin.Password});
            //string studentJson= await t.StringFromPost();
          //  string dva = studentJson;
            ;
         //   prijava.GetCredentials(IDOrMail.Text, PasswordLogin.Password);
        }

        #endregion

    }
}
