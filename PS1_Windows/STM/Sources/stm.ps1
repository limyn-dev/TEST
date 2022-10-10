#
#region **********[ ASSEMBLIES  ]**************************************************************************************
#
[Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')    | out-null    #
[Reflection.Assembly]::LoadWithPartialName('presentationframework')   | out-null    #
[Reflection.Assembly]::LoadWithPartialName('System.Drawing')          | out-null    #
[Reflection.Assembly]::LoadWithPartialName('WindowsFormsIntegration') | out-null    #
#
#endregion
#region **********[ GLOBALS     ]**************************************************************************************
#
#                                                                              Path >----------------------------------
[string]    $script:PROOT  = $MyInvocation.MyCommand.Definition                     # Script path
            $script:PROOT  = SPLIT-PATH -Path $script:PROOT -Parent                 #
[hashtable] $script:PLIST  = @{}                                                    # Directories list
$script:PLIST.Add('LIMYN'  , "$($env:USERPROFILE)\OneDrive\.stm"                                            )
$script:PLIST.Add('ICRC'   , "$($env:USERPROFILE)\OneDrive - International Committee of the Red Cross\.stm" )
$script:PLIST.Add('EMPART' , "$($env:USERPROFILE)\OneDrive - Empart Inc\.stm"                               )
$script:PLIST.Add('DESKTOP', "$($env:USERPROFILE)\Desktop"                                                  )
$script:PLIST.Add('SYSTEM' , "$($script:PROOT)\_SYSTEM"                                                     )
$script:PLIST.Add('WWW'    , "$($script:PROOT)\_WWW"                                                        )
#                                                                             Items >----------------------------------
[hashtable] $script:LITPE  = @{'lnk' = 'Exec_Lnk @ID@;'+[char]0xD83D+[char]0xDDD7   # Items types list
                               'url' = 'Exec_Url @ID@;'+[char]0xD83C+[char]0xDF0E   #
                               'cmd' = 'Exec_Cmd @ID@;'+[char]0x2318            }   #
[hashtable] $script:LFILE  = @{}                                                    # Items list
#                                                                       GUI OBJECTS >----------------------------------
[object]    $script:CMENU  = $null                                                  #
[object]    $script:APCTX  = $null                                                  #
#                                                                       EXECUTABLES >----------------------------------
[string]    $script:BRAVE  = """C:\Program Files\BraveSoftware\Brave-Browser"       #
            $script:BRAVE += "\Application\brave.exe"""                             #
[string]    $script:MSTSC  = "C:\Windows\System32\mstsc.exe"                        #
#                                                                                   -----------------------------------
#
#endregion
#region **********[ FUNCTIONS   ]**************************************************************************************
#
function Exec_Dir       {
   param ([string] $sFileId = "")
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string] $Y = "Exec_Dir       :"                                                 #
   [string] $S = ""                                                                 # Generic string
   #                                                                                -----------------------------------
   "$($Y) -----------------------------------------------------------" | OUT-HOST   # Start URL loader
#   "$($Y) Open directory:                                            " | OUT-HOST   #
#   "$($Y)   Item ID      [$($sFileId)]                               " | OUT-HOST   #
   #                                                                                -----------------------------------
#   $S = $script:LFILE[$sFileId].FullName                                            # Get command file name
#   "$($Y)   Directory [$($S)]                                        " | OUT-HOST   #
   #                                                                                -----------------------------------
#   Start-Process $S                                                                 # Start process
   #                                                                                -----------------------------------
}
function Exec_Cmd       {
   param ([string] $sFileId = "")
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string] $Y = "Exec_Cmd       :"                                                 #
   [object] $O = $null                                                              # Generic object
   [string] $S = ""                                                                 # Generic string
   #                                                                                -----------------------------------
   "$($Y) -----------------------------------------------------------" | OUT-HOST   # Start URL loader
   "$($Y) Start Command file:                                        " | OUT-HOST   #
   "$($Y)   Item ID      [$($sFileId)]                               " | OUT-HOST   #
   #                                                                                -----------------------------------
   $S = $script:LFILE[$sFileId].FullName                                            # Get command file name
   "$($Y)   Command File [$($S)]                                     " | OUT-HOST   #
   #                                                                                -----------------------------------
   Start-Process $S                                                                 # Start process
   #                                                                                -----------------------------------
}
function Exec_Lnk       {
   param ([string] $sFileId = "")
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string]    $Y = "Exec_Lnk       :"                                              #
   [object]    $O = $null                                                           # Generic object
   [string]    $S = ""                                                              # Generic string
   [string[]]  $A = @()                                                             # Generic string array
   [hashtable] $H = @{}                                                             # Generic hashtable
   [object]    $L = $null                                                           # Link object
   #                                                                                -----------------------------------
   "$($Y) -----------------------------------------------------------" | OUT-HOST   # Start URL loader
   "$($Y) Start Link file:                                           " | OUT-HOST   #
   "$($Y)   Item ID      [$($sFileId)]                               " | OUT-HOST   #
   #                                                                                -----------------------------------
   $S = $script:LFILE[$sFileId].FullName                                            # Get file object
   "$($Y)   Link File    [$($S)]                                     " | OUT-HOST   #
   #                                                                                -----------------------------------
   $O = New-Object -COM WScript.Shell                                               # Get command parameters
   $L = $O.CreateShortcut($S)                                                       #
   $L.Arguments | % { if ($_ -ne "") {$A+=$_} }                                     #
   $H.Add('FilePath'    , $L.TargetPath)                                            #
   if ($A.Count)                                      {                             #
      $H.Add('ArgumentList', $A)                      }                             #
   if ($L.WorkingDirectory -ne "")                    {                             #
      $H.Add('WorkingDirectory', $L.WorkingDirectory) }                             #
   "$($Y)   FilePath     [$($H['FilePath'])]                         " | OUT-HOST   #
   "$($Y)   WorkingDir   [$($H['WorkingDirectory'])]                 " | OUT-HOST   #
   "$($Y)   ArgumentList [$($H['ArgumentList'])]                     " | OUT-HOST   #
   #                                                                                -----------------------------------
   Start-Process @H                                                                 # Start process
   #                                                                                -----------------------------------
}
function Exec_Url       {
   param ([string] $sFileId = "")
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string]    $Y = "Exec_Url       :"                                              #
   [string]    $S = ""                                                              # Generic string
   [hashtable] $H = @{}                                                             # Generic hashtable
   [object]    $F = $null                                                           # URL file object
   #                                                                                -----------------------------------
   "$($Y) -----------------------------------------------------------" | OUT-HOST   # Start URL loader
   "$($Y) Start URL file:                                            " | OUT-HOST   #
   "$($Y)   Item ID       [$($sFileId)]                              " | OUT-HOST   #
   #                                                                                -----------------------------------
   $F = $script:LFILE[$sFileId]                                                     # Get URL file object
   "$($Y)   URL File Name [$($F.Fullname)]                           " | OUT-HOST   #
   #                                                                                -----------------------------------
   GET-CONTENT -Path $F.Fullname | %      {                                         # Get URL value
      if ($_.Substring(0,4) -eq 'URL='){                                            #
         $S = $_.Replace('URL=', "")   }  }                                         #
   if ($S -eq "")                         {                                         #
      WRITE-ERROR "$($Y) URL not found."                                            #
      return                              }                                         #
   "$($Y)   URL           [$($S)]                                    " | OUT-HOST   #
   #                                                                                -----------------------------------
   Start-Process $S                                                                 #
   #                                                                                -----------------------------------
}
function Menu_Add_Item  {
   param ( [object] $oMenuItems = $null
         , [string] $sText      = ""
         , [string] $sOnClick   = ""
         , [ref]    $oMenuItem  = $null    )
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string] $Y = "Menu_Add_Item :"                                                 #
   [string] $S = ""                                                                 # Generic string
   [object] $O = $null                                                              # Generic object
   [object] $M = $null                                                              # Menu item object
   [string] $I = ""                                                                 # Id string
   #                                                                                -----------------------------------
   $M         = New-Object System.Windows.Forms.MenuItem                            # Create MenuItem
   $M.Enabled = $true                                                               # Enable
   $M.Text    = $sText                                                              # Set text
   if ($sOnClick -ne "")                              {                             # Set OnClick event
      $M.Add_Click([Scriptblock]::Create($sOnClick))  }                             #
   $oMenuItems.Add($M) | OUT-NULL                                                   # Add MenuItem to list
   #                                                                                -----------------------------------
   $oMenuItem.Value = $M                                                            # Return it
   #                                                                                -----------------------------------
}
function Menu_Load_Dir  {
   param ( [object] $oMenuItems = $null
         , [object] $oDirectory = $null )
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string]   $Y = "Menu_Load_Dir  :"                                               #
   [string]   $S = ""                                                               # Generic string
   [string[]] $A = @()                                                              # Generic string array
   [string]   $T = ""                                                               # Item type
   [object]   $M = $null                                                            # Menu item object
   [string]   $I = ""                                                               # Id string
   #                                                                                -----------------------------------
   $oDirectory.GetDirectories() | % {                                               # Load directories
      $I = [guid]::NewGuid().ToString()                                             #    Create file ID
      "$($Y) Add Directory [$I][$($_.Fullname)]     " | OUT-HOST                    #
      $script:LFILE.Add($I, $_)                                                     #    Update file list
      $S = [char]0xD83D + [char]0xDDBF +" $($_.Name)"                               #    Set menuitem name
      Menu_Add_Item $oMenuItems $S "Exec_Dir $($I)" ([ref]$M)                       #    Create menuitem
      Menu_Load_Dir $M.MenuItems $_                                                 #    Load subdirectories
   }                                                                                #
   #                                                                                -----------------------------------
   $script:LITPE.Keys | % {                                                         # Load files
      $T = $_                                                                       #    Get item type
      $A = $script:LITPE[$T].Split(';')                                             #    Get Item type parameter
      GCI $oDirectory.Fullname -Filter "*.$($T)" | % {                              #    Get files of current type
         $I = [guid]::NewGuid().ToString()                                          #    Create file ID
         "$($Y) Add lnk file [$I][$($_.Fullname)]   " | OUT-HOST                    #
         $script:LFILE.Add($I, $_)                                                  #    Update file list
         $S = $A[1] + ' ' + $_.Name.Replace(".$($T)", "")                           #    Set MenuItem text
         Menu_Add_Item $oMenuItems $S $A[0].Replace('@ID@', $I) ([ref]$M)           #    Create menuitem
      }                                                                             #
   }                                                                                #
   #                                                                                -----------------------------------
}
function Menu_Init      {
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string] $Y = "Menu_Init      :"                                                 #
   [string] $S = ""                                                                 # Generic string
   [object] $O = $null                                                              # Generic object
   #                                                                                -----------------------------------
   "$($Y) Create Menu.                                               " | OUT-HOST   # Create menu
   $S = "c:\Windows\explorer.exe"                                                   #
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
   $script:PLIST.GetEnumerator() | Sort Name | % {                                  # Load root directories
      $S = $_.Name                                                                  #
      if (TEST-PATH $script:PLIST[$S]) {                                            #
         "$($Y) Load root directory [$S][$($script:PLIST[$S])].       " | OUT-HOST  #
         Menu_Add_Item $script:CMENU.contextMenu.MenuItems $S "" ([ref]$O)          #
         Menu_Load_Dir $O.MenuItems (GI $script:PLIST[$S])                          #
      }                                                                             #
   }                                                                                #
   #                                                                                -----------------------------------
}
#
#endregion
#region **********[ ENTRY POINT ]**************************************************************************************
#                                                                                   -----------------------------------
"Create menu                                                          " | OUT-HOST  # Create menu
Menu_Init                                                                           #
#                                                                                   -----------------------------------
"Start application                                                    " | OUT-HOST  # Start application
$script:APCTX = New-Object System.Windows.Forms.ApplicationContext                  #
[System.Windows.Forms.Application]::Run($script:APCTX)                              #
#                                                                                   -----------------------------------
#endregion