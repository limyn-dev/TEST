#                                                                                   -----------------------------------
# ********** GLOBALS **************************************************************************************************
#                                                                            ERRORS >----------------------------------
[INT] $script:LPKG_ERR_WARNING      =     1                                         # ---- ---- ---- ---X
[INT] $script:LPKG_ERR_PROCESS_LOCK =     2                                         # ---- ---- ---- --X-
[INT] $script:LPKG_ERR_WAIT_REBOOT  =     4                                         # ---- ---- ---- -X--
[INT] $script:LPKG_ERR_PREREQUISITE =     8                                         # ---- ---- ---- X---
[INT] $script:LPKG_ERR_APP_INSTALL  =    16                                         # ---- ---- ---X ----
[INT] $script:LPKG_ERR_APP_REMOVE   =    32                                         # ---- ---- --X- ----
[INT] $script:LPKG_ERR_USR_CONFIG   =    64                                         # ---- ---- -X-- ----
[INT] $script:LPKG_ERR_PKG_VALIDATE =   256                                         # ---- ---X ---- ----
[INT] $script:LPKG_ERR_UNKNOWN      =  2048                                         # ---- X--- ---- ----
[INT] $script:LPKG_ERR_SCRIPT_INIT  = 16384                                         # X--- ---- ---- ----
#                                                                               LOG >----------------------------------
[string]    $script:LPKG_LOGROOT  = "$($Env:programdata)\ICRC\Logs"                 #
[string]    $script:LPKG_LOG_DIR  = ""                                              #
[int]       $script:LPKG_LSTEP_C  = 0                                               #
[int]       $script:LPKG_LSTEP_M  = 0                                               #
[int]       $script:LPKG_RETCODE  = 0                                               #
[int]       $script:LPKG_LOG_WTH  = 300                                             #
#                                                                             PATHS >----------------------------------
[string]    $script:LPKG_ALLU_DT  = "c:\users\public\desktop"                       # All users desktop
[string]    $script:LPKG_ALLU_SM  = "$($env:PROGRAMDATA)\Microsoft\Windows"         # All users start menu
            $script:LPKG_ALLU_SM += "\Start Menu\Programs"                          #
