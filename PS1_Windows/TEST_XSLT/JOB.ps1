#----------------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------------
param ([string] $DEF = "" )
#
# ********** GLOBALS **************************************************************************************************
#                                                                                   -----------------------------------
$global:DebugPreference       = "SilentlyContinue"                                  #  PS session parameters
$global:VerbosePreference     = "Continue"                                          #
$global:ErrorActionPreference = "Continue"                                          #
Set-StrictMode -Version latest                                                      #
#                                                                                   -----------------------------------
[string]    $script:SPH=$MyInvocation.MyCommand.Definition                          # Current location
            $script:SPH=SPLIT-PATH -Path $script:SPH  -Parent                       #
[string]    $script:SNM=$DEF.Substring(0, $DEF.Length-4)                            # Package name
[hashtable] $script:STP=@{}                                                         #
#                                                                                   -----------------------------------
. "$($script:SPH)\Lpkg_180101.ps1"                                                  # Load libs
#                                                                                   -----------------------------------
function STP_Load {
   param([string] $sFile="")
   #                                                                                -----------------------------------
   [string] $T = "$($script:SPH)\JOB.xsl"                                           #
   [string] $S = "$($script:SPH)\STP.ps1"                                           #
   [object] $O = $null                                                              #
   #                                                                                -----------------------------------
   $O = New-Object System.Xml.Xsl.XslCompiledTransform                              #
   $O.Load($T)                                                                      #
   Lv "STP_Load" "Load DEF file [$sFile]"                                           #
   $O.Transform($sFile, $S)                                                         #
   #                                                                                -----------------------------------
   
   #                                                                                -----------------------------------   
}
#                                                                                   -----------------------------------
#####################################################################################
#                                                                                   #
# ENTRY POINT                                                                       #
#                                                                                   #
#####################################################################################
#-----------------------------------------------------------------------------------#
ScriptStart "TEST" 4                                                                # Start install
#-----------------------------------------------------------------------------------#
LStep "Load steps."                                                                 # Create values
try   { STP_Load "$($script:SPH)\$DEF"                               }              #
catch { "! ERROR > A terminating error occurs." | OUT-HOST           }              #
Le $script:LPKG_ERR_APP_INSTALL $true                                               #
#-----------------------------------------------------------------------------------#  
ScriptExit                                                                          # End of script
#-----------------------------------------------------------------------------------#



