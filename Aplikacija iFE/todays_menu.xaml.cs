using System;

using Windows.UI.Xaml.Navigation;
using Windows.UI.Xaml.Resources;
using Windows.UI.Xaml.Controls;

// The Blank Page item template is documented at http://go.microsoft.com/fwlink/?LinkId=234238

namespace Aplikacija_iFE
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class todays_menu : Page
    {
        #region SPREMENLJIVKE
        tools tools_for_menu = new tools();
        #endregion
        public todays_menu()
        {   
            this.InitializeComponent();

            if (!(tools_for_menu.Connected_net()))
            {
                Frame.GoBack();
                
            }
            else
            {

               // refresh_menu();
                string[] days = tools_for_menu.Getdate();
                foreach (string day1 in days)
                {
                   Dnevi_za_prikaz.Items.Add(day1);
                }
                TextBlock[] a = new TextBlock[] {meso1, meso2, meso3, testenine, zlica, solata1};
                byte counter = 0;
               
            }
   
        }
        #region METODE V PRIDAJOČEM CLASS-u
        private void Refresh_menu(string day)
        {
            TextBlock[] a = new TextBlock[] { meso1, meso2, meso3, testenine, zlica, solata1 };
            byte counter = 0;
            foreach (TextBlock text in a)
            {
                //  text.Name=
                // counter++;
            }
            
        }
        #endregion

        #region GUMBI
        private void Dnevi_za_prikaz_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //refresh_menu(dnevi_za_prikaz.);
        }
        #endregion
    }
}
