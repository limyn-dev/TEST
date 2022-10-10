

#
#region ********** ASSEMBLIES *****************************************************************************************
#
[Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')    | out-null    #
[Reflection.Assembly]::LoadWithPartialName('presentationframework')   | out-null    #
[Reflection.Assembly]::LoadWithPartialName('System.Drawing')          | out-null    #
[Reflection.Assembly]::LoadWithPartialName('WindowsFormsIntegration') | out-null    #
$windowcode = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
$asyncwindow = Add-Type -MemberDefinition $windowcode -name Win32ShowWindowAsync -namespace Win32Functions -PassThru
#
#endregion
#region ********** GLOBALS ********************************************************************************************
#
[string]    $script:SPATH = $MyInvocation.MyCommand.Definition                        # Script path
            $script:SPATH = SPLIT-PATH -Path $script:SPH -Parent                      #
[string]    $script:BRAVE = "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
[object]    $script:CMENU = $null
[object]    $script:APCTX = $null
[hashtable] $script:ILIST = @{}
#
#endregion
#region ********** FUNCTIONS ********************************************************************************************
#
function Exec_Cmd  {
   param ([string] $sCmd = "")
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   #                                                                                -----------------------------------
   "-----------------------------------------------------------------" | OUT-HOST   #
   "Start process [$($sCmd)]                                         " | OUT-HOST   #
   Start-Process $sCmd                                                              #
   #                                                                                -----------------------------------
}
function Menu_Exec {
   param ([string[]] $sItem = @())
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string] $E = $sItem[0]                                                          #
   [string] $A = $sItem[1]                                                          #
   #                                                                                -----------------------------------
   "------------------------------------------------------------------" | OUT-HOST  #
   "Menu_Exec: Event raised                                           " | OUT-HOST  #
   "Menu_Exec:    Executable [$($E)]                                  " | OUT-HOST  #
   "Menu_Exec:    Arguments  [$($A)]                                  " | OUT-HOST  #
   #                                                                                -----------------------------------   
   if ($A -eq "") { START-PROCESS -FilePath $E                  }                   #
   else           { START-PROCESS -FilePath $E -ArgumentList $A }                   #
   #                                                                                -----------------------------------      
}
function Menu_Init {
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string] $S = ""                                                                 # Create menu
   [object] $I = $null                                                              #
   [int]    $N = 0                                                                  #
   #                                                                                -----------------------------------
   $S = "c:\Windows\explorer.exe"                                                   # Create menu
   $script:CMENU             = New-Object System.Windows.Forms.NotifyIcon           #
   $script:CMENU.ContextMenu = New-Object System.Windows.Forms.ContextMenu          #
   $script:CMENU.Text        = "WPF Systray tool"                                   #
   $script:CMENU.Icon        = [System.Drawing.Icon]::ExtractAssociatedIcon($S)     #
   $script:CMENU.Visible     = $true                                                #
   $script:CMENU.Add_Click({                                                        #
      param($sender,$e)                                                             #
      $F = [System.Reflection.BindingFlags]::Instance                               #
      $F = $F -bor [System.Reflection.BindingFlags]::NonPublic                      #
      $M = $script:CMENU.GetType().GetMethod("ShowContextMenu",$F)                  #
      $M.Invoke($script:CMENU,$null)                                                #      
   })                                                                               #
   #                                                                                -----------------------------------
   $script:ILIST.GetEnumerator() | sort Name | SELECT Name | % {                    #
      $S           = $_.Name                                                             #
      "Create item [$S]" | OUT-HOST
      $I           = New-Object System.Windows.Forms.MenuItem                       #
      $I.Enabled   = $true                                                          #
      $I.Text      = $S                                                             #
      $I.Add_Click($script:ILIST[$S])                                               #
      $script:CMENU.contextMenu.MenuItems.Add($N, $I)                               #
      $N++                                                                          #
   }                                                                                #
   #                                                                                -----------------------------------
}
#
#endregion
#region ********** ENTRY POINT ****************************************************************************************
#
#                                                                                   -----------------------------------
"Initialize items list                                                " | OUT-HOST  # Initialize items list
$script:ILIST = @{
   'WWW - RR'                     = {Menu_Exec @($script:BRAVE, "https://radior.ice.infomaniak.ch/radior-96.aac"        )}    
   'MS - Portal EndPoint Manager' = {Menu_Exec @($script:BRAVE, "https://endpoint.microsoft.com/"                       )}    
   'MS - Portal Defender'         = {Menu_Exec @($script:BRAVE, "https://security.microsoft.com/"                       )}    
   'MS - Portal Azure'            = {Menu_Exec @($script:BRAVE, "http://portal.azure.com/"                              )}    
   'ICRC - Azure DevOps'          = {Menu_Exec @($script:BRAVE, "http://tfs.ext.icrc.org/"                              )}    
   'ICRC - Teams'                 = {Menu_Exec @($script:BRAVE, "https://teams.microsoft.com"                           )}    
   'ICRC - EMail'                 = {Menu_Exec @($script:BRAVE, "https://collab.ext.icrc.org/"                          )}    
}
#                                                                                   -----------------------------------
"Create menu                                                          " | OUT-HOST  # Create menu
Menu_Init                                                                           #
#                                                                                   -----------------------------------
"Start application                                                    " | OUT-HOST  # Start application
$script:APCTX = New-Object System.Windows.Forms.ApplicationContext                  #
[System.Windows.Forms.Application]::Run($script:APCTX)                              #
#                                                                                   -----------------------------------






#$keepAwakeScript = {
#    while (1) {
#      $wsh = New-Object -ComObject WScript.Shell
#      $wsh.SendKeys('+{F15}')
#      Start-Sleep -seconds 59
#    }
#}
#function Kill-Tree {
#    Param([int]$ppid)
#    Get-CimInstance Win32_Process | Where-Object { $_.ParentProcessId -eq $ppid } | ForEach-Object { Kill-Tree $_.ProcessId }
#    Stop-Process -Id $ppid
#}
#Start-Job -ScriptBlock $keepAwakeScript -Name "keepAwake"
#




