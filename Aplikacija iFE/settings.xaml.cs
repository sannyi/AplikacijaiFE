using System;

using Windows.UI.Xaml.Controls;

// The Blank Page item template is documented at https://go.microsoft.com/fwlink/?LinkId=234238

namespace Aplikacija_iFE
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class settings : Page
    {
        public settings()
        {
            this.InitializeComponent();
            Wifi.Text = "Podatki se bodo prenasali" + Environment.NewLine + "tudi preko podatkovne" +Environment.NewLine+" povezave.";
            Language1.Text = "Izberite jezik." + Environment.NewLine + "Choose a language." + Environment.NewLine + "Sprache wählen.";
        }
    }
}
