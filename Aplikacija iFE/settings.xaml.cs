using System;
using Windows.UI.Core;
using Windows.UI.Xaml.Controls;

// The Blank Page item template is documented at https://go.microsoft.com/fwlink/?LinkId=234238

namespace Aplikacija_iFE
{
    public sealed partial class settings : Page
    {
        public settings()
        {
            this.InitializeComponent();
            SystemNavigationManager.GetForCurrentView().BackRequested += Settings_BackRequested;
            Wifi.Text = "Podatki se bodo prenasali" + Environment.NewLine + "tudi preko podatkovne" +Environment.NewLine+" povezave.";
            Language1.Text = "Izberite jezik." + Environment.NewLine + "Choose a language." + Environment.NewLine + "Sprache wählen.";

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

        private void ToggleSwitch_Toggled(object sender, Windows.UI.Xaml.RoutedEventArgs e)
        {
            //update wifi
        }
        #endregion

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //update language
        }
    }
}
