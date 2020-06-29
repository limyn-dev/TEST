<#
.SYNOPSIS
.DESCRIPTION
.NOTES
#>
#region    **********[ PARAMS      ]***********************************************************************************
#
#param ( [Parameter(ParameterSetName='ISO', Mandatory=$true, Position=0)][string] $ISO = "" )
#
#endregion ************************************************************************************************************
#region    **********[ GLOBALS     ]***********************************************************************************
#                                                                                   -----------------------------------
[object]    $script:CCI = [System.Globalization.CultureInfo]::CurrentCulture
[hashtable] $script:SUM = @{}
[int]       $script:CMN = 0
[int]       $script:HPD = 0
#                                                                                   -----------------------------------
#endregion ************************************************************************************************************
#region    **********[ FUNCTIONS   ]***********************************************************************************
#
function CMN_Get    {
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   #                                                                                -----------------------------------      
   do {                                                                             #
      try   { $script:CMN = [int](READ-HOST "Month number") }                       #
      catch { "ERROR" | OUT-HOST                            }                       #
      if ($error.Count) { $error.Clear(); $script:CMN = 0   }                       #
   } while ($script:CMN -eq 0)                                                      #
   #                                                                                -----------------------------------      
   do {                                                                             #
      try   { $script:HPD = [int](READ-HOST "Number of days")  }                    #
      catch { "ERROR" | OUT-HOST                               }                    #
      if ($error.Count) { $error.Clear(); $script:HPD = 0      }                    #
   } while ($script:HPD -eq 0)                                                      #
   #                                                                                -----------------------------------         
}
function SUM_Add    {
   param ([object] $oCalEntry = $null)
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string]    $C = $oCalEntry.Subject.ToUpper()                                 #
   [single]    $M = $oCalEntry.Duration                                             #
   [single]    $H = $M /60                                                          #
   [hashtable] $O = @{}                                                             #
   [string]    $S = ""                                                              #
   #                                                                                -----------------------------------      
   $S  = "Add calendar item          "                                              #
   $S += " [$($oCalEntry.Start)]     "                                              #
   $S += " [$($oCalEntry.Categories)]"                                              #
   $S += " [$($oCalEntry.Subject)]   "                                              #
   $S += " [$($oCalEntry.Duration)]  "                                              #
   $S += " [$($oCalEntry.Location)]  "                                              #
   $S += " [$($oCalEntry.Saved)]     "                                              #
   $S | OUT-HOST                                                                    #
   #                                                                                -----------------------------------      
   if ($script:SUM.Contains($C)) {                                                  #
      $script:SUM[$C].COUNT++                                                       #
      $script:SUM[$C].SUBJECT  += ";$($oCalEntry.Subject)"                          #
      $script:SUM[$C].START    += ";$($oCalEntry.Start.ToString())"                 #
      $script:SUM[$C].MINUTES  += $M                                                #
      $script:SUM[$C].HOURS    += $H                                                #
      $script:SUM[$C].HSR_DAY  += $H/$script:HPD                                    #
   }                                                                                #
   else                          {                                                  #
      [hashtable] $O = @{}                                                          #
      $O.Add( 'COUNT'     , 1                                  )                    #      
      $O.Add( 'SUBJECT'   , "$($oCalEntry.Subject)"            )                    #
      $O.Add( 'CATEGORIES', $oCalEntry.Categories              )                    #
      $O.Add( 'LOCATION'  , $oCalEntry.Location                )                    #      
      $O.Add( 'START'     , ";$($oCalEntry.Start.ToString())"  )                    #
      $O.Add( 'MINUTES'   , $M                                 )                    #
      $O.Add( 'HOURS'     , $H                                 )                    #
      $O.Add( 'HSR_DAY'   , $H/$script:HPD                     )                    #
      $script:SUM.Add($C, (New-Object PSObject -Property $O)   )                    #
   }                                                                                #
   #                                                                                -----------------------------------         
}
function CAL_Load   {
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [int]    $Y = (GET-DATE).Year 
   [int]    $M = $script:CMN
   [object] $O = New-Object -ComObject outlook.application                          #
   [object] $N = $O.GetNameSpace('MAPI')                                            #
   [object] $C = [Microsoft.Office.Interop.Outlook.OlDefaultFolders]::olFolderCalendar
   
   #                                                                                -----------------------------------      
   $N.getDefaultFolder($C).items | % {                                              #
      #[object] $R = $script:CCI.DateTimeFormat.CalendarWeekRule                     #
      #[int]    $F = $script:CCI.DateTimeFormat.FirstDayOfWeek                       #
      #[int]    $W = $script:CCI.Calendar.GetWeekOfYear($_.StartUTC, $R, $F)         #
      if (($_.Start.Month -eq $M) -and ($_.Start.Year -eq ($Y-1))) { 
         SUM_Add $_ 
      }       #
   }                                                                                #
   #                                                                                -----------------------------------      
}
function Le         {
   param ( [int] $nExitCode=0)
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
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
   }                                                                                #
   #                                                                                -----------------------------------
   $error.Clear()                                                                   # Reset errors
   #                                                                                -----------------------------------
   if ($nExitCode) { EXIT $nExitCode }                                              # Exit if critical
   #                                                                                -----------------------------------
}
#
#endregion ************************************************************************************************************
#region    **********[ ENTRY POINT ]***********************************************************************************
#
#-----------------------------------------------------------------------------------#
"--------------------------------------------------------------------- " | OUT-HOST # 1 - Read setup parameters.
"Load assemblies.                                                      " | OUT-HOST #
try   { Add-Type -AssemblyName 'Microsoft.Office.Interop.Outlook'       }           #
catch { "! ERROR > A terminating error occurs." | OUT-HOST              }           #
if ($error.Count) { Le 1 }                                                          #
#-----------------------------------------------------------------------------------#
"--------------------------------------------------------------------- " | OUT-HOST # 2 - Get month number
"Get month number.                                                     " | OUT-HOST #
try   {  CMN_Get                                                        }           #
catch { "! ERROR > A terminating error occurs." | OUT-HOST              }           #
if ($error.Count) { Le 2 }                                                          #
#-----------------------------------------------------------------------------------#
"--------------------------------------------------------------------- " | OUT-HOST # 3 - Load calendar entries
"Load calendar entries.                                                " | OUT-HOST #
try   { CAL_Load                                                        }           #
catch { "! ERROR > A terminating error occurs." | OUT-HOST              }           #
if ($error.Count) { Le 3 }                                                          #
#-----------------------------------------------------------------------------------#
"--------------------------------------------------------------------- " | OUT-HOST # 4 - Display result
"Display result.                                                       " | OUT-HOST #
try   { $script:SUM.Values | OUT-GRIDVIEW                                           #
        READ-HOST "Press ENTER to continue"                             }           #
catch { "! ERROR > A terminating error occurs." | OUT-HOST              }           #
if ($error.Count) { Le 4 }                                                          #
#-----------------------------------------------------------------------------------#
#
#endregion ************************************************************************************************************
#
# EOF