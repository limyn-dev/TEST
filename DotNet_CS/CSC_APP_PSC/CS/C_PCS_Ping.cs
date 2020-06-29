using System                           ;
using System.Collections               ;
using System.Reflection                ;
using System.Runtime.CompilerServices  ;
using System.Runtime.InteropServices   ;
using System.Net; // Used for Pinging
using System.Net.NetworkInformation; // Used for Pinging
using System.Net.Sockets; // Used for Pinging

[assembly: AssemblyTrademark  ("limy.yves@outlook.com"  ) ]
[assembly: AssemblyTitle      ("PSC Ping."              ) ]
[assembly: AssemblyProduct    ("PscPing.exe"            ) ]
[assembly: AssemblyVersion    ("1.0.0.1"                ) ]
[assembly: AssemblyFileVersion("1.0.0.1"                ) ]

namespace PSC
{
class C_PCS_Ping
{
   public static void Ping(string sHostName) {
      /*----------------------------------------------------------------------------*/
      /*----------------------------------------------------------------------------*/
         Ping      oPng = new Ping()   ;
         PingReply oRep = null         ;
         bool      bErr = false        ;
         IPAddress oIpa = null         ;
         
         
         Lg("Get ip address of [" + sHostName + "]")
         oIpa = Dns.GetHostAddresses(sHostName) ;
         
         Lg("IP Address")
         Lg("   ToString      [" + oIpa.ToString()    + "]")
         Lg("   AddressFamily [" + oIpa.AddressFamily + "]")

         
         /*
         .OrderBy(a => a.AddressFamily == AddressFamily.InterNetwork ? 0 : 2) // Sort IPv4 addresses first for IPv6 it's InterNetworkV6 0 : 23
         .FirstOrDefault();

         try { oRep = oPng.Send(sTarget, 1000); } // 1000 = Timeout specified
         catch (Exception ex)

         {
            myLg("ERROR:                   ");
            myLg("   Message [" + ex.Message + "]");
            myLg("   Source  [" + ex.Source + "]");
            bErr = true;

         }

         if (bErr)
         {
            myLg("   Error occurs,return.");
            this.GRPBox1.Enabled = false;
            return;
         }

         myLg("IP Address                    " + oRep.Address + "");
         myValues.Add("PC_IP", oRep.Address);

         this.GRPBox1.Enabled = true;
      //                                                                            -----------------------------------
      
      */
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
      //                                                                            -----------------------------------
      Ping("www.google.ch") ;
      //                                                                            -----------------------------------
   }
}
}