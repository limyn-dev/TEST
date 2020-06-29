using Android.App;
using Android.Widget;
using Android.OS;

namespace ADRO_TEST_01
{
   [Activity(Label = "ADRO_TEST_01", MainLauncher = true, Icon = "@drawable/icon")]
   public class MainActivity : Activity
   {
      protected override void OnCreate(Bundle bundle)
      {
         base.OnCreate(bundle);

         // Set our view from the "main" layout resource
         // SetContentView (Resource.Layout.Main);
      }
   }
}

