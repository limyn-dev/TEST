#                                                                                   -----------------------------------
[string]   $script:SPH = $MyInvocation.MyCommand.Definition                         # Set script path and name
           $script:SPH = Split-Path -Path $script:SPH -Parent                       #
[object[]] $script:LST = @()                                                        # Global object list
#                                                                                   -----------------------------------
# FUNCTIONS
#
function CsvRead {
   param ([string] $sFile = "") 
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [hashtable] $H = @{}                                                             #
   #                                                                                -----------------------------------   
   if (!(TEST-PATH $sFile)) {"File not found" | OUT-HOST; return }                  #
   #                                                                                -----------------------------------      
   "Read file [$sFile]" | OUT-HOST                                                  # Read csv file
   $O = Import-Csv $sFile                                                           #
   #                                                                                -----------------------------------
   for ($I=0; $I -lt $O.FIELD_A.Count; $I++) {                                      # Process file rows 
      $H = @{}                                                                      #    Create new hashtable
      $H.Add("FIELD_A", $O.FIELD_A[$I])                                             #    Add value of FIELD_A
      $H.Add("FIELD_B", $O.FIELD_B[$I])                                             #    Add value of FIELD_B
      $H.Add("FIELD_C", $O.FIELD_C[$I])                                             #    Add value of FIELD_C
      $H.Add("FIELD_D", $O.FIELD_D[$I])                                             #    Add value of FIELD_D
      $script:LST += New-Object PSObject -Property $H                               #    Add object with current row values
   }                                                                                #
   #                                                                                ----------------------------------   
}
#
# ENTRY POINT
#                                                                                   -----------------------------------
CsvRead "$($script:SPH)\TESTCSV.txt"                                                # Read CSV file
#                                                                                   -----------------------------------
$script:LST | OUT-GRIDVIEW                                                          # Display objects (one per row) list
READ-HOST "PRESS ENTER to close gridview"                                           #
#                                                                                   -----------------------------------
"-------------------------------------" | OUT-HOST                                  # Get spesific row values
"Row 3:                               " | OUT-HOST                                  #   The row number is n-1
"   FIELD_A [$($script:LST[2].FIELD_A)]"| OUT-HOST                                  #   
"   FIELD_B [$($script:LST[2].FIELD_B)]"| OUT-HOST                                  #
"   FIELD_C [$($script:LST[2].FIELD_C)]"| OUT-HOST                                  #
"   FIELD_D [$($script:LST[2].FIELD_D)]"| OUT-HOST                                  #
"-------------------------------------" | OUT-HOST                                  #
#                                                                                   -----------------------------------