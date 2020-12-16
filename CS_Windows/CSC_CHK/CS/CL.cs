using System               ;
using System.Drawing       ;
using System.Linq          ;
using System.Windows.Forms ;
using System.Diagnostics   ;

namespace CHK                                                                    {
public static class CL                                                           {
#region ********** MEMBERS     ****************************************************************************************
private static int      myCSZ = 25                                               ;  //
private static string   myLOG = ""                                               ;  //
private static TextBox  myTBX = null                                             ;  //
private static string[] myEVF = new string[] {""}                                ;  //
#endregion 
#region ********** PUBLIC      ****************************************************************************************
public static void Start      (TextBox oTextBox)                                 { 
   /*---------------------------------------------------------------------------------
   ---------------------------------------------------------------------------------*/
   myTBX = oTextBox                                                              ;  // Set textbox
   //                                                                               -----------------------------------
   myLOG += Environment.NewLine                                                  ;  // Log start
   myLOG += Environment.NewLine                                                  ;  //
   myLOG += "==================================================================" ;  //
   myLOG += Environment.NewLine                                                  ;  //
   myLOG += "Stat logging"                                                       ;  //
   myLOG += Environment.NewLine                                                  ;  //
   myLOG += "==================================================================" ;  //
   myTBX.Text = myLOG                                                            ;  //
   //                                                                               -----------------------------------
}
public static void Trace      (string sText = "")                                {
         //                                                                         -----------------------------------
         myLOG += Environment.NewLine                                            ;  // Build log text
         myLOG += myCaller() + " > " + sText                                     ;  //
         //                                                                         -----------------------------------
         if (myTBX != null) { myTBX.Text = myLOG ;                               }  //
         //                                                                         -----------------------------------
         }
public static void TraceEvent ()                                                 {
   /*---------------------------------------------------------------------------------
   ---------------------------------------------------------------------------------*/
   string sClr = myCaller()                                                      ;  //
   //                                                                               -----------------------------------
   if (myEVF.Contains(sClr)) { return ; }                                        ;  // Event filter
   //                                                                               -----------------------------------
   myLOG += Environment.NewLine                                                  ;  // Build log text
   myLOG += myCaller() + " ***** EVENT HANDLER *****"                            ;  //
   //                                                                               -----------------------------------
   if (myTBX != null) { myTBX.Text = myLOG ;                                     }  //
   //                                                                               -----------------------------------
}
#endregion 
#region ********** PRIVATE     ****************************************************************************************
private static string myCaller()                                                 {
   /*---------------------------------------------------------------------------------
   ---------------------------------------------------------------------------------*/
   StackTrace oTrc = new StackTrace()                                            ;  //
   StackFrame oSfm = oTrc.GetFrame(2)                                            ;  //
   string     sClr = ""                                                          ;  //
   int        nLen = 0                                                           ;  //
   //                                                                               -----------------------------------         
   sClr = oSfm.GetMethod().ReflectedType.Name                                    ;  // Set caller string
   sClr += "::"                                                                  ;  //
   sClr += oSfm.GetMethod().Name                                                 ;  //
   //                                                                               -----------------------------------                  
   nLen = sClr.Length                                                            ;  //
   if      (nLen > myCSZ) { sClr = sClr.Substring(0, myCSZ);                     }  // Normalize caller string
   else if (nLen < myCSZ) { sClr += new String(' ',myCSZ-nLen);                  }  //
   else                   {                                                      }  //
   //                                                                               -----------------------------------         
   return sClr                                                                   ;  //
}
#endregion 
}
}
