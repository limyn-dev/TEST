using System                           ;
using System.Text                      ;
using System.Collections               ;

namespace PSC
{
class C_PSC_Encoder
{
   #region    ********** [ INTERFACE   ] ******************************************************************************     
   public string ASCII_Encode(string sText = "")      { return myASCII_Encode(sText) ; }
   public string ASCII_Decode(string sText = "")      { return myASCII_Decode(sText) ; }
   #endregion *********************************************************************************************************   
   #region    ********** [ PRIVATE     ] ******************************************************************************     
   private string myASCII_Encode(string sText = "")   {
      /*----------------------------------------------------------------------------*/
      /*----------------------------------------------------------------------------*/
      byte[] aBts = Encoding.ASCII.GetBytes(sText) ;                                //
      long   nSze = aBts.Length                    ;                                //
      byte[] aOut = new byte[2*nSze]               ;                                //
      int L = 0                                    ;                                //
      int H = 0                                    ;                                //      
      //                                                                            -----------------------------------
      for (long N=0; N < nSze; N++)    {                                            // Transforms bytes
         L = (aBts[N] & 0x0F)          ;                                            //
         H = (aBts[N] & 0xF0) >> 4     ;                                            //         
         aOut[N]      = (byte)(L + 33) ;                                            //
         aOut[N+nSze] = (byte)(H + 33) ;                                            //
      }                                                                             //
      //                                                                            -----------------------------------            
      return System.Text.Encoding.UTF8.GetString(aOut) ;
   }
   private string myASCII_Decode(string sText = "")   {
      /*----------------------------------------------------------------------------*/
      /*----------------------------------------------------------------------------*/
      byte[] aBts = Encoding.ASCII.GetBytes(sText) ;                                //
      long   nSze = aBts.Length / 2                ;                                //
      byte[] aOut = new byte[nSze]                 ;                                //
      int L = 0                                    ;                                //
      int H = 0                                    ;                                //
      //                                                                            -----------------------------------
      for (long N=0; N < nSze; N++)   {                                             // Transforms bytes         
         L = aBts[N] -33              ;                                             //
         H = (aBts[N+nSze] -33) << 4  ;                                             //
         aOut[N] = (byte)( H = H + L) ;                                             //
      }                                                                             //
      //                                                                            -----------------------------------
      return System.Text.Encoding.UTF8.GetString(aOut) ;
   }
   #endregion *********************************************************************************************************
}   
}