<# ====================================================================================================================
   .DESCRIPTION      
   .EXAMPLE 1
==================================================================================================================== #>
#region    **********[ PARAMETERS    ]*********************************************************************************
#                                                                                   -----------------------------------
param ( [string] $SF = "" )                                                         #
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
[hashtable] $script:FOS = @{'Hash'="";'Name'="";'Path'="";'size'=0;'count'=1}       # File object structure
#                                                                                   -----------------------------------
. "$($script:SPH)\LBLG_190721.ps1"                                                  #
#                                                                                   -----------------------------------
[hashtable] $script:FOL = @{}                                                       # File object list
#                                                                                   -----------------------------------
#endregion ************************************************************************************************************
#region    **********[ ENTRY POINT ]***********************************************************************************
function FOL_Add  {
   param ( [string] $sFile = "" )
   #--------------------------------------------------------------------------------#    
   #--------------------------------------------------------------------------------#    
   [object] $F = $null                                                              #
   [object] $O = New-Object PSObject -Property $script:FOS                          #
   #                                                                                -----------------------------------
   if ($sFile -like '*\.DS_Store')  { return }                                      # File prerequisites
   if ($sFile -like '*\.*')        { return }                                       #
   if (!(TEST-PATH $sFile)) { WRITE-ERROR "File not found [$sFile]."; return }      #
   #                                                                                -----------------------------------
   $O.Hash = (Get-FileHash $sFile).Hash                                             # Get file hash
   #                                                                                -----------------------------------
   try                                                   {                          # Get file object
      $F = GI $sFile                                     }                          #
   catch                                                 {                          #   
      Lv 'FOL_Add' "Unable to get file [$sFile]"                                    #   
      $error.clear()                                                                #   
      return                                             }                          #   
   $O.Name = $F.Name                                                                #   
   $O.Path = $F.FullName.Replace("\$($F.Name)", "")                                 #   
   $O.Size = $F.Length/1024                                                         #         
   #                                                                                -----------------------------------
   if ($script:FOL.Contains($O.Hash))                 {                             #   
      Lv 'FOL_Add' "Add duplicate [$($F.Fullname)]."                                #
      $script:FOL[$O.Hash] += $O                      }                             #
   else                                               {                             #
      $script:FOL.Add($O.Hash,@($O))                  }                             #
   #                                                                                -----------------------------------
}
function ToCSV    {
   #--------------------------------------------------------------------------------#    
   #--------------------------------------------------------------------------------#    
   [int]       $N = 0                                                               #
   [string]    $S = ""                                                              #
   [object[]]  $L = @()                                                             #
   [object]    $O = $null                                                           #
   #                                                                                -----------------------------------
   $script:FOL.Keys | %                            {                                #
      $S = $_                                                                       #
      $N = $script:FOL[$S].Count                                                    #
      if ($N -gt 1)                             {                                   #
         $script:FOL[$S] | %                 {                                      #
            $O = $_; $O.count = $N; $L+=$O   }  }  }                                #
   #                                                                                -----------------------------------         
   $S = "$($script:SPH)\$($script:SNM)$(GET-DATE -Format 'yyMMddhhmmss').csv"       #
   Lv 'ToCSV' "Export to file [$S]"                                                 #
   $L | ConvertTo-Csv -NoTypeInformation | OUT-FILE $S                              #
   #                                                                                -----------------------------------            
}
#
#endregion ************************************************************************************************************
#region    **********[ ENTRY POINT ]***********************************************************************************
#-----------------------------------------------------------------------------------#
LBLG_Init $script:SPH $script:SNM 0 'P1'                                            # Start install
LBLG_Start                                                                          # 
#-----------------------------------------------------------------------------------#
LBLG_Step "Scan directory [$SF]"                                                    # 1 - Scan folder
try   {                                                                             #
   GCI -Path $SF -Recurse -Force | where { ! $_.PSIsContainer } | %  {              #
   Lg "Load [$($_.FullName)]"; FOL_Add $_.FullName                   }  }           #
catch {  "! ERROR > A terminating error occurs." | OUT-HOST             }           #
Le $script:LBLG_ERR_WARNING $false                                                  #
#-----------------------------------------------------------------------------------#
LBLG_Step "Save duplicate list to CSV file."                                        # 2 - Make CSV file
try   {  ToCSV                                                          }           #
catch {  "! ERROR > A terminating error occurs." | OUT-HOST             }           #
Le $script:LBLG_ERR_WARNING $false                                                  #
#-----------------------------------------------------------------------------------#
LBLG_Exit                                                                           # End of script
#-----------------------------------------------------------------------------------#
#endregion ************************************************************************************************************
#
# EOF