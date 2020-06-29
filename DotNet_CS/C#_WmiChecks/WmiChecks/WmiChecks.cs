using System                            ;
using System.Collections                ;
using System.Collections.Generic        ;
using System.Linq                       ;
using System.Text                       ;
using System.Management                 ;
using System.Management.Instrumentation ;
using System.Runtime.InteropServices    ;

[assembly: WmiConfiguration(@"root\WmiChecks", HostingModel = ManagementHostingModel.LocalService)]
namespace WmiChecks
{
#region CLASS CkeckItem
   [ManagementEntity(Name = "CkeckItem")]
   public class CkeckItem
   {
      /* ---------- MEMBERS ---------------------------------------------------------------------------------------- */
      [ManagementKey]   public string sId    { get; set; }
      [ManagementProbe] public string sCheck { get; set; }
      [ManagementProbe] public string sType  { get; set; }
      [ManagementProbe] public string sName  { get; set; }
      [ManagementProbe] public string sValue { get; set; }
      /* ---------- CONSTRUCTORS ----------------------------------------------------------------------------------- */
      public CkeckItem()                                                 { mySet("", "", "", "", "")  ; }
      public CkeckItem(string I, string C, string T, string N, string V) { mySet(I, C, T, N, V)       ; }
      /* ---------- STATIC ----------------------------------------------------------------------------------------- */
      [ManagementEnumerator] static public IEnumerable<CkeckItem> GetAll() 
      {
         int I = 0 ;                                                                //
         //                                                                         -----------------------------------
         for (I=0; I<3; I++)                                                        //
         {                                                                          //
            yield return new CkeckItem("I"+I, "C"+I, "T"+I, "N"+I, "V"+I) ;         //
         }                                                                          //
         //                                                                         -----------------------------------         
      }
      /* ---------- METHODES --------------------------------------------------------------------------------------- */
      /* ---------- PRIVATE ---------------------------------------------------------------------------------------- */
      private void mySet(string I, string C, string T, string N, string V) 
      {
         this.sId    = I ; 
         this.sCheck = C ; 
         this.sType  = T ; 
         this.sName  = N ; 
         this.sValue = V ; 
      }
      /* ---------- END OF CLASS ----------------------------------------------------------------------------------- */
   }
#endregion
#region CLASS WmiInstaller
   [System.ComponentModel.RunInstaller(true)]
   public class WmiInstaller : DefaultManagementInstaller
   {
      public override void Install(IDictionary stateSaver)
      {
         /*-------------------------------------------------------------------------*/
         /*-------------------------------------------------------------------------*/
         base.Install(stateSaver);
      }
      public override void Uninstall(IDictionary savedState)
      {
         /*-------------------------------------------------------------------------*/
         /*-------------------------------------------------------------------------*/
         try   { (new ManagementClass(@"root\WmiChecks:CkeckItem")).Delete() ;  }   //
         catch { }                                                                  //
         //                                                                         -----------------------------------
         try   { base.Uninstall(savedState); }                                      //
         catch { }                                                                  //
         //                                                                         -----------------------------------
      }
   }
#endregion
}
