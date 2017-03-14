using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Threading.Tasks;
using Windows.ApplicationModel;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.Graphics.Display;
using Windows.Media.Capture;
using Windows.UI.Core;
using Windows.UI.Popups;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;
using Windows.Storage;
using Windows.System;
using Windows.System.Display;


// The Blank Page item template is documented at http://go.microsoft.com/fwlink/?LinkId=234238

namespace Aplikacija_iFE
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class camera_report : Page
    {
        #region VIRI
        /*https://docs.microsoft.com/en-us/windows/uwp/audio-video-camera/simple-camera-preview-access - dostop do predogleda fotoaparata
       https://docs.microsoft.com/en-us/windows/uwp/audio-video-camera/capture-photos-and-video-with-cameracaptureui
        */
        #endregion
        #region SPREMENLJIVKE
        MediaCapture _capturingPreview;
        bool _isPreviewing;
        DisplayRequest _request_to_display;
        #endregion
        #region KONSTRUKTORJI
        public camera_report()
        {
            this.InitializeComponent();
            StartPreviewAsync();
            _request_to_display = new DisplayRequest();
            //Strechiraj fotoaparat na 
            Application.Current.Suspending += Application_Suspending;
          
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
        
       private async Task take_photo_of_damaged_proprerty()
        {
            CameraCaptureUI captureUI = new CameraCaptureUI();
            captureUI.PhotoSettings.Format = CameraCaptureUIPhotoFormat.Jpeg;
            captureUI.PhotoSettings.CroppedAspectRatio = new Size(300, 300);

            StorageFile photo = await captureUI.CaptureFileAsync(CameraCaptureUIMode.Photo);
            if(photo==null)
            {
                //obvesti uporabnika, da je preklical zajem fotografije
                return;
            }
           
         
                //prepiši te funkcije v tools
                StorageFolder destination_folder = await ApplicationData.Current.LocalFolder.CreateFolderAsync("Poskodbe na fakulteti");
                await photo.CopyAsync(destination_folder, "Poskodba_na_fakulteti.jpg", NameCollisionOption.ReplaceExisting);
                await photo.DeleteAsync();

            
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
        /*
        private void OnHardwareButtonsBackPressed(object sender, BackClickEventArgs e)
        {
            if(Frame.CanGoBack)
            {
                Frame.GoBack();
                e.Handled = true;
            }
        }
        */
        private void take_photo_Click(object sender, RoutedEventArgs e)
        {
            CleanupCameraAsync();
            take_photo_of_damaged_proprerty();



            //sendmail
            //notification for mail
            //exit to the menu
        }
        #endregion
    }

}

