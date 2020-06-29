using System                           ;
using System.Collections               ;
using System.Reflection                ;
using System.Runtime.CompilerServices  ;
using System.Runtime.InteropServices   ;

[assembly: AssemblyTrademark  ("limy.yves@outlook.com"         ) ]
[assembly: AssemblyTitle      ("PSC application."              ) ]
[assembly: AssemblyProduct    ("psc.exe"                       ) ]
[assembly: AssemblyVersion    ("1.0.0.1"                       ) ]
[assembly: AssemblyFileVersion("1.0.0.1"                       ) ]

namespace PSC
{
class C_PCS_App
{
   public static void TestPsc() {
      /*----------------------------------------------------------------------------*/
      /*----------------------------------------------------------------------------*/
      C_PSC_Encoder oPsc = new C_PSC_Encoder()                   ;                  //
      string        sSrc = "asdfasdflk234523 sefdsbrstgh54wt1v " ;                  //
      string        sEnc = oPsc.ASCII_Encode(sSrc)               ;                  //
      string        sDec = oPsc.ASCII_Decode(sEnc)               ;                  //
      //                                                                            -----------------------------------
      Lw("Source string  [" + sSrc + "]")          ;                                //
      Lw("Encoded string [" + sEnc + "]")          ;                                //
      Lw("Decoded string [" + sDec + "]")          ;                                //
      Console.ReadLine()                           ;                                //
      //                                                                            -----------------------------------
   }
   public static void TestPse() {
      /*----------------------------------------------------------------------------*/
      /*----------------------------------------------------------------------------*/
      C_PSC_Exec oPse = new C_PSC_Exec()  ;                                         //
      //                                                                            -----------------------------------
      oPse.PS_Invoke("GET-PROCESS")       ;                                         //
      //                                                                            -----------------------------------
      Console.ReadLine()                  ;                                         //
      //                                                                            -----------------------------------      
   }
   public static void Lw   (string sLine = ""  )   {
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
      TestPse() ;
      //                                                                            -----------------------------------
   }
}
}