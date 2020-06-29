using System                                                                     ;
using System.Threading                                                           ;            
using System.Security.AccessControl                                              ;
using System.Diagnostics                                                         ;
using System.Reflection                                                          ;
public class CMsiTool                                                            {
   public static Process ExecWaitMsi(string sFileName, string sArguments)        {
      /*----------------------------------------------------------------------------*/
      /*----------------------------------------------------------------------------*/
      const string sMxn = "Global\\_MSIExecute"                                  ;  //
      Mutex        oMtx = null                                                   ;  //
      bool         bLck = true                                                   ;  //
      Process      oPrc = null                                                   ;  //
      String       sMsg = null                                                   ;  //
      //                                                                            --------------------------------------      
      do                                                                         {  // Wait msiexec   
         try                                                                     {  // 
            oMtx = Mutex.OpenExisting  (sMxn, MutexRights.Synchronize          ) ;  //   Try to open mutext
            Console.WriteLine          ("   # CMsiTool.ExecWait: Wait MsiExec" ) ;  //
            if (oMtx.WaitOne(5000))                                              {  //   Wait mutext event
               bLck = false                                                      ;  //
               Console.WriteLine       ("   # CMsiTool.ExecWait: End of lock"  ) ;  //  
            }                                                                       // 
            else                                                                 {  //
               bLck = true                                                       ;  //
               Console.WriteLine       ("   # CMsiTool.ExecWait: Wait timeout" ) ;  //  
            }                                                                       //  
         }                                                                          //  
         catch (WaitHandleCannotBeOpenedException)                               {  //    Mutex not found 
            Console.WriteLine          ("   # CMsiTool.ExecWait: No mutex"     ) ;  //
            oMtx=null                                                            ;  //
            bLck=false                                                           ;  //
         }                                                                          //
         catch (ObjectDisposedException)                                         {  //
            Console.WriteLine          ("   # CMsiTool.ExecWait: No mutex"     ) ;  //
            oMtx=null                                                            ;  //
            bLck=false                                                           ;  //
         }                                                                          //
         catch                                                                   {  //
            Console.WriteLine          ("   # CMsiTool.ExecWait: Generic ERROR") ;  //
         }                                                                          //
      }                                                                             //
      while (bLck)                                                               ;  //      
      //                                                                            --------------------------------------            
      sMsg = "Start [" + sFileName + "][" + sArguments + "]"                     ;  // Start process
      Console.WriteLine("  CMsiTool.ExecWait : " + sMsg)                         ;  //
      if (sArguments == "")                                                      {  //
         oPrc = Process.Start(sFileName)                                         ;  //
      }                                                                             //
      else                                                                       {  //
         oPrc = Process.Start(sFileName, sArguments)                             ;  //
      }                                                                             //
      //                                                                            --------------------------------------
      if (oMtx != null)                                                          {  // 
         oMtx.ReleaseMutex()                                                     ;  //
      }                                                                             //
      //                                                                            --------------------------------------      
      return oPrc                                                                ;  // return process object      
   }
}