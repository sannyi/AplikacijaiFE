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
        private void LogIn_Click(object sender, RoutedEventArgs e)
        {
            Tools prijava = new Tools();
            prijava.GetCredentialsAndUpdateDatabase(IDOrMail.Text, PasswordLogin.Password);
        }

        #endregion

    }
}
