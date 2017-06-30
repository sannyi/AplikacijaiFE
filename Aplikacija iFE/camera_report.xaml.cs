using System;
using System.Diagnostics;
using System.IO;
using System.Threading.Tasks;
using Windows.ApplicationModel;
using Windows.Devices.Enumeration;
using Windows.Foundation;
using Windows.Graphics.Display;
using Windows.Media.Capture;
using Windows.UI.Core;
using Windows.UI.Popups;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Navigation;
using Windows.Storage;
using Windows.Storage.FileProperties;
using Windows.System.Display;
 //Preveri kako je s to licenco!!!!!!
// preveriti za taskthread ter EASend

namespace Aplikacija_iFE
{

    public sealed partial class camera_report : Page
    {
        #region SPREMENLJIVKE
        //fotoaparat
        MediaCapture _capturingPreview;
        DisplayRequest _request_to_display;
        private bool _isPreviewing;

        MessageDialog message;
        Tools a;
        private bool phototaken = false;
        #endregion       
        #region KONSTRUKTORJI
        public camera_report()
        {
            InitializeComponent();
            a = new Tools();
            SystemNavigationManager.GetForCurrentView().BackRequested += Camera_report_BackRequested;

            StartPreviewAsync();
                _request_to_display = new DisplayRequest();
                //Strechiraj fotoaparat na 
                Application.Current.Suspending += Application_Suspending;  
        }

        private void Camera_report_BackRequested(object sender, BackRequestedEventArgs e)
        {      
                if (Frame.CanGoBack)
                {
                    Frame.GoBack();
                    e.Handled = true;
                }  
        }
        #endregion
        #region PREDOGLED
        //Zaženemo predogled
        private async void StartPreviewAsync()
        {
            //zazenemo delo za prikaz previewa fotoaparata
            try
            {
                //Preverimo če lahko zaženemo fotoaparat->Ima telefon/comp sploh fotoaparat?
                //1) Je uporaba fotoaparata sploh dovoljena?
                //2) Inicializacija neuspešna?
                _capturingPreview = new MediaCapture();
                
            await    _capturingPreview.InitializeAsync();
                _request_to_display.RequestActive();
                camera_preview.Source = _capturingPreview;
                await _capturingPreview.StartPreviewAsync();
                _isPreviewing = true;

                _request_to_display.RequestActive();
                DisplayInformation.AutoRotationPreferences = DisplayOrientations.Landscape;

            }
            catch (UnauthorizedAccessException)
            {
                //1)
                Debug.WriteLine("Aplikacija nima dovoljenja za dostop do fotoaparata.");
                var message_dialog = new MessageDialog("Applikacija nima dovoljenja za dostop do fotoaparata.\n" +
                    "Če želite dovoliti aplikaciji pojdite v pod Nastavitve > Zasebnost > Kamera\n"+
                    "in dovolite aplikaciji uporabo fotoaparata.");
                message_dialog.Commands.Add(new UICommand("Pojdi v nastavitve.",new UICommandInvokedHandler(CommandInvokedHandler)));
                message_dialog.Commands.Add(new UICommand("Prekliči.",new UICommandInvokedHandler(CommandInvokedHandler)));
                message_dialog.DefaultCommandIndex = 0;
                message_dialog.CancelCommandIndex = 1;
                await message_dialog.ShowAsync();

                
            }
            catch(Exception ex)
            {
                //1)
                Debug.WriteLine("Inicializacija predogleda zajema slike je spodletela! " + ex.Message);
            }
        }
        //Zapremo predogled
        private async Task CleanupCameraAsync()
        {
            if (_capturingPreview != null)
            {
                if (_isPreviewing)
                {
                    await _capturingPreview.StopPreviewAsync();
                }
                await Dispatcher.RunAsync(CoreDispatcherPriority.Normal, () =>
                {
                    //Terminiranje camera preview elementa
                    camera_preview.Source = null;
                    if (_request_to_display != null)
                    {
                        //Opustimo prošnjo za predogled
                       
                        _request_to_display.RequestRelease();
                    }
                        _capturingPreview.Dispose();
                        _capturingPreview = null;
                });
            }
        }
            //Uničenje objekta v primeru, da se odločimo za izhod iz strani
        protected async override void OnNavigatedFrom(NavigationEventArgs e)
            {
               await CleanupCameraAsync();
            }
        //Uničenje objekta v primeru, da se odločimo za izhod iz aplikacije
        private async void Application_Suspending(object sender,SuspendingEventArgs e)
           {
                if(Frame.CurrentSourcePageType==typeof(camera_report))
                         {
                          var deferral = e.SuspendingOperation.GetDeferral();
                          await CleanupCameraAsync();
                          deferral.Complete();
                          }
                else
                        {
                          await CleanupCameraAsync();
                        }
             }
        #endregion
        #region ZAJEM IN PROCESIRANJE (POŠILJANJE SLIKE)
        
       private async Task Take_photo_of_damaged_proprerty()
        {
            CameraCaptureUI captureUI = new CameraCaptureUI();
            captureUI.PhotoSettings.Format = CameraCaptureUIPhotoFormat.Jpeg;
            captureUI.PhotoSettings.CroppedAspectRatio = new Size(300, 300);

            StorageFile photo = await captureUI.CaptureFileAsync(CameraCaptureUIMode.Photo);
            if(photo==null)
            {
                var messagedialog = new MessageDialog("Zajem slike preklican!");
                await messagedialog.ShowAsync();
                return;
            }
            else
            {
                string filename = "Poskodba_na_fakulteti" + DateTime.Now.ToString() + ".jpg";

                
          //     await photo.CopyAsync(Aplication.,filename, NameCollisionOption.ReplaceExisting);
              //  File = Path.Combine(destination_folder.DisplayName, filename);
                phototaken = true;
              
            }

            //prepiši te funkcije v tools
        }
    
        #endregion
        #region GUMBI IN HANDLERJI
        private async void CommandInvokedHandler(IUICommand command)
        {
            if(command.Label== "Pojdi v nastavitve")
            {
                bool result = await Windows.System.Launcher.LaunchUriAsync(new Uri("ms-settings:privacy-webcam"));
            }
            else
            {
                if (Frame.CanGoBack)
                {
                    Frame.GoBack();
                }
                ;
            }
        }
      
       
        private async void Take_photo_Click(object sender, RoutedEventArgs e)
        {
              await  CleanupCameraAsync();
              await  Take_photo_of_damaged_proprerty();

            //sendmail
            //notification for mail
            //exit to the menu
        }
        #endregion

        private async Task Poslji_Click(object sender, RoutedEventArgs e)
        {
            var combobox_item = Prostori.Items[Prostori.SelectedIndex] as ComboBoxItem;

            if (text_box_for_description.Text == null ||
                text_box_for_description.Text == ""   ||
                combobox_item == null || !phototaken)
            {
               message = new MessageDialog("Prosimo izpolnite vsa polja in naredite fotografijo poškodbe.");
                await message.ShowAsync();
                return;
            }
            a.MailAndFTP(combobox_item.Content.ToString(), text_box_for_description.Text, "Y" );
        }
    }


}

