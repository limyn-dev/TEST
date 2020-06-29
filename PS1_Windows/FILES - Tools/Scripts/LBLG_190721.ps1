#
# ********* GLOBALS ***************************************************************************************************
#                                                                                   -----------------------------------
[bool]   $script:LBLG_IS_ADM  = $false                                              # Admin process
[int]    $script:LBLG_BUF_W   = 300                                                 # Console width
[int]    $script:LBLG_BUF_H   = 3000                                                # Console height
[string] $script:LBLG_SPATH   = ""                                                  # Script path
[string] $script:LBLG_SNAME   = ""                                                  # Script name
[string] $script:LBLG_LROOT   = "C:\ProgramData\Robo\Logs"                          # Log file root
[string] $script:LBLG_LPATH   = ""                                                  # Log file path
[string] $script:LBLG_LFILE   = ""                                                  # Log file full name
[int]    $script:LBLG_STEP_C  = 0                                                   # Step counter
[int]    $script:LBLG_STEP_I  = 0                                                   # Step index
[int]    $script:LBLG_RETCODE = 0                                                   # Return code
[string] $script:LBLG_EVT_LOG = "Robo"                                              #
[string] $script:LBLG_EVT_SRC = ""                                                  #
#                                                                            ERRORS >----------------------------------
[INT] $script:LBLG_ERR_WARNING  =     1                                             # ---- ---- ---- ---X
[INT] $script:LBLG_ERR_INITIAL  =     2                                             # ---- ---- ---- --X-
[INT] $script:LBLG_ERR_CRITICAL =     4                                             # ---- ---- ---- -X--
[INT] $script:LBLG_ERR_UNKNOWN  = 32768                                             # X--- ---- ---- ----
#                                                                ERRORS DESCRIPTION >----------------------------------
[hashtable] $script:LBLG_ERR_DSC = @{}                                                             #
$script:LBLG_ERR_DSC.Add(    1, 'A non critical error has occurred.')                              #
$script:LBLG_ERR_DSC[1]      += ' See log file for error details.'                                 #
$script:LBLG_ERR_DSC.Add(    2, 'A critical error has occurred during the script initialisation.') #
$script:LBLG_ERR_DSC[2]      += ' See log file for error details.'                                 #
$script:LBLG_ERR_DSC.Add(    4, 'A critical error has occurred during the script execution.')      #
$script:LBLG_ERR_DSC[4]      += ' See log file for error details.'                                 #
$script:LBLG_ERR_DSC.Add(32768, 'An unknown error has occurred during the script execution.')      #
$script:LBLG_ERR_DSC[32768]  += ' See log file for error details.'                                 #
#                                                                                   -----------------------------------
# ********* FUNCTIONS *************************************************************************************************
#
function LBLG_EventWrite {
   param( [string] $sType    = ""
        , [int]    $nEventID = 0
        , [string] $sMessage = ""
        )
   #--------------------------------------------------------------------------------#
   # Write event log entry                                                          #
   # Param sType: Information / Warning / Error                                     #
   #--------------------------------------------------------------------------------#
   [hashtable] $P = @{}                                                             #
   #                                                                                -----------------------------------
   if ($script:LBLG_EVT_LOG -eq "") { return }                                      # Event disabled
   if ($script:LBLG_EVT_SRC -eq "") { return }                                      #
   if (!($script:LBLG_IS_ADM)     ) { return }                                      #
   #                                                                                -----------------------------------
   if (!([System.Diagnostics.EventLog]::Exists($script:LBLG_EVT_LOG)))        {     # Set event log
      New-EventLog $script:LBLG_EVT_LOG -Source $script:LBLG_EVT_SRC                #
   }                                                                                #
   if (!([System.Diagnostics.EventLog]::SourceExists($script:LBLG_EVT_SRC)))  {     #
      New-EventLog $script:LBLG_EVT_LOG -Source $script:LBLG_EVT_SRC                #
   }                                                                                #
   #                                                                                -----------------------------------   
   $P = @{}                                                                         # Write event
   $P.Add('LogName'  , $script:LBLG_EVT_LOG )                                       #
   $P.Add('Source'   , $script:LBLG_EVT_SRC )                                       #
   $P.Add('EntryType', $sType)                                                      #
   $P.Add('EventId'  , $nEventID)                                                   #
   $P.Add('Message'  , $sMessage)                                                   #
   Write-EventLog @P                                                                #
   #                                                                                -----------------------------------   
}
function LBLG_Init       {
   param ( [string] $sScriptPath = ""
         , [string] $sScriptName = ""
         , [int]    $nStepsCount = 0
         , [string] $sPrefix     = ""
         , [string] $sLogRoot    = ""
         , [int]    $nBuffer_W   = 0
         , [int]    $nBuffer_H   = 0
         )
   #--------------------------------------------------------------------------------#
   # Set globals parameters of library.                                             #
   #--------------------------------------------------------------------------------#
   [object] $O = $null                                                              #
   #                                                                                -----------------------------------
   $O = [Security.Principal.WindowsIdentity]::GetCurrent()                          # Check if current prcess is admin
   $O = New-Object Security.Principal.WindowsPrincipal($O)                          #
   if ($O.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){        #
      $script:LBLG_IS_ADM = $true                                                   #
   }                                                                                #
   #                                                                                -----------------------------------
   $script:LBLG_SPATH = $sScriptPath                                                # Script path
   $script:LBLG_SNAME = $sScriptName                                                #
   #                                                                                -----------------------------------
   if ($sLogRoot -ne "" ) { $script:LBLG_LROOT = $sLogRoot }                        # Set log path
   $script:LBLG_LPATH = "$($script:LBLG_LROOT)\$sScriptName"                        #
   if (!(TEST-PATH $script:LBLG_LPATH)) { MD $script:LBLG_LPATH | OUT-NULL }        #
   #                                                                                -----------------------------------
   $script:LBLG_LFILE = "$($script:LBLG_LPATH)\"                                    # Set log file
   if ($sPrefix -ne "") { $script:LBLG_LFILE += "$($sPrefix)_" }                    #
   $script:LBLG_LFILE += ([guid]::NewGuid()).ToString().Replace('-',"")             #
   $script:LBLG_LFILE += ".log"                                                     #
   #                                                                                -----------------------------------
   $script:LBLG_EVT_SRC += $sScriptName.Replace(' ', "")                            # Set event log source
   #                                                                                -----------------------------------   
   if ($nBuffer_W -ne 0) { $script:LBLG_BUF_W = $nBuffer_W }                        # Set console buffer
   if ($nBuffer_H -ne 0) { $script:LBLG_BUF_H = $nBuffer_H }                        #
   #                                                                                -----------------------------------
   $script:LBLG_STEP_C = $nStepsCount                                               # Init steps counter
   #                                                                                -----------------------------------
}
function LBLG_Start      {
   #--------------------------------------------------------------------------------#
   # Start script                                                                   #
   #--------------------------------------------------------------------------------#
   [string] $F = ""                                                                 #
   [int[]]  $S = @($script:LBLG_BUF_W, $script:LBLG_BUF_H)                          #
   #                                                                                -----------------------------------
   (GET-HOST).UI.RawUI.BufferSize = NEW-OBJECT "Management.Automation.Host.Size" $S # Set console size
   #                                                                                -----------------------------------
   Start-Transcript -Path $script:LBLG_LFILE                                        # Start transcript
   #                                                                                -----------------------------------
   PUSH-LOCATION                                                                    # Set current location
   CD $script:LBLG_SPATH                                                            #
   #                                                                                -----------------------------------
   ""                                           | OUT-HOST                          # Log start
   ("=" * 122)                                  | OUT-HOST                          #
   "START SCRIPT    [$($script:LBLG_SNAME)]"    | OUT-HOST                          #
   "   User         [$($env:USERNAME)]"         | OUT-HOST                          #
   "   Computer     [$($env:COMPUTERNAME)]"     | OUT-HOST                          #
   "   Location     [$($script:LBLG_SPATH)]"    | OUT-HOST                          #
   "   Log path     [$($script:LBLG_LPATH)]"    | OUT-HOST                          #
   "   Log file     [$($script:LBLG_LFILE)]"    | OUT-HOST                          #
   "   Event log    [$($script:LBLG_EVT_LOG)]"  | OUT-HOST                          #
   "   Event Source [$($script:LBLG_EVT_SRC)]"  | OUT-HOST                          #   
   ("=" * 122)                                  | OUT-HOST                          #
   ""                                           | OUT-HOST                          #
   #                                                                                -----------------------------------      
   LBLG_EventWrite "Information" 1000 "START SCRIPT [$($script:LBLG_SNAME)]"        #
   #                                                                                -----------------------------------         
}
function LBLG_Exit       {
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string] $M = "End of script, return code [$($script:LBLG_RETCODE )]."           #
   #                                                                                -----------------------------------
   ""          | OUT-HOST                                                           #
   ("=" * 122) | OUT-HOST                                                           #
   $M          | OUT-HOST                                                           #
   ("=" * 122) | OUT-HOST                                                           #
   ""          | OUT-HOST                                                           #
   #                                                                                -----------------------------------
   Stop-Transcript                                                                  #
   #                                                                                -----------------------------------
   $M += " Log file [$($script:LBLG_LFILE)]"                                        # Write event
   switch ($script:LBLG_RETCODE) {                                                  #
            0 { LBLG_EventWrite "Information" 3000 $M }                             #
            1 { LBLG_EventWrite "Warning" 3001 $M     }                             #
      default { LBLG_EventWrite "Error" 3002 $M       }                             #
   }                                                                                #
   #                                                                                -----------------------------------   
   POP-LOCATION                                                                     #
   #                                                                                -----------------------------------   
   Exit $script:LBLG_RETCODE                                                        #
   #                                                                                -----------------------------------
}
function LBLG_Step       {
   param ( [string] $sDescription = "" )
   #--------------------------------------------------------------------------#
   #--------------------------------------------------------------------------#
   [string] $S = ""                                                                 #
   #                                                                                -----------------------------------
   $script:LBLG_STEP_I++                                                            # Update step counter
   #                                                                                -----------------------------------
   $S = $script:LBLG_STEP_I                                                         # Set step counter
   if ($script:LBLG_STEP_C -ne 0)  { $S = "$S/$($script:LBLG_STEP_C)" }             #
   #                                                                                -----------------------------------
   Lg ""                                                                            # Write step
   Lg ("-" * 100)                                                                    #
   Lg "[$S] - $sDescription"                                                        #
   #                                                                                -----------------------------------
}
function Lg              {
   param ([string] $sText = "")
   #--------------------------------------------------------------------------#
   #--------------------------------------------------------------------------#
   [string] $T = "$(Get-Date -Format "dd.MM.yyyy HH:mm:ss")"                        #
   #                                                                                -----------------------------------
   "$T > $sText" | OUT-HOST                                                         #
   #                                                                                -----------------------------------
}
function Lv              {
   param ( [string] $sCaller = ""
         , [string] $sText   = ""
         )
   #--------------------------------------------------------------------------#
   #--------------------------------------------------------------------------#
   [string] $T = ""                                                                 #
   #                                                                                -----------------------------------
   if ($sCaller.Length -lt 18) { $T = (" " *(18-$sCaller.Length)) }                 #
   #                                                                                -----------------------------------
   "$T $sCaller :    $sText" | OUT-HOST                                             #
   #                                                                                -----------------------------------
}
function Le              {
   param ( [int]  $nCode     = 0
         , [bool] $bCritical = $false
         )
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   $global:ErrorActionPreference = "SilentlyContinue"                               #
   #                                                                                -----------------------------------
   $error | % {                                                                     # Process errors
      ""                                                           | OUT-HOST       #    Display errors
      "ERROR:"                                                     | OUT-HOST       #
      "======"                                                     | OUT-HOST       #
      "ScriptName        [$($_.InvocationInfo.ScriptName)]"        | OUT-HOST       #
      "ScriptLineNumber  [$($_.InvocationInfo.ScriptLineNumber)]"  | OUT-HOST       #
      "Reason            [$($_.CategoryInfo.Reason )]"             | OUT-HOST       #
      "Message           [$($_.Exception.Message)]"                | OUT-HOST       #
      "Source            [$($_.Exception.Source)]"                 | OUT-HOST       #
      ""                                                           | OUT-HOST       #
      $script:LBLG_RETCODE = $script:LBLG_RETCODE -bor $nCode                       #    Set return code
   }                                                                                #
   #                                                                                -----------------------------------
   $error.Clear()                                                                   # Reset errors
   #                                                                                -----------------------------------
   if ($bCritical) {                                                                # Exit if critical
      if (($script:LBLG_RETCODE -band $nCode)) {                                    #
         Lg "Critical error occured, end of script"                                 #
         LBLG_Exit                                                                  #
      }                                                                             #
   }                                                                                #
   #                                                                                -----------------------------------
   $global:ErrorActionPreference = "Continue"                                       #
}
#
# ********* END OF FILE ***********************************************************************************************
