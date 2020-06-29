
GCI -Path C:\Users\U10754\OneDrive\_DATA -Recurse

<# ====================================================================================================================
   .DESCRIPTION      
   .EXAMPLE 1
==================================================================================================================== #>
#region    **********[ PARAMETERS    ]*********************************************************************************
#                                                                                   -----------------------------------
param ( [string] $FP = "" )                                                         #
#                                                                                   -----------------------------------
#endregion ************************************************************************************************************
#region    **********[ GLOBAL        ]*********************************************************************************
#                                                                                   -----------------------------------
$global:ErrorActionPreference = "Continue"                                          # PS session parameters
$global:DebugPreference       = "SilentlyContinue"                                  #
$global:VerbosePreference     = $global:DebugPreference                             #
Set-StrictMode -Version latest                                                      #
#                                                                                   -----------------------------------
[string]    $script:SPH = $MyInvocation.MyCommand.Definition                        # Current location
            $script:SPH = SPLIT-PATH -Path $script:SPH -Parent                      #
[string]    $script:SNM = 'Double'                                                  # Package name
[hashtable] $script:FOS = @{'Hash'="";'Name'="";'Path'="";'LstR'=0;'LstW'=0}        # File object structure
#                                                                                   -----------------------------------
. "$($script:SPH)\LBLG_190721.ps1"                                                  #
#                                                                                   -----------------------------------
[hashtable] $script:FOL = @{}                                                       # File object list
#                                                                                   -----------------------------------
#endregion ************************************************************************************************************
#region    **********[ ENTRY POINT ]***********************************************************************************
function FOL_Add {
   param ( [string] $sFile = "" )
   #--------------------------------------------------------------------------------#    
   #--------------------------------------------------------------------------------#    
   [object]    $F = $null                                                           #
   [hashtable] $O = $Object = New-Object PSObject -Property $script:FOS             #
   [int]       $I = $script:FOL.Keys.Count+1                                        #
   #                                                                                -----------------------------------
   if (!(TEST-PATH $sFile)) { WRITE-ERROR "File not found [$sFile]."; return }      #
   #                                                                                -----------------------------------
   Lv 'FOL_Add' "Load file [$sFile]"                                                # Create file object   
   $F = GI $sFile                                                                   #   
   $O.Hash = (Get-FileHash $sFile).Hash                                             #   
   $O.Name = $F.Name                                                                #   
   $O.Path = $F.FullName.Replace("\$($F.Name)", "")                                 #   
   $O.LstR = $O.LastAccessTime                                                      #   
   $O.LstW = $O.LastWriteTime                                                       #   
   #                                                                                -----------------------------------
   Lv 'FOL_Add' "Add file at [$I]."                                                 # Update file list
   $script:FOL.Add($I, $O)                                                          #
   #                                                                                -----------------------------------
}

#endregion ************************************************************************************************************
#region    **********[ ENTRY POINT ]***********************************************************************************
#-----------------------------------------------------------------------------------#
LBLG_Init $script:SPH $script:SNM 0 'P1'                                            # Start install
LBLG_Start                                                                          # 
#-----------------------------------------------------------------------------------#
LBLG_Step "Load reference directory"                                                # 5 - Create quotas templates.
try   {  GCI $FP | % { }     }              #
catch {  "! ERROR > A terminating error occurs." | OUT-HOST          }              #
Le $script:LBLG_ERR_WARNING $false                                                  #
#-----------------------------------------------------------------------------------#
LBLG_Exit                                                                           # End of script
#-----------------------------------------------------------------------------------#
#endregion ************************************************************************************************************
#
# EOF