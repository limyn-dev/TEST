<#=====================================================================================================================
.SYNOPSIS
   HyperV 2012 vm backup.
.DESCRIPTION
   Backup VM
.NOTES
   2018.11.15 ydelay Creation.
=====================================================================================================================#>
#
#region    **********[ FUNCTIONS   ]***********************************************************************************
#                                                                                   ------------------------------------
$global:DebugPreference       = "SilentlyContinue"                                  #  PS session parameters
$global:VerbosePreference     = "SilentlyContinue"                                  #
$global:ErrorActionPreference = "Continue"                                          #
Set-StrictMode -Version latest                                                      #
#                                                                                   ------------------------------------
[string]    $script:LOC  = $MyInvocation.MyCommand.Definition                       # Current location
            $script:LOC  = SPLIT-PATH -Path $script:LOC  -Parent                    #
[string]    $script:NME  = "BCK_LOC"                                                # Script name
[string]    $script:BDN  = 'BOXUP_BACK'                                             # Backup drive name
[string]    $script:BPH  = ""                                                       # Backup drive letter
[string[]]  $script:BKL  = @()                                                      # List of path to backup
            $script:BKL += "C:\BOXUP"                                               #
            $script:BKL += "$($env:USERPROFILE)\Desktop"                            #
            $script:BKL += "$($env:USERPROFILE)\Documents"                          #
            $script:BKL += "$($env:USERPROFILE)\Contacts"                           #
            $script:BKL += "$($env:USERPROFILE)\Favorites"                          #
            $script:BKL += "$($env:USERPROFILE)\Pictures"                           #
            $script:BKL += "$($env:USERPROFILE)\Videos"                             #
#                                                                                   ------------------------------------            
[string]    $script:ER0  = "Le disque de backup est introuvable."                   #
            $script:ER0 += " Il faut insérer une carte SD ou un clef USB avec"      #
            $script:ER0 += " comme nom de volume: [$script:BDN]"                    #
[string]    $script:ER1  = "Le disque de backup est plein. Il faut la changer."     #            
#                                                                                   ------------------------------------
. "$($script:LOC)\LBLG_180827.ps1"                                                  # Load lib
#                                                                                   ------------------------------------
#endregion ************************************************************************************************************
#region    **********[ FUNCTIONS   ]***********************************************************************************
#
function BCK_Path {
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#   
   [char] $D = 0                                                                    #
   #                                                                                -----------------------------------
   Get-Volume | ? {$_.FileSystemLabel -like $script:BDN} | % {$D=$_.DriveLetter}    #
   #                                                                                -----------------------------------
   if ($D -eq 0){ $script:BPH = ""                                                  #
                  Lv 'BCK_Path' "Unable to find packup device [$($script:BDN)]"     #
                  [Windows.MessageBox]::Show($script:ER0,'Attention',0,48)       }  #
   else         { $script:BPH = "$($D):\$(GET-DATE -Format 'yyyy-MM')"              #
                  Lv 'BCK_Path' "Set backup path [$($script:BPH)]"                  #
                  MD $script:BPH -Force                                          }  #
   #                                                                                -----------------------------------
}
function BCK_Copy {
   param ([string] $sFolder = "")
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#      
   [Double] $S = 0                                                                  #
   [UInt64] $F = 0                                                                  #
   [string] $B = ""                                                                 #
   #                                                                                -----------------------------------            
   $F = (get-volume -FriendlyName $script:BDN).SizeRemaining                        # Check free space
   GCI $sFolder -Recurse | ? {! $_.PSIsContainer } | % {$S+= $_.Length}             #
   if ($F -lt $S) {                                                                 #
      [System.Windows.MessageBox]::Show($script:ER1, 'Attention', 0, 48)            #
      return                                                                        #
   }                                                                                #
   #                                                                                -----------------------------------               
   $B = $sFolder.SubString(0,2)                                                     # Copy
   $B = $sFolder.Replace($B, $script:BPH)                                           #
   Lv 'BCK_Copy' "Copy [$sFolder] to [$B]"                                          #
   Lg ""                                                                            #
   Lg ('~'*100)                                                                     #
   robocopy $sFolder $B /MIR /R:3 /W:3 /NP /NFL /NDL                                #
   Lg ('~'*100)                                                                     #
   Lg ""                                                                            #
   #                                                                                -----------------------------------
}
#
#endregion ************************************************************************************************************
#region    **********[ ENTRY POINT ]***********************************************************************************
#
#-----------------------------------------------------------------------------------#
LBLG_Init $script:LOC $script:NME 11                                                # Start script
LBLG_Start                                                                          #
Add-Type -AssemblyName 'PresentationFramework'                                      #
#-----------------------------------------------------------------------------------#
LBLG_Step "Set backup path."                                                        # 1 - Set backup path
try   {  BCK_Path                                                                   #
         if ($script:BPH -eq "") {$script:LBLG_RETCODE=1; LBLG_Exit} }              #
catch { "! ERROR > A terminating error occurs." | OUT-HOST           }              #
Le $script:LBLG_ERR_CRITICAL $true                                                  #
#-----------------------------------------------------------------------------------#
LBLG_Step "Make backup."                                                            # 2 - Make backup
try   {  $script:BKL | % { BCK_Copy $_ }                             }              #
catch { "! ERROR > A terminating error occurs." | OUT-HOST           }              #
Le $script:LBLG_ERR_CRITICAL $true                                                  #
#-----------------------------------------------------------------------------------#
LBLG_Exit                                                                           # End of script
#-----------------------------------------------------------------------------------#
#
#endregion ************************************************************************************************************
#
# EOF