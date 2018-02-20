using Windows.UI.Core;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Navigation;

namespace Aplikacija_iFE
{
    public sealed partial class Employee : Page
    {
        public Employee()
        {
            InitializeComponent();
            SystemNavigationManager.GetForCurrentView().BackRequested += Employee_BackRequested;
        }
        private void Employee_BackRequested(object sender, BackRequestedEventArgs e)
        {
            if (Frame.CanGoBack)
            {
                Frame.GoBack();
                e.Handled = true;
            }
        }
        protected override void OnNavigatedTo(NavigationEventArgs e)
        {  
            Zaposlen employee = e.Parameter as Zaposlen;
            string[] props = new string[] {employee.Eposta,employee.Telefonska, employee.GovorilneUre, employee.Prostor,employee.Naziv, employee.TipZaposlenega, employee.Laboratorij,employee.Vloga};
            TextBlock[] textblocks = new TextBlock [] {Eposta,Telefonska,GovorilneUre,Prostor,Naziv,TipZaposlenega,Laboratorij,Tajnica,Vloga};

            
            Ime_in_priimek.Text = employee.Ime + " " + employee.Priimek;
            sbyte itemcount = 0;
            foreach (TextBlock t in textblocks )
                            t.Text = props[itemcount++];
        }
    }
}
