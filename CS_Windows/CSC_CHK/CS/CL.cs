using System               ;
using System.Linq          ;
using System.Windows.Forms ;
using System.Diagnostics   ;

namespace CHK
{
  public static class CL     {
   #region ********** MEMBERS     **************************************************
      private static string   myLOG = ""              ;
      private static TextBox  myTBX = null            ;
      private static string[] myEVF = new string[] { "frmMain::frmMain_Load"
                                                   , "frmMain::splitUpDown_Panel2_ClientSizeChanged"
                                                   , "frmMain::tabMain_Resize"
                                                   , "frmMain::splitTemplates_Panel2_ClientSizeChanged" 
                                                   , "frmMain::splitSequence_Panel2_ClientSizeChanged"
                                                   , "frmMain::tabAction_Resize"                         } ; 
   #endregion 
   #region ********** PUBLIC      **************************************************
      public static void Start      (TextBox oTextBox)   { 
         //                                                                         -----------------------------------
         myTBX = oTextBox                                                        ;  // Set textbox
         //                                                                         -----------------------------------
         myLOG += Environment.NewLine                                            ;  // Log start
         myLOG += Environment.NewLine                                            ;  //
         myLOG += "============================================================" ;  //
         myLOG += Environment.NewLine                                            ;  //
         myLOG += "Stat logging"                                                 ;  //
         myLOG += Environment.NewLine                                            ;  //
         myLOG += "============================================================" ;  //
         myTBX.Text = myLOG                                                      ;  //
         //                                                                         -----------------------------------
      }
      public static void Trace      (string sText = "")  {
         //-------------------------------------------------------------------------//
         //-------------------------------------------------------------------------//
         string sClr = myCaller()                              ;                    //
         //                                                                         -----------------------------------
         myLOG += Environment.NewLine                          ;                    // Build log text
         if (sClr.Length > 30)                                                      //
            { myLOG += sClr.Substring(0,26) + "... " ;         }                    //
         else                                                                       //
            { myLOG += sClr + new string(' ',30-sClr.Length);  }                    //
         myLOG += "> " + sText                                 ;                    //
         //                                                                         -----------------------------------
         if (myTBX != null) { myTBX.Text = myLOG ;             }                    //
         //                                                                         -----------------------------------
         }
      public static void TraceEvent ()                   {
         //-------------------------------------------------------------------------
         //-------------------------------------------------------------------------
         string sClr = myCaller()                                                ;  //
         //                                                                         -----------------------------------
         if (myEVF.Contains(sClr)) { return ; }                                  ;  // Event filter
         //                                                                         -----------------------------------
         myLOG += Environment.NewLine                                            ;  // Build log text
         myLOG += "EVENT - [" + sClr + "]"                                       ;  //
         //                                                                         -----------------------------------
         if (myTBX != null) { myTBX.Text = myLOG ;                               }  //
         //                                                                         -----------------------------------
         }
   #endregion 
   #region ********** PRIVATE     **************************************************
      private static string myCaller() {
         //                                                                         -----------------------------------
         //                                                                         -----------------------------------
         StackTrace oTrc = new StackTrace()                                      ;  //
         StackFrame oSfm = oTrc.GetFrame(2)                                      ;  //
         string     sClr = ""                                                    ;  //
         //                                                                         -----------------------------------         
         sClr = oSfm.GetMethod().ReflectedType.Name                              ;  //
         sClr += "::"                                                            ;  //
         sClr += oSfm.GetMethod().Name                                           ;  //
         //                                                                         -----------------------------------         
         return sClr                                                             ;  //
      }
   #endregion 
   }
}
