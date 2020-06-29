using System                           ;
using System.Collections               ;
using System.Reflection                ;
using System.Runtime.CompilerServices  ;
using System.Runtime.InteropServices   ;
using System.Net                       ;

[assembly: AssemblyTrademark  ("limy.yves@outlook.com"  ) ]
[assembly: AssemblyTitle      ("PCS_IP_CHK."            ) ]
[assembly: AssemblyProduct    ("PscIpChk.exe"           ) ]
[assembly: AssemblyVersion    ("1.0.0.1"                ) ]
[assembly: AssemblyFileVersion("1.0.0.1"                ) ]

namespace PSC
{
class C_PCS_IP_CHK
{
   public static void IP_Check(string sHostName) {
      /*----------------------------------------------------------------------------*/
      /*----------------------------------------------------------------------------*/
      IPAddress oIpa = null                                                      ;  //
      string[]  aStr = null                                                      ;  //
      //                                                                            -----------------------------------         
      Lg("Get ip address of [" + sHostName + "]")                                ;  //
      foreach (IPAddress A in Dns.GetHostAddresses(sHostName)) {oIpa = A;}       ;  //
      //                                                                            -----------------------------------         
      Lg("IP Address")                                                           ;  //
      Lg("   ToString      [" + oIpa.ToString()    + "]")                        ;  //
      Lg("   AddressFamily [" + oIpa.AddressFamily + "]")                        ;  //
      //                                                                            -----------------------------------         
      aStr = oIpa.ToString().Split('.')                                          ;  //
      if      (aStr[0]+"."+aStr[1]+"."+aStr[2] == "10.3.9") { Lg("WIFI")   ; }      //
      else if (aStr[0]+ "."+ aStr[1]           == "10.3"  ) { Lg("CALBLE") ; }      //
      else                                                  { Lg("OTHER")  ; }      //
      //                                                                            -----------------------------------
   }
   public static void Lg   (string sLine = ""  )   {
      /*----------------------------------------------------------------------------*
       * Write line of text in TBX_LOG                                              *
       *----------------------------------------------------------------------------*/
      string sLne = DateTime.Now.ToString("MM/dd/yy hh:mm") ;
             sLne += "> " + sLine                           ;
      //                                                                            -----------------------------------
      Console.WriteLine(sLne) ;
      //                                                                            -----------------------------------
   }
   public static void Main ()                      {
      /*----------------------------------------------------------------------------*/
      /*----------------------------------------------------------------------------*/
      string sStr = ""                                                           ;  //
      //                                                                            -----------------------------------
      Console.WriteLine("Host Name:")                                            ;  //
      sStr = Console.ReadLine()                                                  ;  //
      IP_Check(sStr)                                                             ;  //
      Console.WriteLine("Press ENTER to continue...")                            ;  //
      sStr = Console.ReadLine()                                                  ;  //
      //                                                                            -----------------------------------
   }
}
}