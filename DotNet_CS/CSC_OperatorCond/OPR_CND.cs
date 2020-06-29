using System                           ;
using System.Collections               ;
using System.Reflection                ;
using System.Runtime.CompilerServices  ;
using System.Runtime.InteropServices   ;
using System.Net                       ;

[assembly: AssemblyTrademark  ("limyn.yves@outlook.com" ) ]
[assembly: AssemblyTitle      ("C_OPR_CND."             ) ]
[assembly: AssemblyProduct    ("C_OPR_CND.exe"          ) ]
[assembly: AssemblyVersion    ("1.0.0.1"                ) ]
[assembly: AssemblyFileVersion("1.0.0.1"                ) ]

namespace PSC
{
class C_OPR_CND
{
 
   public static void Main ()                      {
      /*----------------------------------------------------------------------------*/
      /*----------------------------------------------------------------------------*/
      string sStr = ""                                                           ;  //
      int    nVal = 0                                                            ;  //
      //                                                                            -----------------------------------
      sStr = Console.ReadLine()                                                  ;  // Get value
      Int32.TryParse(sStr, out nVal)                                             ;  //
      //                                                                            -----------------------------------
      sStr = nVal > 1 ? "Grether than 1" : "Less than 1"                         ;  //
      Console.WriteLine("sStr [" + sStr + "]")                                   ;  //
      //                                                                            -----------------------------------
   }
}
}