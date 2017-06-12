using Windows.UI.Core;
using Windows.UI.Xaml.Controls;

namespace Aplikacija_iFE
{

    public sealed partial class profile : Page
    {
        public profile()
        {
            InitializeComponent();
            SystemNavigationManager.GetForCurrentView().BackRequested += Profile_BackRequested;
        }

        private void Profile_BackRequested(object sender, BackRequestedEventArgs e)
        {
            if (Frame.CanGoBack)
            {
                Frame.GoBack();
                e.Handled = true;
            }
        }
    }
}
