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
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;
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
        //https://docs.microsoft.com/en-us/windows/uwp/audio-video-camera/simple-camera-preview-access - dostop do predogleda fotoaparata
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
       private async Task StartPreviewAsync()
        {
            //zazenemo delo za prikaz previewa fotoaparata
            try
            {
                //Preverimo če lahko zaženemo fotoaparat->Ima telefon/comp sploh fotoaparat?
                //1) Je uporaba fotoaparata sploh dovoljena?
                //2) Inicializacija neuspešna?
                _capturingPreview = new MediaCapture();
                _request_to_display.RequestActive();
            await    _capturingPreview.InitializeAsync();
                camera_preview.Source = _capturingPreview;
                await _capturingPreview.StartPreviewAsync();
                _isPreviewing = true;

                _request_to_display.RequestActive();
                DisplayInformation.AutoRotationPreferences = DisplayOrientations.Portrait;

            }
            catch (UnauthorizedAccessException)
            {
                //1)
                Debug.WriteLine("Aplikacija nima dovoljenja za dostop do fotoaparata.");
                //Vprašaj za preusmeritev na dovoljenja
                
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


        private void Fotografiraj_Click(object sender, RoutedEventArgs e)
        {

        }
    }

}

