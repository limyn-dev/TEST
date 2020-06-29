using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// Pour en savoir plus sur le modèle d'élément Page vierge, consultez la page http://go.microsoft.com/fwlink/?LinkId=234238

namespace UW8_CLIENT_01
{
    /// <summary>
    /// Une page vide peut être utilisée seule ou constituer une page de destination au sein d'un frame.
    /// </summary>
    public sealed partial class MainPage : Page
    {
        //private  SVC_CALCULATOR.ICalculator   ;
 
        public MainPage()
        {
            this.InitializeComponent();

           
        }

      private void btnADD_Click(object sender, RoutedEventArgs e)
      {
         SVC_CALCULATOR.CalculatorClient oClt = new SVC_CALCULATOR.CalculatorClient() ;  
         double                          oRlt = oClt.AddAsync() 
      }
   }
}
