using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Popups;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;


// The Blank Page item template is documented at http://go.microsoft.com/fwlink/?LinkId=234238

namespace Aplikacija_iFE
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class staff : Page
    {
        public staff()
        {
            this.InitializeComponent();
            SQLServer get_data = new SQLServer();
            List<string> a = new List<string>();
            a = get_data.ReturnTypeOfStaff();
            var msgDialog = new MessageDialog(a.Count.ToString());
          
            foreach(var b in a)
            { 
               
            TipZaposlenih.Items.Add(b);
            }
        }
    }
}