[hashtable] $script:LPKG_USR_PRF  = @{}                                             #
#                                                                           REGISTY >----------------------------------
[string]    $script:LPKG_KEY_PKG  = 'HKLM:\Software\ICRC\Packages'                  # ICRC package registration
[string]    $script:LPKG_KEY_WNT  = 'SOFTWARE\Microsoft\Windows NT\CurrentVersion'  # Windows NT key
[string]    $script:LPKG_KEY_WIN  = 'SOFTWARE\Microsoft\Windows\CurrentVersion'     # Windows NT key
[string]    $script:LPKG_KEY_UAC  = "HKLM:\$($script:LPKG_KEY_WIN)\Policies\System" #
[string]    $script:LPKG_KEY_PFS  = "$($script:LPKG_KEY_WNT)\ProfileList"           # Profiles registry key
[int]       $script:LPKG_REG_CNT  = 0                                               # Registry count result
[hashtable] $script:LPKG_REG_VLS  = @{}                                             # Registry values
#                                                                      MSI products >----------------------------------
[Xml.XmlDocument] $script:LPKG_MSI_XML = $null                                      # Return XML value
[string]          $script:LPKG_MSI_STR = ""                                         # Return string value
#                                                                          PASSWORD >----------------------------------
[hashtable] $script:LPKG_PSW_LEN  = @{ "Minimum"=10; "Maximum"=20 }                 # Password length
[hashtable] $script:LPKG_PSW_NSC  = @{ "Minimum"=2 ; "Maximum"=5  }                 # Number of special character
[string]    $script:LPKG_PSW_NEW = ""                                               # Last generated password
#                                                                               SMO >----------------------------------
[object]    $script:LPKG_SMO_SRV  = $null                                           #
[object]    $script:LPKG_SMO_RLT  = $null                                           #
[string[]]  $script:LPKG_SMO_DBL  = @()                                             #
#                                                                        SQL CLIENT >----------------------------------
[object]    $script:LPKG_SQL_CON  = $null                                           #
[object]    $script:LPKG_SQL_CMD  = $null                                           #
[object]    $script:LPKG_SQL_DTS  = $null                                           #
#######################################################################################################################
# LOG
#######################################################################################################################
function LibInit              {
   param ( [string] $sScriptPath = ""
         , [string] $sScriptName = ""
         , [string] $sLogPath    = "$($Env:programdata)\ICRC\Logs"
         )
   ##################################################################################
   ##################################################################################
   #                                                                                -----------------------------------
   if (!(TEST-PATH $sScriptPath)) { MD $sScriptPath | OUT-NULL }                    # Set current location
   Set-Location $sScriptPath                                                        #
   #                                                                                -----------------------------------
   $script:LPKG_LOGROOT = $sLogPath                                                 # Set log path
   $script:LPKG_LOG_DIR = "$sLogPath\$sScriptName"                                  #
   if (!(TEST-PATH $script:LPKG_LOG_DIR)) { MD $script:LPKG_LOG_DIR | OUT-NULL }    #
   #                                                                                -----------------------------------
}
function ScriptStart          {
   param ( [string] $sLogPrefix = ""
         , [int]    $sStepsMax  = 0
         )
   ##################################################################################
   ##################################################################################
   [string] $F = ""                                                                 #
   [object] $S = $null                                                              #
   #                                                                                -----------------------------------
   $script:LPKG_LSTEP_M = $sStepsMax                                                # Init steps max
   #                                                                                -----------------------------------
   $S = NEW-OBJECT "Management.Automation.Host.Size" @($script:LPKG_LOG_WTH, 3000)  # Set console size
   (GET-HOST).UI.RawUI.BufferSize = $S                                              #
   #                                                                                -----------------------------------
   $F = $script:LPKG_LOG_DIR                                                        #
   $F += "\$($sLogPrefix)_" + ([guid]::NewGuid()).ToString() + ".log"               #
   Start-Transcript -Path $F                                                        #
   #                                                                                -----------------------------------
   ""             | OUT-HOST                                                        # Log start
   ("=" * 80)     | OUT-HOST                                                        #
   "START SCRIPT" | OUT-HOST                                                        #
   ("=" * 80)     | OUT-HOST                                                        #
   ""             | OUT-HOST                                                        #
   #                                                                                -----------------------------------
}
function ScriptExit           {
   ##################################################################################
   ##################################################################################
   #                                                                                -----------------------------------
   ""                                                       | OUT-HOST              #
   ("=" * 80)                                               | OUT-HOST              #
   "End of script, return code [$($script:LPKG_RETCODE )]"  | OUT-HOST              #
   ("=" * 80)                                               | OUT-HOST              #
   ""                                                       | OUT-HOST              #
   #                                                                                -----------------------------------
   Stop-Transcript                                                                  #
   #                                                                                -----------------------------------
   Exit $script:LPKG_RETCODE                                                        #
   #                                                                                -----------------------------------
}
function Lg                   {
   param ([string] $sText = "")
   ##################################################################################
   ##################################################################################
   [string] $T = "$(Get-Date -Format "dd.MM.yyyy HH:mm:ss")"                        #
   #                                                                                -----------------------------------
   "$T > $sText" | OUT-HOST                                                         #
   #                                                                                -----------------------------------
}
function Lv                   {
   param ( [string] $sCaller = ""
         , [string] $sText   = ""
         )
   ##################################################################################
   ##################################################################################
   [string] $T = ""                                                                 #
   #                                                                                -----------------------------------
   if ($sCaller.Length -lt 18) { $T = (" " *(18-$sCaller.Length)) }                 #
   #                                                                                -----------------------------------
   "$T $sCaller :    $sText" | OUT-HOST                                             #
   #                                                                                -----------------------------------
}
function Le                   {
   param ( [int]  $nCode     = 0
         , [bool] $bCritical = $false
         )
   ##################################################################################
   ##################################################################################
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
      $script:LPKG_RETCODE = $script:LPKG_RETCODE -bor $nCode                       #    Set return code
   }                                                                                #
   #                                                                                -----------------------------------
   $error.Clear()                                                                   # Reset errors
   #                                                                                -----------------------------------
   if ($bCritical) {                                                                # Exit if critical
      if (($script:LPKG_RETCODE -band $nCode)) {                                    #
         Lg "Critical error occured, end of script"                                 #
         ScriptExit                                                                 #
      }                                                                             #
   }                                                                                #
   #                                                                                -----------------------------------
}
function LStep                {
   param ( [string] $sDescription = "" )
   ##################################################################################
   ##################################################################################
   [string] $S = ""                                                                 #
   #                                                                                -----------------------------------
   $script:LPKG_LSTEP_C++                                                           # Update step counter
   #                                                                                -----------------------------------
   $S = $script:LPKG_LSTEP_C                                                        # Set step counter
   if ($script:LPKG_LSTEP_M -ne 0)  { $S = "$S/$($script:LPKG_LSTEP_M)" }           #
   #                                                                                -----------------------------------
   Lg ""                                                                            # Write step
   Lg ("-" * 80)                                                                    #
   Lg "[$S] - $sDescription"                                                        #
   #                                                                                -----------------------------------
}
#######################################################################################################################
# FILE SYSTEM
#######################################################################################################################
function FolderMirror         {
   param ( [string] $sSource = ""
         , [string] $sTarget = ""
         )
   ##################################################################################
   ##################################################################################
   [string] $S = $sSource                                                           #
   [string] $T = $sTarget                                                           #
   #                                                                                -----------------------------------
   Lv "FolderMirror" "Set folder content"                                           #
   Lv "FolderMirror" "   Source [$S]"                                               #
   Lv "FolderMirror" "   Target [$T]"                                               #
   #                                                                                -----------------------------------
   if (!(TEST-PATH $T)) { MD $T -Force | OUT-NULL }                                 # Create path if not exists
   robocopy.exe $S $T /MIR /R:100 /W:3 /NFL /NDL /NJH                               #
   #                                                                                -----------------------------------
}
function FolderMirrorAll      {
   param ( [string] $sSource = ""
         , [string] $sTarget = ""
         )
   ##################################################################################
   # Copy source files to all folder that match target path.                        #
   # Files that not exists in source path are not modified.                         #
   ##################################################################################
   [string] $S = $sSource                                                           #
   [string] $T = ""                                                                 #
   #                                                                                -----------------------------------
   GI $sTarget | ? { $_.PsIsContainer } | % {                                       #
      $T = $_.FullName                                                              #
      Lv "FolderMirrorAll" "Set folder content"                                     #
      Lv "FolderMirrorAll" "   Source [$S]"                                         #
      Lv "FolderMirrorAll" "   Target [$T]"                                         #
      robocopy.exe $S $T /MIR /R:100 /W:3 /NFL /NDL /NJH                            #
   }                                                                                #
   #                                                                                -----------------------------------
}
function FolderUpdate         {
   param ( [string] $sSource = ""
         , [string] $sTarget = ""
         )
   ##################################################################################
   ##################################################################################
   [string] $S = $sSource                                                           #
   [string] $T = $sTarget                                                           #
   #                                                                                -----------------------------------
   Lv "FolderUpdate" "Set folder content"                                           #
   Lv "FolderUpdate" "   Source [$S]"                                               #
   Lv "FolderUpdate" "   Target [$T]"                                               #
   #                                                                                -----------------------------------
   if (!(TEST-PATH $T)) { MD $T -Force | OUT-NULL }                                 # Create path if not exists
   #                                                                                -----------------------------------
   robocopy.exe $S $T /e /R:100 /W:3 /NFL /NDL /NJH                                 # Set content
   #                                                                                -----------------------------------
}
function FolderUpdateAll      {
   param ( [string] $sSource = ""
         , [string] $sTarget = ""
         )
   ##################################################################################
   # Copy source files to all folder that match target path.                        #
   # Files that not exists in source path are not modified.                         #
   ##################################################################################
   [string] $S = $sSource                                                           #
   [string] $T = ""                                                                 #
   #                                                                                -----------------------------------
   GI $sTarget | ? { $_.PsIsContainer } | % {                                       #
      $T = $_.FullName                                                              #
      Lv "FolderUpdateAll" "Update folder"                                          #
      Lv "FolderUpdateAll" "   Source [$S]"                                         #
      Lv "FolderUpdateAll" "   Target [$T]"                                         #
      robocopy.exe $S $T /e /R:100 /W:3 /NFL /NDL /NJH                              #
   }                                                                                #
   #                                                                                -----------------------------------
}
function FolderRemove         {
   param ( [string] $sPath = "" )
   ##################################################################################
   ##################################################################################
   #                                                                                -----------------------------------
   if (TEST-PATH $sPath) {                                                          #
      Lv "FolderRemove" "Delete folder [$sPath]"                                    #
      RI $sPath -Recurse -Force                                                     #
   }                                                                                #
   else {                                                                           #
      Lv "FolderRemove" "Folder not found [$sPath]"                                 #
   }                                                                                #
   #                                                                                -----------------------------------
}
#######################################################################################################################
# REGISTRY
# 
# Types of registry values:
#    String      : Equivalent to REG_SZ.
#    ExpandString: Equivalent to REG_EXPAND_SZ.
#    Binary      : Equivalent to REG_BINARY.
#    DWord       : Equivalent to REG_DWORD.
#    MultiString : Equivalent to REG_MULTI_SZ.
#    Qword       : Equivalent to REG_QWORD.
#    Unknown     : Indicates an unsupported registry data type, such as REG_RESOURCE_LIST.
#
#######################################################################################################################
function RegSetKey            {
   param ( [Parameter(Mandatory=$True)][String] $sKey  = "" )
   ##################################################################################
   ##################################################################################
   [string] $P = ""                                                                 #
   #                                                                                -----------------------------------
   $sKey.Split("\") | % {                                                           # Set key path
      if ($P -ne "") { $P += "\" }; $P += $_                                        #
      if (!(TEST-PATH $P)) {                                                        #
         Lv "RegSetKey" "Create key [$P]"                                           #
         MD $P | OUT-NULL                                                           #
      }                                                                             #
   }                                                                                #
   #                                                                                -----------------------------------
}
function RegValueCount        {
   param ( [Parameter(Mandatory=$True)] [String] $sKey  = ""
         , [Parameter(Mandatory=$True)] [String] $sName = ""
         )
   ##################################################################################
   ##################################################################################
   #                                                                                -----------------------------------
   $script:LPKG_REG_CNT = 0                                                         # Initialize counter
   #                                                                                -----------------------------------
   if (!(TEST-PATH $sKey)) { return }                                               # Check if key exists
   #                                                                                -----------------------------------
   (GI $sKey).GetValueNames() | % { if ($_ -like $sName) {$script:LPKG_REG_CNT++} } # Count values like value name
   #                                                                                -----------------------------------
}
function RegValueGet          {
   param ( [Parameter(Mandatory=$True)] [String] $sKey  = "")
   ##################################################################################
   # Build an hashtable based on values of registry key                             #
   ##################################################################################
   [Microsoft.Win32.RegistryKey] $K = $null                                         #
   [string]                      $S = ""                                            #
   #                                                                                -----------------------------------
   $script:LPKG_REG_VLS = @{}                                                       #
   #                                                                                -----------------------------------
   if (!(TEST-PATH $sKey)) { Lv "RegValueGet" "Key not found [$sKey]" }             #
   #                                                                                -----------------------------------
   if ((GI $sKey).GetType().Name -like 'RegistryKey')   {                           #
      $K = GI $sKey                                                                 #
      $K.GetValueNames() | % { $script:LPKG_REG_VLS.Add($_, $K.GetValue($_)) }      #
   }                                                                                #
   else                          {                                                  #
      GI $sKey | % {                                                                #
         $K = $_; $K.GetValueNames() | % {                                          #
            $script:LPKG_REG_VLS.Add("$($K.Name)\$($_)", $K.GetValue($_))           #
         }                                                                          #
      }                                                                             #
   }                                                                                #
   #                                                                                -----------------------------------
}
function RegValueSet          {
   param ( [Parameter(Mandatory=$True)] [String] $sKey  = ""
         , [Parameter(Mandatory=$True)] [String] $sName = ""
         , [Parameter(Mandatory=$True)] [object] $oData = $null
         , [Parameter(Mandatory=$True)] [String] $sType = ""
         )
   ##################################################################################
   ##################################################################################
   [object] $K = $null                                                              #
   #                                                                                -----------------------------------
   RegSetKey $sKey                                                                  # Set key
   #                                                                                -----------------------------------
   Lv "RegValueSet" "Set registry value"                                            # Set value
   Lv "RegValueSet" "   Key   [$sKey]"                                              #
   Lv "RegValueSet" "   Name  [$sName]"                                             #
   Lv "RegValueSet" "   Value [$oData]"                                             #
   $K = New-ItemProperty $sKey $sName -value $oData -PropertyType $sType -Force     #
   #                                                                                -----------------------------------
}
function RegValueDel          {
   param ( [Parameter(Mandatory=$True)] [String] $sKey  = ""
         , [Parameter(Mandatory=$True)] [String] $sName = ""
         )
   ##################################################################################
   ##################################################################################
   [object] $K = $null                                                              #
   #                                                                                -----------------------------------
   if (!(TEST-PATH $sKey)) {                                                        # Check registry key
      Lv "RegValueDel" "Unable to find key [$sKey]"                                 #
      return                                                                        #
   }                                                                                #
   if ((GET-ITEM $sKey).GetValue($sName) -eq $null) {                               #
      Lv "RegValueDel" "Unable to find value [$sName]"                              #
      return                                                                        #
   }                                                                                #
   #                                                                                -----------------------------------
   Lv "RegValueDel" "Delete registry value"                                         # Delete value
   Lv "RegValueDel" "   Key   [$sKey]"                                              #
   Lv "RegValueDel" "   Name  [$sName]"                                             #
   RP $sKey $sName -Force | OUT-NULL                                                #
   #                                                                                -----------------------------------
}
#######################################################################################################################
# ACCOUNT RIGHTS
#
#   WinNT: user flags
#      ADS_UF_SCRIPT                                  = 1,       0 00000000 00000000 0000000* // 0x1
#      ADS_UF_ACCOUNTDISABLE                          = 2,       0 00000000 00000000 000000*0 // 0x2
#      ADS_UF_HOMEDIR_REQUIRED                        = 8,       0 00000000 00000000 0000*000 // 0x8
#      ADS_UF_LOCKOUT                                 = 16,      0 00000000 00000000 000*0000 // 0x10
#      ADS_UF_PASSWD_NOTREQD                          = 32,      0 00000000 00000000 00*00000 // 0x20
#      ADS_UF_PASSWD_CANT_CHANGE                      = 64,      0 00000000 00000000 0*000000 // 0x40
#      ADS_UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED         = 128,     0 00000000 00000000 *0000000 // 0x80
#      ADS_UF_TEMP_DUPLICATE_ACCOUNT                  = 256,     0 00000000 0000000* 00000000 // 0x100
#      ADS_UF_NORMAL_ACCOUNT                          = 512,     0 00000000 000000*0 00000000 // 0x200
#      ADS_UF_INTERDOMAIN_TRUST_ACCOUNT               = 2048,    0 00000000 00000*00 00000000 // 0x800
#      ADS_UF_WORKSTATION_TRUST_ACCOUNT               = 4096,    0 00000000 0000*000 00000000 // 0x1000
#      ADS_UF_SERVER_TRUST_ACCOUNT                    = 8192,    0 00000000 000*0000 00000000 // 0x2000
#      ADS_UF_DONT_EXPIRE_PASSWD                      = 65536,   0 0000000* 00000000 00000000 // 0x10000
#      ADS_UF_MNS_LOGON_ACCOUNT                       = 131072,  0 000000*0 00000000 00000000 // 0x20000
#      ADS_UF_SMARTCARD_REQUIRED                      = 262144,  0 00000*00 00000000 00000000 // 0x40000
#      ADS_UF_TRUSTED_FOR_DELEGATION                  = 524288,  0 0000*000 00000000 00000000 // 0x80000
#      ADS_UF_NOT_DELEGATED                           = 1048576, 0 000*0000 00000000 00000000 // 0x100000
#      ADS_UF_USE_DES_KEY_ONLY                        = 2097152, 0 00*00000 00000000 00000000 // 0x200000
#      ADS_UF_DONT_REQUIRE_PREAUTH                    = 4194304, 0 0*000000 00000000 00000000 // 0x400000
#      ADS_UF_PASSWORD_EXPIRED                        = 8388608, 0 *0000000 00000000 00000000 // 0x800000
#      ADS_UF_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION  = 16777216 * 00000000 00000000 00000000 // 0x1000000
#
#######################################################################################################################
function PASSWORD_NEW         {
   ##################################################################################
   ##################################################################################
   [int32]  $L = 10                                                                 #
   [int32]  $N = 0                                                                  #
   #                                                                                -----------------------------------
   if ($script:LPKG_PSW_LEN["Minimum"] -lt $script:LPKG_PSW_LEN["Maximum"]) {       # Set password characteristic
      $L = GET-RANDOM @script:LPKG_PSW_LEN                                          #
   }                                                                                #
   if ($script:LPKG_PSW_NSC["Minimum"] -lt $script:LPKG_PSW_NSC["Maximum"]) {       #
      $N = GET-RANDOM @script:LPKG_PSW_NSC                                          #
   }                                                                                #
   #                                                                                -----------------------------------
   Lv "PASSWORD_NEW" "Create password [$L][$N]"                                     # Generate password
   [System.Reflection.Assembly]::LoadWithPartialName("System.Web") | Out-Null       #
   $script:LPKG_PSW_NEW = [System.Web.Security.Membership]::GeneratePassword($L,$N) #
   #                                                                                -----------------------------------
}
function ADSI_LUserSet        {
   param ( [string] $sUserName     = ""
         , [string] $sPassword     = ""
         , [string] $sDescription  = ""
         , [int]    $nFlags        = 0
         )
   ##################################################################################
   ##################################################################################
   [string] $F = ""                                                                 #
   [string] $P = $sPassword                                                         #
   [ADSI]   $C = [ADSI]"WinNT://$env:COMPUTERNAME"                                  #
   [ADSI]   $U = $null                                                              #
   [int32]  $L = 10                                                                 #
   [int32]  $N = 0                                                                  #
   #                                                                                -----------------------------------
   if ($sUserName -eq "") { WRITE-ERROR "Empty Username"; return }                  # Return if no user
   #                                                                                -----------------------------------
   $F = "(LocalAccount='True') AND (Name LIKE '$sUserName')"                        # Create user if not exists
   if ((GWMI -Class Win32_UserAccount -Filter $F) -eq $null) {                      #
      if ($P -eq "") { PASSWORD_NEW; $P = $script:LPKG_PSW_NEW }                    #    Create password if not defined
      Lv "ADSI_LocalUserSet" "Create user [$sUserName][$P]"                         #    New user
      $U = $C.Create("User", $sUserName)                                            #
      $U.SetPassword($P)                                                            #
      $U.SetInfo()                                                                  #
   }                                                                                #
   else {                                                                           #
      Lv "ADSI_LocalUserSet" "User already exists."                                 #    Existing user
      $U = [adsi]"WinNT://$($env:computername)/$sUserName,user"                     #
      if ($P -ne "") {                                                              #
         Lv "ADSI_LocalUserSet" "   Set password."                                  #
         $U.SetPassword($P)                                                         #
         $U.SetInfo()                                                               #
      }                                                                             #
   }                                                                                #
   #                                                                                -----------------------------------
   if ($sDescription -ne "") {                                                      # Set description
      Lv "ADSI_LocalUserSet" "   Set description [$sDescription]."                  #
      $U.Put('Description', $sDescription)                                          #
      $U.SetInfo()                                                                  #
   }                                                                                #
   #                                                                                -----------------------------------
   if ($nFlags) {                                                                   # Set user flags
      Lv "ADSI_LocalUserSet" "   Set user flags [$nFlags]."                         #
      $U.UserFlags.value = $U.UserFlags.value -bor $nFlags                          #
      $U.SetInfo()                                                                  #
   }                                                                                #
   #                                                                                -----------------------------------
}
function ADSI_LUserDel        {
   param ( [string] $sUserName = "" )
   ##################################################################################
   ##################################################################################
   [ADSI]                              $C = [ADSI]"WinNT://$env:COMPUTERNAME"       #
   [Management.Automation.ScriptBlock] $F = $null                                   #
   #                                                                                -----------------------------------
   $F = {($_.SchemaClassName -eq 'user') -and ($_.Name -like $sUserName)}           # Check if user exists
   if (($C.Children | ? $F) -eq $null) {                                            #
      Lv "ADSI_LUserDel" "User [$sUserName] not found"                              #
      return                                                                        #
   }                                                                                #
   #                                                                                -----------------------------------
   Lv "ADSI_LUserDel" "Delete local user [$sUserName]"                              # Remove user
   $C.Delete('User', $sUserName)                                                    #
   #                                                                                -----------------------------------
}
function ADSI_LGroupSet       {
   param ( [string] $sGroupName    = ""
         , [string] $sDescription  = ""
         )
   ##################################################################################
   ##################################################################################
   [ADSI] $C = [ADSI]"WinNT://$env:COMPUTERNAME"                                    #
   [ADSI] $O = $null                                                                #
   #                                                                                -----------------------------------
   if ((GWMI -Class Win32_Group -Filter "Name='$sGroupName'") -eq $null) {          # Create group if not exists
      Lv "ADSI_LGroupSet" "Create group [$sGroupName]"                              #    Not exists, create it
      $O = $C.Create("Group", $sGroupName)                                          #
      $O.SetInfo()                                                                  #    Make change
   }                                                                                #
   #                                                                                -----------------------------------
   Lv "ADSI_LGroupSet" "Set group [$sGroupName]"                                    # Configure group
   $O = [adsi]"WinNT://$env:computername/$sGroupName,group"                         #    Get group object
   $O.Put('Description', $sDescription)                                             #    Set description
   $O.SetInfo()                                                                     #    Make change
   #                                                                                -----------------------------------
}
function ADSI_LGroupAddUser   {
   param ( [string] $sGroupName  = ""
         , [string] $sUserName   = ""
         , [string] $sUserDomain = $env:COMPUTERNAME
         )
   ##################################################################################
   ##################################################################################
   [ADSI]   $G = [ADSI]"WinNT://$($env:COMPUTERNAME)/$sGroupName,group"             #
   [string] $A = "$sUserDomain/$sUserName"                                          #
   #                                                                                -----------------------------------
   if (($G.Members() | ? {([ADSI]$_).Path -like "*$A" }) -ne $null) {               # Check if already member
      Lv "ADSI_LGroupAddUser" "[$A] is already member of [$sGroupName]."            #
      return                                                                        #
   }                                                                                #
   #                                                                                -----------------------------------
   Lv "ADSI_LGroupAddUser" "Add [$A] to member of [$sGroupName]"                    # Add group member
   $G.Add("WinNT://$A, user")                                                       #
   #                                                                                -----------------------------------
}
function ADSI_LGroupAddGroup  {
   param ( [string] $sGroupName    = ""
         , [string] $sMemberName   = ""
         , [string] $sMemberDomain = $env:COMPUTERNAME
         )
   ##################################################################################
   ##################################################################################
   [ADSI]   $G = [ADSI]"WinNT://$($env:COMPUTERNAME)/$sGroupName,group"             #
   [string] $A = "$sMemberDomain/$sMemberName"                                      #
   #                                                                                -----------------------------------
   if (($G.Members() | ? {([ADSI]$_).Path -like "*$A" }) -ne $null) {               # Check if already member
      Lv "ADSI_LGroupAddGroup" "//[$A] is already member of [$sGroupName]"          #
      return                                                                        #
   }                                                                                #
   #                                                                                -----------------------------------
   Lv "ADSI_LGroupAddGroup" "Add [$A] as member of [$sGroupName]"                   # Add group member
   $G.Add("WinNT://$A,group")                                                       #
   #                                                                                -----------------------------------
}
function ADSI_LGroupDel       {
   param ( [string] $sGroupName = "" )
   ##################################################################################
   ##################################################################################
   [ADSI]                              $C = [ADSI]"WinNT://$env:COMPUTERNAME"       #
   [Management.Automation.ScriptBlock] $F = $null                                   #
   #                                                                                -----------------------------------
   $F = {($_.SchemaClassName -eq 'group') -and ($_.Name -like $sGroupName)}         # Check if group exists
   if (($C.Children | ? $F) -eq $null) {                                            #
      Lv "ADSI_LUserDel" "Group [$sGroupName] not found."                           #
      return                                                                        #
   }                                                                                #
   #                                                                                -----------------------------------
   Lv "ADSI_LGroupDel" "Delete local group [$sGroupName]"                           # Remove group
   $C.Delete('Group', $sGroupName)                                                  #
   #                                                                                -----------------------------------
}
function ICACLS_Grant         {
   param ( [string] $sPath  = ""
         , [string] $sAccount  = ""
         , [string] $sRight = ""
   )
   ##################################################################################
   ##################################################################################
   [string] $A = """$sPath"" /C /grant ""$($sAccount):$($sRight)"""                 # Set parameters
   #                                                                                -----------------------------------
   Lv "ICACLS_Grant" "Exec icacls.exe with params [$A]"                             # Run command
   $P = [System.Diagnostics.Process]::Start("icacls.exe", $A)                       #
   $P.WaitForExit()                                                                 #
   Lv "ICACLS_Grant" "-> Return code [$($P.ExitCode)]"                              #
   #                                                                                -----------------------------------
}
function ICACLS_Remove        {
   param ( [string] $sPath     = ""
         , [string] $sAccount  = ""
   )
   ##################################################################################
   ##################################################################################
   [string] $A = "$sPath /C /Remove ""$($sAccount)"""                               # Set parameters
   #                                                                                -----------------------------------
   Lv "ICACLS_Remove" "Exec icacls.exe with params [$A]"                            # Run command
   $P = [System.Diagnostics.Process]::Start("icacls.exe", $A)                       #
   $P.WaitForExit()                                                                 #
   Lv "ICACLS_Remove" "-> Return code [$($P.ExitCode)]"                             #
   #                                                                                -----------------------------------
}
#######################################################################################################################
# SCHEULED TASKS
#######################################################################################################################
function SCHTASKS_Delete      {
   param ( [string] $sStName = "" )
   ##################################################################################
   ##################################################################################
   [string] $A = "/delete /f /TN $sStName"                                          # Set parameters
   #                                                                                -----------------------------------
   Lv "SCHTASKS_Delete" "Exec schtasks.exe with params [$A]"                        # Run command
   $P = [System.Diagnostics.Process]::Start("schtasks.exe", $A)                     #
   $P.WaitForExit()                                                                 #
   Lv "SCHTASKS_Delete" "-> Return code [$($P.ExitCode)]"                           #
   #                                                                                -----------------------------------
}
#######################################################################################################################
# PROCESS
#######################################################################################################################
function ProcCheck            {
   param ( [string[]] $aProcList = @() )
   ##################################################################################
   ##################################################################################
   [string] $P = ""                                                                 # Found process list
   #                                                                                -----------------------------------
   $error.Clear()                                                                   # Clear error list
   #                                                                                -----------------------------------
   $aProcList | % {                                                                 # check process list
      Lv "ProcCheck" "Check if process [$($_)] is started"                          #
      GET-PROCESS $_ -ErrorAction SilentlyContinue | OUT-NULL                       #
      if ($error.Count) { $error.Clear()                                 }          #    Not found -> OK
      else              { if ($P -eq "") {$P = $_} else {$P += ",$($_)"} }          #    Process found, add to list
   }                                                                                #
   #                                                                                -----------------------------------
   if ($P -ne "") { WRITE-ERROR "Lock process found [$P]" }                         # Check if process found
   #                                                                                -----------------------------------
}
function ProcStart            {
   param ( [String] $sExeFile   = ""
         , [String] $sArguments = ""
         , [int[]]  $aErrorCode = @(0)
         , [bool]   $bLockUAC   = $false
         )
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [System.Diagnostics.Process]  $P = $null                                         #
   [boolean]                     $F = $false                                        #
   [hashtable]                   $U = @{'V1'=0;'V2'=0}                              #
   [Microsoft.Win32.RegistryKey] $K = $null                                         #
   [hashtable]                   $A = @{}                                           #
                                 $A.Add('Path'        , $script:LPKG_KEY_UAC )      #
                                 $A.Add('Name'        , 'EnableLUA'          )      #
                                 $A.Add('value'       , ""                   )      #
                                 $A.Add('PropertyType','DWORD'               )      #
                                 $A.Add('Force'       , 1                    )      #
   #                                                                                -----------------------------------
   Lv "ProcStart" "Start process parameters:"                                       #
   Lv "ProcStart" "   Executable         [$($sExeFile)]"                            #
   Lv "ProcStart" "   Arguments          [$($sArguments)]"                          #
   Lv "ProcStart" "   Valid return codes [$($aErrorCode)]"                          #
   Lv "ProcStart" "   Lock UAC           [$($bLockUAC)]"                            #
   #                                                                                -----------------------------------
   if ($bLockUAC) {                                                                 # Lock UAC if requried
      Lv "ProcStart" "Lock UAC"                                                     #
      $K = GI $script:LPKG_KEY_UAC                                                  #
      $U['V1'] = $K.GetValue('EnableLUA')                                           #    Backup existing values
      $U['V2'] = $K.GetValue('ConsentPromptBehaviorAdmin')                          #
      $A['Name']  = 'EnableLUA'                                                     #    Set EnableLUA
      $A['value'] = 0                                                               #
      New-ItemProperty @A | OUT-NULL                                                #
      $A['Name']  = 'ConsentPromptBehaviorAdmin'                                    #    Set ConsentPromptBehaviorAdmin
      $A['value'] = 0                                                               #
      New-ItemProperty @A | OUT-NULL                                                #
   }                                                                                #
   #                                                                                -----------------------------------
   Lv "ProcStart" "Start process"                                                   # Run executable file
   if ($sArguments -eq "") {                                                        #
      $P = [System.Diagnostics.Process]::Start($sExeFile)                           #
   }                                                                                #
   else {                                                                           #
      $P = [System.Diagnostics.Process]::Start($sExeFile, $sArguments)              #
   }                                                                                #
   $P.WaitForExit()                                                                 #
   Lv "ProcStart" "-> Return code [$($P.ExitCode)]"                                 #
   #                                                                                -----------------------------------
   if ($bLockUAC) {                                                                 # Unlock UAC if requried
      Lv "ProcStart" "Unlock UAC"                                                   #
      $A['Name']  = 'EnableLUA'                                                     #
      $A['value'] = $U['V1']                                                        #
      New-ItemProperty @A | OUT-NULL                                                #
      $A['Name']  = 'ConsentPromptBehaviorAdmin'                                    #
      $A['value'] = $U['V2']                                                        #
      New-ItemProperty @A | OUT-NULL                                                #
   }                                                                                #
   #                                                                                -----------------------------------
   $aErrorCode | % { if ($P.ExitCode -eq $_) { $F = $true } }                       # Check return code
   if (!$F) { WRITE-ERROR "Return code error [$($P.ExitCode)]" }                    #
   else     { Lv "ProcStart" "Process return code success."     }                   #
   #                                                                                -----------------------------------
}
function ProcStartWaitMsi     {
   param ( [String] $sExeFile   = ""
         , [String] $sArguments = ""
         , [int[]]  $aErrorCode = @(0)
         )
   ##################################################################################
   ##################################################################################
   [System.Diagnostics.Process] $P = $null                                          # Process object
   [boolean]                    $F = $false                                         #
   #                                                                                -----------------------------------
   Lv "ProcStartWaitMsi" "Start process when MSI service is available."             # Run executable file
   Lv "ProcStartWaitMsi" "   Exe [$($sExeFile)]"                                    #
   Lv "ProcStartWaitMsi" "   Arg [$($sArguments)]"                                  #
   #                                                                                -----------------------------------
   If (!([System.Management.Automation.PSTypeName]'CMsiTool').Type) {               # Load types
      ADD-TYPE -Path ".\Lpkg_160927.cs"                                                #
   }                                                                                #
   #                                                                                -----------------------------------
   $P = [CMsiTool]::ExecWaitMsi($sExeFile, $sArguments)                             # Run install
   while (!$P.HasExited) {                                                          #    Wait end of process
      START-SLEEP -S 10                                                             #
      Lv "ProcStartWaitMsi" "process running..."                                    #
   }                                                                                #
   #                                                                                -----------------------------------
   Lv "ProcStartWaitMsi" "Process return code [$($P.ExitCode)]"                     # Check return code
   $aErrorCode | % { if ($P.ExitCode -eq $_) { $F = $true }    }                    #
   if (!$F) { WRITE-ERROR "Return code error [$($P.ExitCode)]" }                    #
   else     { Lv "ProcStart" "Process return code success."    }                    #
   #                                                                                -----------------------------------
}
#######################################################################################################################
# MSI
#######################################################################################################################
function MSI_FileQuery        {
   param ( [string] $sMsiFile = ""
         , [string] $sQuery   = ""
         )
   #--------------------------------------------------------------------------------#
   # Execute query on a database hosted by msi file                                 #
   #--------------------------------------------------------------------------------#
   [object] $I = New-Object -ComObject WindowsInstaller.Installer                   #
   [object] $D = $null                                                              #
   [object] $V = $null                                                              #
   [object] $R = $null                                                              #
   [string] $S = ""                                                                 #
   #                                                                                -----------------------------------
   $S = $sMsiFile                                                                   # Open MSI file
   Lv "MSI_FileQuery" "Open MSI file [$S]"                                          #
   $D = $I.GetType().InvokeMember("OpenDatabase","InvokeMethod",$Null,$I,@($S,0) )  #
   $S = $sQuery                                                                     # Open view based on query
   Lv "MSI_FileQuery" "Query MSI DB [$S]"                                           #
   $V = $D.GetType().InvokeMember("OpenView"  , "InvokeMethod", $null, $D, $S     ) #
        $V.GetType().InvokeMember("Execute"   , "InvokeMethod", $null, $V, $null  ) #
   $R = $V.GetType().InvokeMember("Fetch"     , "InvokeMethod", $null, $V, $null  ) # Get record
   $S = $R.GetType().InvokeMember("StringData", "GetProperty" , $null, $R, 1      ) # Get value
   #                                                                                -----------------------------------
   Lv "MSI_FileQuery" "Query result [$S]"                                           #
   $script:LPKG_MSI_STR = $S                                                        #
   #                                                                                -----------------------------------
}
function MSI_RegToProductCode {
   param ( [string] $sRegCode = "")
   #--------------------------------------------------------------------------------#
   # Conver registred product code to msi file product code                         #
   #--------------------------------------------------------------------------------#
                   #-0--1--2--3--4--5--6--7--8--9-10-11-12-13-14-15#                # Chars mapping
   [int[]]  $M  = @( 7, 6, 5, 4, 3, 2, 1, 0,11,10, 9, 8,15,14,13,12)                #
                   #16-17-18-19-20-21-22-23-24-25-27-27-29-28-30-31#                #
            $M += @(17,16,19,18,21,20,23,22,25,24,27,26,28,29,31,30)                #
   [string] $R = $sRegCode                                                          #
   [string] $P = ""                                                                 #
   #                                                                                -----------------------------------
   $R = $R.Replace("{", "")                                                         # Set registry code
   $R = $R.Replace("}", "")                                                         #
   $R = $R.Replace("-", "")                                                         #
   #                                                                                -----------------------------------
   for ([int] $N=0; $N -lt 8; $N++) { $P+=$R.SubString($M[$N],1) }; $P+='-'         # Set product code
   for ([int] $N=8; $N -lt 12; $N++) { $P+=$R.SubString($M[$N],1) }; $P+='-'        #
   for ([int] $N=12; $N -lt 16; $N++) { $P+=$R.SubString($M[$N],1) }; $P+='-'       #
   for ([int] $N=16; $N -lt 20; $N++) { $P+=$R.SubString($M[$N],1) }; $P+='-'       #
   for ([int] $N=20; $N -lt $M.Count; $N++) { $P+=$R.SubString($M[$N],1) }          #
   #                                                                                -----------------------------------
   $script:LPKG_MSI_STR = $P                                                        # Return result
   #                                                                                -----------------------------------
}
function MSI_Win32Product     {
   param ([string] $sProductCode = "")
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string]    $X = ""                                                              #
   [hashtable] $A = @{}                                                             #
               $A.Add('Class' , 'Win32_Product'                         )           #
               $A.Add('Filter', "IdentifyingNumber LIKE '$sProductCode'")           #
   #                                                                                -----------------------------------
   $script:LPKG_MSI_XML = $null                                                     #
   #                                                                                -----------------------------------
   GWMI @A | % { $script:LPKG_MSI_XML = $_ | ConvertTo-XML }                        #
   #                                                                                -----------------------------------
}
function MSI_GetInstalled     {
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string]    $S = ""                                                              #
   [hashtable] $H = @{}                                                             #
   [object[]]  $L = @()                                                             #
   [object[]]  $K = @()                                                             #
   [int]       $E = 0                                                               #
   [int]       $N = 100                                                             #
   #                                                                                -----------------------------------
   $S  = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer"                # Set registry key
   $S += "\UserData\*\Products\*\InstallProperties"                                 #
   $E = $error.count                                                                #
   while ($N) {                                                                     #
      $N--                                                                          #
      try   { $K = GI $S                           }                                #
      catch { Lv "MSI_GetInstalled" "ERROR occurs" }                                #
      if ($E -eq $error.count) { $N = 0            }                                #
      else                     {                                                    #
         Lv "MSI_GetInstalled" "ERROR on reading key [$S]"                          #
         $E = $error.count                                                          #
         START-SLEEP -s 5                                                           #
      }                                                                             #
   }                                                                                #
   Lv "MSI_GetInstalled" "Number of product found [$($K.Count)]"                    #
   #                                                                                -----------------------------------
   $K | % {                                                                         # Products registry parsing
      $S = $_.Name.SubString($_.Name.Length-50, 32)                                 #
      MSI_RegToProductCode $S                                                       #
      $H = @{}                                                                      #
      $H.Add('RGC', $S                             )                                #    Set registry code
      $H.Add('PDC', $script:LPKG_MSI_STR           )                                #    Set product code
      $H.Add('APM', $_.GetValue("Publisher")       )                                #    Set version
      $H.Add('APN', $_.GetValue("DisplayName")     )                                #    Set product name
      $H.Add('APV', $_.GetValue("DisplayVersion")  )                                #    Set version
      $H.Add('SRC', $_.GetValue("InstallSource")   )                                #    Set version
      $H.Add('CCH', $_.GetValue("LocalPackage")    )                                #    Set version
      $H.Add('UIS', $_.GetValue("UninstallString") )                                #    Set version
      $L += NEW-OBJECT PSObject -Property $H                                        #
   }                                                                                #
   #                                                                                -----------------------------------
   $script:LPKG_MSI_XML = $L | ConvertTo-Xml                                        # Return value
   #                                                                                -----------------------------------
}
function MSI_Install          {
   Param ( [string] $sSourceFile     = ""
         , [string] $sTransformsFile = ""
         , [bool]   $bNoRestart      = $true
         )
   ##################################################################################
   ##################################################################################
   [string]                     $S = $sSourceFile                                   # Source file
   [string]                     $T = $sTransformsFile                               # Transforms file
   [string]                     $A = ""                                             # Command line arguments
   [System.Diagnostics.Process] $P = $null                                          # Process object
   [int]                        $R = 0                                              #
   #                                                                                -----------------------------------
   Lv "MSI_Install" "Install package [$S]"                                          #
   #                                                                                -----------------------------------
   $A                     = "/QB-"                                                  # Buid command parameters
   if ($bNoRestart) { $A += " /norestart"          }                                #
   $A                    += " /I ""$S"""                                            #
   if ($T -ne "")   { $A += " TRANSFORMS=""$T"""   }                                #
   #                                                                                -----------------------------------
   If (!([System.Management.Automation.PSTypeName]'CMsiTool').Type) {               # Load types
      ADD-TYPE -Path ".\Lpkg_160927.cs"                                             #
   }                                                                                #
   #                                                                                -----------------------------------
   $R = 1618; while($R -eq 1618) {                                                  # Install
      $P = [CMsiTool]::ExecWaitMsi("MsiExec.exe", $A)                               #    Run command
      while (!$P.HasExited) {                                                       #    Wait end of process
         START-SLEEP -S 10                                                          #
         Lv "MSI_Install" "Installation running..."                                 #
      }                                                                             #
      $R = $P.ExitCode                                                              #    Get return code
      Lv "MSI_Install" "Process return code [$R]"                                   #
   }                                                                                #
   #                                                                                -----------------------------------
}
function MSI_Remove           {
   Param ( [string] $sProductCode = ""
         , [bool]   $bNoRestart   = $true
         )
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string]                     $C = $sProductCode.Replace('{',"").Replace('}',"")  # Set product code
   [hashtable]                  $A = @{}                                            # Command let arguments
   [string]                     $S = ""                                             # Generic string
   [System.Diagnostics.Process] $P = $null                                          # Process object
   [int]                        $R = 0                                              #
   #                                                                                -----------------------------------
   If (!([System.Management.Automation.PSTypeName]'CMsiTool').Type) {               # Load types
      ADD-TYPE -Path ".\Lpkg_160927.cs"                                             #
   }                                                                                #
   #                                                                                -----------------------------------
   $S                     = "/QB-"                                                  # Build msiexec arguments
   if ($bNoRestart) { $S += " /norestart" }                                         #
   $S                    += " /X {$C}"                                              #
   #                                                                                -----------------------------------
   Lv "MSI_Remove" "Remove product [$C]"                                            # Remove package
   $R = 1618; while($R -eq 1618) {                                                  #
      $P = [CMsiTool]::ExecWaitMsi("MsiExec.exe", $S)                               #    Run command
      while (!$P.HasExited) {                                                       #    Wait end of process
         START-SLEEP -S 10                                                          #
         Lv "MSI_Install" "Installation running..."                                 #
      }                                                                             #
      $R = $P.ExitCode                                                              #    Check return code
      Lv "MSI_Install" "Process return code [$R]"                                   #
   }                                                                                #
   #                                                                                -----------------------------------
}
#######################################################################################################################
# SERVICE
#######################################################################################################################
function ServiceSetAccount    {
   param ( [string]  $sServiceName  = ""
         , [string]  $sStartUser    = ""
         , [string]  $sStartPass    = ""
         )
   ##################################################################################
   ##################################################################################
   [string] $U = $sStartUser                                                        # StartName
   [string] $P = $sStartPass                                                        # StartPassword
   [object] $R = $null
   #                                                                                -----------------------------------
   if ($sServiceName -eq "") { WRITE-ERROR "Empty service name"; return }           # Return if no service name
   if ($U -eq "")            { WRITE-ERROR "Empty user name"   ; return }           # Return if no user name
   if ($P -eq "")            { WRITE-ERROR "Empty password"    ; return }           # Return if no password
   #                                                                                -----------------------------------
   gwmi win32_service -filter "name='$sServiceName'" | % {                          # Configure service
      Lv "ServiceSetAccount" "Set account [$U][$P] for service [$sServiceName]"     #
      $R = $_.change($null,$null,$null,$null,$null,$null,$U,$P,$null,$null,$null)   #
      Lv "ServiceSetAccount" " -> Return value [$($R.ReturnValue)]"                 #
   }                                                                                #
   #                                                                                -----------------------------------
}
function ServiceStart         {
   param ( [string] $sName = "")
   #                                                                                -----------------------------------
   [object] $oService = GET-SERVICE $sName                                          # Get service object
   #                                                                                -----------------------------------
   switch ($oService.Status) {                                                      #
      "Paused"          { Lv "ServiceStart" "Resume service"                        #
                          RESUME-SERVICE $sName                                     #
                          $oService.WaitForStatus("Running")                        #
                        }                                                           #
      "Running"         { Lv "ServiceStart" "Service [$sName] Already started"      #
                        }                                                           #
      "Stopped"         { Lv "ServiceStart" "Start service [$sName]"                #
                          START-SERVICE $sName                                      #
                          $oService.WaitForStatus("Running")                        #
                        }                                                           #
      "StartPending"    { Lv "ServiceStart" "Service starting, wait..."             #
                          $oService.WaitForStatus("Running")                        #
                        }                                                           #
      "ContinuePending" { Lv "ServiceStart" "Service resuming, wait..."             #
                          $oService.WaitForStatus("Running")                        #
                        }                                                           #
      "StopPending"     { Lv "ServiceStart" "Service stopping, wait..."             #
                          $oService.WaitForStatus("Stopped")                        #
                          Lv "ServiceStart" "Start service [$sName]"                #
                          START-SERVICE $sName                                      #
                          $oService.WaitForStatus("Running")                        #
                        }                                                           #
      "PausePending"    { Lv "ServiceStart" "Service stopping, pausing..."          #
                          $oService.WaitForStatus("Paused")                         #
                          Lv "ServiceStart" "Start service [$sName]"                #
                          RESUME-SERVICE $sName                                     #
                          $oService.WaitForStatus("Running")                        #
                        }                                                           #
      default           { Lv "ServiceStart" "Unknown status [$($oService.Status)]"} #
   }                                                                                #
   #                                                                                -----------------------------------
}
function ServiceStop          {
   param ( [string] $sName = "")
   #                                                                                -----------------------------------
   [object] $S = GET-SERVICE $sName                                                 # Get service object
   #                                                                                -----------------------------------
   switch ($S.Status)   {                                                           #
      "Paused"          { Lv "ServiceStop" "Service is paused"                   }  #
      "Running"         { Lv "ServiceStop" "Stop service [$sName]"                  #
                          STOP-SERVICE $sName; $S.WaitForStatus("Stopped")       }  #
      "Stopped"         { Lv "ServiceStop" "Service [$sName] already stopped"    }  #
      "StartPending"    { Lv "ServiceStop" "Service starting, wait..."              #
                          $S.WaitForStatus("Running")                               #
                          Lv "ServiceStop" "Stop service [$sName]"                  #
                          STOP-SERVICE $sName; $S.WaitForStatus("Stopped")       }  #
      "ContinuePending" { Lv "ServiceStop" "Service continue, wait..."              #
                          $S.WaitForStatus("Running")                               #
                          Lv "ServiceStop" "Stop service [$sName]"                  #
                          STOP-SERVICE $sName; $S.WaitForStatus("Stopped")       }  #
      "StopPending"     { Lv "ServiceStop" "Service stopping, wait..."              #
                          $S.WaitForStatus("Stopped")                            }  #
      "PausePending"    { Lv "ServiceStop" "Service stopping, pausing..."           #
                          $S.WaitForStatus("Paused")                                #
                          Lv "ServiceStop" "Start service [$sName]"                 #
                          RESUME-SERVICE $sName; $S.WaitForStatus("Running")        #
                          Lv "ServiceStop" "Stop service [$sName]"                  #
                          STOP-SERVICE $sName; $S.WaitForStatus("Stopped")       }  #
      default           { Lv "ServiceStop" "Unknown status [$($S.Status)]"       }  #
   }                                                                                #
   #                                                                                -----------------------------------
}
#######################################################################################################################
# ICRC PAXKAGE TAG
#######################################################################################################################
function PkgTag_INSTALL       {
   param ( [string] $sPkgName = "" )
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string[]] $A = $sPkgName.Replace(" - ", ";").Split(";")                         #
   [string]   $K = "$($script:LPKG_KEY_PKG)\$($A[0]) - $($A[1])"                    # Registry key
   [string]   $D = "INSTALLED_$(Get-Date -Format ""dd.MM.yyyy HH:mm:ss"")"          # Registry data
   #                                                                                -----------------------------------
   RegValueSet $K $sPkgName $D "String"                                             # Set value
   #                                                                                -----------------------------------
}
function PkgTag_UPGRADE       {
   param ( [string] $sPkgName = "" )
   #--------------------------------------------------------------------------------#
   # Product upgraded. It set TAG value to upgraded                                 #
   #--------------------------------------------------------------------------------#
   [string[]] $A = $sPkgName.Replace(" - ", ";").Split(";")                         #
   [string]   $K = "$($script:LPKG_KEY_PKG)\$($A[0]) - $($A[1])"                    # Registry key
   [string]   $D = "UPGRADED_$(Get-Date -Format ""dd.MM.yyyy HH:mm:ss"")"           # Registry data
   #                                                                                -----------------------------------
   RegValueCount $K $sPkgName; if (!($script:LPKG_REG_CNT)) { return }              # Do nothing if previous version not exists
   #                                                                                -----------------------------------
   RegValueSet $K $sPkgName $D "String"                                             # Set value
   #                                                                                -----------------------------------
}
function PkgTag_REMOVE        {
   param ( [string] $sPkgName = "" )
   #--------------------------------------------------------------------------------#
   # Product removal. It rename TAG key.                                            #
   #--------------------------------------------------------------------------------#
   [string[]] $A = $sPkgName.Replace(" - ", ";").Split(";")                         #
   [string]   $K = "$($script:LPKG_KEY_PKG)\$($A[0]) - $($A[1])"                    # Registry key
   [string]   $N = "$($A[0]) - $($A[1])"                                            # New name
              $N += " ->REM-$(Get-Date -Format ""yyMMdd-HHmmss"")"                  #
   #                                                                                -----------------------------------
   REN $K $N -force                                                                 # Set registry
   #                                                                                -----------------------------------
}
function PkgTag_CLEAN         {
   param ( [string] $sPkgName = "" )
   #--------------------------------------------------------------------------------#
   # Delete product TAG. Used before package reinstallation                         #
   #--------------------------------------------------------------------------------#
   [string[]] $A = $sPkgName.Replace(" - ", ";").Split(";")                         #
   [string]   $K = "$($script:LPKG_KEY_PKG)\$($A[0]) - $($A[1])"                    # Registry key
   #                                                                                -----------------------------------
   RP $K $sPkgName -Force                                                           # Delete value
   #                                                                                -----------------------------------
}
#######################################################################################################################
# USER PROFILE
#######################################################################################################################
function UsrPrfAdd            {
   param ( [string] $sUserGUID    = ""
         , [string] $sProfilePath = ""
         )
   ##################################################################################
   ##################################################################################
   [string] $F = "$sProfilePath\NTUSER.DAT"                                         #
   #                                                                                -----------------------------------
   $error.Clear()                                                                   # Load user hive
   if (!(TEST-PATH "HKU:\$sUserGUID"))  {                                           #
      if (TEST-PATH $F) {                                                           #
         Lv "UsrPrfAdd" "Load file [$F]"                                            #
         reg.exe LOAD "HKEY_USERS\$sUserGUID" $F | OUT-NULL                         #
      }                                                                             #
      else { WRITE-ERROR "File not found $F" }                                      #
   }                                                                                #
   if ($error.Count) { Le 0 $false; return }                                        #
   #                                                                                -----------------------------------
   Lv "UsrPrfAdd" "Add user [$I][$P]"                                               #    Add user to list
   $script:LPKG_USR_PRF.Add($I, $P)                                                 #
   #                                                                                -----------------------------------
}
function UsrPrfLoad           {
   ##################################################################################
   ##################################################################################
   [hashtable] $L = @{}
   [string] $P = ""                                                                 # Profile path
   [string] $I = ""                                                                 # Profile path
   #                                                                                -----------------------------------
   NEW-PSDRIVE "HKU" "Registry" "HKEY_USERS"  -Scope "Script" | OUT-NULL            # Create HKEY_USERS PS drive
   #                                                                                -----------------------------------
   Lg "Create users list"                                                           # Create users list
   GI -Path "HKLM:\$($script:LPKG_KEY_PFS)\*" | % {                                 #
      if ($_.GetValue("Guid") -ne $null) {                                          #    Check if domain user
         $I = $_.Name                                                               #    Get user GUID
         $I = $I.Replace("HKEY_LOCAL_MACHINE\", "")                                 #
         $I = $I.Replace("$($script:LPKG_KEY_PFS)\", "")                            #
         $P = $_.GetValue("ProfileImagePath")                                       #    Get profile path
         UsrPrfAdd $I $P                                                            #
      }                                                                             #
   }                                                                                #
   $script:LPKG_USR_PRF.Add(".DEFAULT", "C:\Users\Default")                         #    Add default profile
   #                                                                                -----------------------------------
}
#######################################################################################################################
# SMO
#######################################################################################################################
function SMO_Initialize       {
   ##################################################################################
   ##################################################################################
   [string]   $A ="Microsoft.SqlServer.Smo"                                         # Assembly name
   [object[]] $L = [appdomain]::currentdomain.getassemblies()                       #
   #                                                                                -----------------------------------
   if (!($L | WHERE { $_.FullName -like "*$A*" })) {                                # Load if requried
      [Reflection.Assembly]::LoadWithPartialName($A) | OUT-NULL                     #
   }                                                                                #
   #                                                                                -----------------------------------
}
function SMO_GetServeur       {
   param ( [string] $sSqlInstance = "" )
   ##################################################################################
   ##################################################################################
   SMO_Initialize                                                                   # SMO initialisation
   #                                                                                -----------------------------------
   [string]   $A ="Microsoft.SqlServer.Management.Smo.Server"                       # Assembly name
   #                                                                                -----------------------------------
   Lv "SMO_GetServeur" "Get SMO server from [$sSqlInstance]"                        # Get database
   $script:LPKG_SMO_SRV = New-Object -TypeName $A -ArgumentList $sSqlInstance       #
   #                                                                                -----------------------------------
}
function SMO_DbGet            {
   param ( [string] $sSqlInstance = ""
         , [string] $sDbName      = ""
         )
   ##################################################################################
   ##################################################################################
   SMO_Initialize                                                                   # SMO initialisation
   #                                                                                -----------------------------------
   SMO_GetServeur $sSqlInstance                                                     # Set SMO server
   #                                                                                -----------------------------------
   Lv "SMO_GetDB" "Get DB [$sDbName] from server [$sSqlInstance]"                   # Get database
   $script:LPKG_SMO_SRV.Databases | % {                                             #
      if (($_.Name -like $sDbName)) {$script:LPKG_SMO_DBL += $_.Name}               #
   }                                                                                #
   #                                                                                -----------------------------------
}
function SMO_DbDrop           {
   param ( [string] $sSqlInstance = ""
         , [string] $sDbName      = ""
         )
   ##################################################################################
   ##################################################################################
   SMO_Initialize                                                                   # SMO initialisation
   #                                                                                -----------------------------------
   SMO_GetServeur $sSqlInstance                                                     # Set SMO server
   #                                                                                -----------------------------------
   Lv "SMO_DbDrop" "Drop DB [$sDbName]"                                             # Drop database
   $script:LPKG_SMO_SRV.killallprocesses($sDbName)                                  #
   $script:LPKG_SMO_SRV.Databases[$sDbName].Drop()                                  #
   #                                                                                -----------------------------------
}
function SMO_ExecuteScalar    {
   param ( [string] $sConnectionString = ""
         , [string] $sSqlQuery         = ""
         )
   ##################################################################################
   ##################################################################################
   SMO_Initialize                                                                   # SMO initialisation
   #                                                                                -----------------------------------
   [Microsoft.SqlServer.Management.Smo.Server] $S = $null                           #
   #                                                                                -----------------------------------
   try {                                                                            #
      $S = New-Object Microsoft.SqlServer.Management.Smo.Server                     #
      Lv "SMO_ExecuteScalar" "Connect to [$sConnectionString]"                      #
      $S.ConnectionContext.ConnectionString = $sConnectionString                    #
      $script:LPKG_SMO_RLT = $S.ConnectionContext.ExecuteScalar($sSqlQuery)         #
   }                                                                                #
   catch {                                                                          #
      $script:LPKG_SMO_RLT = $null                                                  #
      Lv "SMO_ExecuteScalar" "!ERROR: Aterminating error occurs."                   #
   }                                                                                #
   #                                                                                -----------------------------------
}
function SMO_ExecuteNonQuery  {
   param ( [string] $sConnectionString = ""
         , [string] $sSqlCommand       = ""
         )
   ##################################################################################
   ##################################################################################
   SMO_Initialize                                                                   # SMO initialisation
   #                                                                                -----------------------------------
   [Microsoft.SqlServer.Management.Smo.Server] $S = $null                           #
   #                                                                                -----------------------------------
   try {                                                                            #
      $S = New-Object Microsoft.SqlServer.Management.Smo.Server                     #
      Lv "SMO_ExecuteNonQuery" "Connect to [$sConnectionString]"                    #
      $S.ConnectionContext.ConnectionString = $sConnectionString                    #
      Lv "SMO_ExecuteNonQuery" "Execute command [$sSqlCommand]"                     #
      $S.ConnectionContext.BeginTransaction()                                       #
      $S.ConnectionContext.ExecuteNonQuery($sSqlCommand)                            #
      $S.ConnectionContext.CommitTransaction()                                      #
   }                                                                                #
   catch {                                                                          #
      $S.ConnectionContext.RollBackTransaction()                                    #
      Lv "SMO_ExecuteNonQuery" "!ERROR: A terminating error occurs, rollback done." #
   }                                                                                #
   #                                                                                -----------------------------------
}
#######################################################################################################################
# SQLCMD
#######################################################################################################################
function SqlCmd_ExecAllAscend {
   param ( [string]    $sInstance   = ""
         , [string]    $sScriptPath = ""
         , [hashtable] $hTagValues  = @{}
         , [string]    $sOutputPath = ""
         )
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string]                     $A = ""                                             #
   [string[]]                   $C = @()                                            #
   [System.Diagnostics.Process] $P = $null                                          #
   [string]                     $V = ""
   #                                                                                -----------------------------------
   if ($sScriptPath -eq "")       { WRITE-ERROR "sScriptPath requried"; return }    #
   if (!(TEST-PATH $sScriptPath)) { WRITE-ERROR "SQL path not found"  ; return }    #
   #                                                                                -----------------------------------
   GCI $sScriptPath -Filter "*.sql" | SORT -Property Name | % {                     # Process SQL patchs files
      $A = "$sScriptPath\_$($_.Name)"                                               #
      Lv "SqlCmd_ExecAllAscend" "Open file [$($_.FullName)]"                        #
      $C = (GC $_.FullName)                                                         #
      $hTagValues.Keys | % {                                                        #
         $V = $hTagValues[$_]                                                       #
         Lv "SqlCmd_ExecAllAscend" "Set value of [$($_)] to [$V]"                   #
         $C = $C -Replace $_, $V                                                    #
      }                                                                             #
      $C | OUT-FILE $A -Force                                                       #
      $A  = "-S ""$sInstance"" -i ""$A"""                                           #
      if (TEST-PATH $sOutputPath) {                                                 #
         $A += " -o """                                                             #
         $A += ("$sOutputPath\$($_.Name)").ToLower().Replace(".sql",".log")         #
         $A += """"                                                                 #
      }                                                                             #
      Lv "SqlCmd_ExecAllAscend" "Execute sqlcmd.exe [$A]"                           #
      $P = [System.Diagnostics.Process]::Start("SqlCmd.exe", $A)                    #    Run sqlcmd.exe
      $P.WaitForExit()                                                              #    Wait end of process
      Lv "SqlCmd_ExecAllAscend" "-> Return code [$($P.ExitCode)]"                   #    Log return code
   }                                                                                #
   #                                                                                -----------------------------------
}
function SqlCmd_ExecFile      {
   param ( [string] $sInstance   = ""
         , [string] $sDataBase   = ""
         , [string] $sScriptFile = ""
         , [string] $sOutputFile = ""
         )
   ##################################################################################
   ##################################################################################
   [string]                     $A = ""                                             #
   [System.Diagnostics.Process] $P = $null                                          #
   #                                                                                -----------------------------------
   $A = "-S ""$sInstance"""                                                         # Build argument
   $A+= " -d ""$sDataBase"""                                                        #
   $A+= " -i ""$sScriptFile"""                                                      #
   $A+= " -o ""$sOutputFile"""                                                      #
   #                                                                                -----------------------------------
   Lv "SqlCmd_ExecFile" "   Instance    [$sInstance]"                               # Run command
   Lv "SqlCmd_ExecFile" "   DataBase    [$sDataBase]"                               #
   Lv "SqlCmd_ExecFile" "   Script file [$sScriptFile]"                             #
   Lv "SqlCmd_ExecFile" "   Output file [$sOutputFile]"                             #
   $P = [System.Diagnostics.Process]::Start("SqlCmd.exe", $A)                       #
   $P.WaitForExit()                                                                 #
   Lv "SqlCmd_ExecFile" "-> Return code [$($P.ExitCode)]"                           #
   #                                                                                -----------------------------------
}
function SqlCmd_ExecQuery     {
   param ( [string] $sInstance   = ""
         , [string] $sDataBase   = ""
         , [string] $sQuery      = ""
         )
   ##################################################################################
   ##################################################################################
   [string] $A = ""                                                                 #
   #                                                                                -----------------------------------
   $A = "-S ""$sInstance"""                                                         # Build argument
   $A+= " -d ""$sDataBase"""                                                        #
   $A+= " -Q ""$sQuery"""                                                           #
   #                                                                                -----------------------------------
   Lv "SqlCmd_ExecQuery" "Execute query"                                            # Run command
   $P = [System.Diagnostics.Process]::Start("SqlCmd.exe", $A)                       #
   $P.WaitForExit()                                                                 #
   Lv "SqlCmd_ExecQuery" "-> Return code [$($P.ExitCode)]"                          #
   #                                                                                -----------------------------------
}
#######################################################################################################################
# SQL CLIENT
#######################################################################################################################
function SQLCLI_ConOpen       {
   param( [string] $sConString = "" )
   #                                                                                -----------------------------------
   Lv "SQLCLI_ConOpen" "Connect [$sConString]"                                      # Create connection
   $script:LPKG_SQL_CON = New-Object System.Data.SqlClient.SqlConnection            #
   $script:LPKG_SQL_CON.ConnectionString = $sConString                              #
   try   { $script:LPKG_SQL_CON.Open() | OUT-NULL     }                             #
   catch { Lv "SQLCLI_ConOpen" "! CONNECTION ERROR."  }                             #
   #                                                                                -----------------------------------
}
function SQLCLI_ConClose      {
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [int]    $N = 720                                                                #
   [string] $M = ""                                                                 #
   #                                                                                -----------------------------------
   if ($script:LPKG_SQL_CON -eq $null) {                                            # Check if connection exists
      Lv "SQLCLI_ConClose" "Connection object not exists."                          #
      return                                                                        #
   }                                                                                #
   #                                                                                -----------------------------------
   while($N) {                                                                      #
      switch($script:LPKG_SQL_CON.State){                                           #
         "Broken"     { $M="Connection is Broken" ; $N=0                         }  #
         "Closed"     { $M="Connection is closed" ; $N=0                         }  #
         "Connecting" { $M="Connecting, wait..."  ; $N--                         }  #
         "Executing"  { $M="Executing, wait...;"  ; $N--                         }  #
         "Fetching"   { $M="Fetching, wait..."    ; $N--                         }  #
         "Open"       { $M="Close connection."    ; $script:LPKG_SQL_CON.Close() }  #
      }                                                                             #
      Lv "SQLCLI_ConClose" $M                                                       #
      if ($N) { START-SLEEP -s 5 }                                                  #
   }                                                                                #
   #                                                                                -----------------------------------
}
function SQLCLI_DataSetOpen   {
   param( [string] $sQuery = "" )
   ##################################################################################
   ##################################################################################
   [object] $A = $null                                                              #
   [int]    $R = 0                                                                  #
   #                                                                                -----------------------------------
   #Lv "SQLCLI_DataSetOpen" "Create SqlCommand"                                      # Create SqlCommand
   $script:LPKG_SQL_CMD = New-Object System.Data.SqlClient.SqlCommand               #
   $script:LPKG_SQL_CMD.Connection  = $script:LPKG_SQL_CON                          #
   $script:LPKG_SQL_CMD.CommandText = $sQuery                                       #
   #                                                                                -----------------------------------
   #Lv "SQLCLI_DataSetOpen" "Create SqlDataAdapter"                                  # Create SqlCommand
   $A = New-Object System.Data.SqlClient.SqlDataAdapter                             #
   $A.SelectCommand = $script:LPKG_SQL_CMD                                          #
   #                                                                                -----------------------------------
   #Lv "SQLCLI_DataSetOpen" "Initialize DataSet"                                     # Initialize DataSet
   $script:LPKG_SQL_DTS = New-Object System.Data.DataSet                            #
   #                                                                                -----------------------------------
   Lv "SQLCLI_DataSetOpen" "Execute query"                                          # Execute query
   try   { $R = $A.Fill($script:LPKG_SQL_DTS)            }                          #
   catch { Lv "SQLCLI_DataSetOpen" "! EXECUTION ERROR"   }                          #
   Lv "SQLCLI_DataSetOpen" " -> Number of record found [$R]"                        #
   #                                                                                -----------------------------------
}
function SQLCLI_ExecNonQuery  {
   param( [string] $sCommand = "" )
   ##################################################################################
   ##################################################################################
   #                                                                                -----------------------------------
   $script:LPKG_SQL_CMD = NEW-OBJECT System.Data.SqlClient.SqlCommand               #
   $script:LPKG_SQL_CMD.Connection  = $script:LPKG_SQL_CON                          #
   $script:LPKG_SQL_CMD.CommandText = $sCommand                                     #
   $script:LPKG_SQL_CMD.ExecuteNonQuery()                                           #
   #                                                                                -----------------------------------
}
#######################################################################################################################
# APP-V
#######################################################################################################################
function APV_Add              {
   param ( [string] $sFileAppv = "" )
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string] $P = $sFileAppv
   [object] $O = $null                                                              #
   #                                                                                -----------------------------------
   if (!(TEST-PATH $P)) { WRITE-ERROR "APP-V Package File Not Found [$P]"; return } #
   #                                                                                -----------------------------------
   Lv "APV_Add" "Add APP-V package from File [$P]"                                  # Add application
   $O = Add-AppvClientPackage -Path $P                                              #    Add the Appv Package
   Publish-AppvClientPackage $O -Global                                             #    Publish the Appv Package
   #                                                                                -----------------------------------
}
function APV_Remove           {
   param ( [string] $sPackageId  = ""
         , [string] $sVersionId  = ""
         )
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string]                                 $P = $sPackageId                        #
   [string]                                 $V = $sVersionId                        #
   [object]                                 $O = $null                              #
   [Management.Automation.ActionPreference] $E = $global:ErrorActionPreference      #
   #                                                                                -----------------------------------
   Lv "APV_Remove" "Get APP-V package [$sPackageId] [$sVersionId]"                  # Get application
   $O = Get-AppvClientPackage -PackageId $P -VersionId $V -All                      #
   if  ($O -eq $null) { Lv "APV_Remove" "APP-V package not found"; return }         #
   #                                                                                -----------------------------------
   Lv "APV_Remove" "Unpublish APP-V package"                                        # Unpublish
   $global:ErrorActionPreference = "SilentlyContinue"                               #
   if ($O.IsPublishedGlobally ) {                                                   #
      Stop-AppvClientPackage -PackageId $P -VersionId $V -Global | OUT-NULL         #
      Unpublish-AppvClientPackage -PackageId $P -VersionId $V -global | OUT-NULL    #
   }                                                                                #
   else {                                                                           #
      Stop-AppvClientPackage -PackageId $P -VersionId $V | OUT-NULL                 #
      Unpublish-AppvClientPackage -PackageId $P -VersionId $V | OUT-NULL            #
   }                                                                                #
   $global:ErrorActionPreference = $E                                               #
   #                                                                                -----------------------------------
   Lv "APV_Remove" "Remove APP-V package"                                           # Remove
   Remove-AppvClientPackage -PackageId $P -VersionId $V                             #
   #                                                                                -----------------------------------
}
function APV_Remove_Any       {
   param ( [string] $sAppvAnyOldPKG  = "" )
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   #                                                                                -----------------------------------
   Lv "APV_Remove_Any" "Remove Any App-V Package that name like [$sAppvAnyOldPKG]"  # Get Appv Package Name
   Get-AppVClientpackage -Name $sAppvAnyOldPKG -All | % {                           #
      APV_Remove $_.PackageId $_.VersionId                                          #
   }                                                                                #
   #                                                                                -----------------------------------
}
#######################################################################################################################
# SHORTCUTS
#######################################################################################################################
function LNK_Install          {
   param ( [string] $sLinkName    = ""
         , [string] $sLinkPath    = ""
         , [string] $sDescription = ""
         , [string] $sHotKeys     = ""
         , [string] $sCommandFile = ""
         , [string] $sCommandArgs = ""
         , [string] $sWorkingDir  = ""
   )
   ##################################################################################
   ##################################################################################
   [System.__ComObject] $O = NEW-OBJECT -comobject wscript.shell                    # COM object
   [string]             $N = "$sLinkPath\$($sLinkName).lnk"                         # Shortcut name
   #                                                                                -----------------------------------
   Lv "LNK_Install" "Create shortcut"                                               # Create new
   Lv "LNK_Install" "   Shortcut Name [$sLinkName]"                                 #
   Lv "LNK_Install" "   Shortcut Path [$sLinkPath]"                                 #
   Lv "LNK_Install" "   Command file  [$sCommandFile]"                              #
   Lv "LNK_Install" "   Command args  [$sCommandArgs]"                              #
   Lv "LNK_Install" "   Working dir   [$sWorkingDir]"                               #
   #                                                                                -----------------------------------
   if (!(TEST-PATH $sLinkPath)) {                                                   # Set link path
      Lv "LNK_Install" "Create folder [$sLinkPath]"                                 #
      MD $sLinkPath -Force | OUT-NULL                                               #
   }                                                                                #
   #                                                                                -----------------------------------
   $O = $O.CreateShortCut($N)                                                       # Create shortcut object
   $O.Description      = $sDescription                                              #
   $O.HotKey           = $sHotKeys                                                  #
   $O.TargetPath       = $sCommandFile                                              #
   $O.Arguments        = $sCommandArgs                                              #
   $O.WorkingDirectory = $sWorkingDir                                               #
   #                                                                                -----------------------------------
   if (TEST-PATH $N) { RI -Path $N -Force }                                         # Create new
   $O.Save()                                                                        #
   #                                                                                -----------------------------------
}
function LNK_Remove           {
   param ( [string] $sLinkPath  = ""
         , [string] $sLinkName  = ""
         )
   ##################################################################################
   ##################################################################################
   [string] $N = "$sLinkPath\$($sLinkName).lnk"
   #                                                                                -----------------------------------
   if (TEST-PATH $N) {                                                              # Remove existing
      Lv "LNK_Remove" "Delete existing shortcut [$N]"                               #
      RI -Path $N -Force                                                            #
   }                                                                                #
   else {                                                                           #
      Lv "LNK_Remove" "Shortcut not found [$N]"                                     #
   }                                                                                #
   #                                                                                -----------------------------------
}
#
# ********** EOF ******************************************************************************************************
