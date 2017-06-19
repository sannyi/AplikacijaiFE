using Windows.UI.Core;
using Windows.UI.Xaml.Controls;

namespace Aplikacija_iFE
{
   
    public sealed partial class Professors : Page
    {
        public Professors()
        {
            InitializeComponent();
            SystemNavigationManager.GetForCurrentView().BackRequested += Professors_BackRequested;
        }

        private void Professors_BackRequested(object sender, BackRequestedEventArgs e)
        {
            if (Frame.CanGoBack)
            {
                Frame.GoBack();
                e.Handled = true;
            }
        }
    }
}
