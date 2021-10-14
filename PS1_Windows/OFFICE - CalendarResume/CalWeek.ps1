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
[int]       $script:CWN = 0
#                                                                                   -----------------------------------
#endregion ************************************************************************************************************
#region    **********[ FUNCTIONS   ]***********************************************************************************
#
function CWN_Get    {
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   #                                                                                -----------------------------------      
   do {                                                                             #
      try   { $script:CWN = [int](READ-HOST "Week number")  }                       #
      catch { "ERROR" | OUT-HOST                            }                       #
      if ($error.Count) { $error.Clear()                                            #
                          $script:CWN = 0 }                                         #
   } while ($script:CWN -eq 0)                                                      #
   #                                                                                -----------------------------------         
}
function SUM_Add {
   param ([object] $oCalEntry = $null)
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string] $K = ""                                                                 #
   [double] $T = 0.0                                                                #
   #                                                                                -----------------------------------      
   $K  = GET-DATE -Date $oCalEntry.Start -Format 'yyMM-dd'                          # Set entry key
   $K += ";$($oCalEntry.Categories)"                                                #
   $T = $oCalEntry.Duration/60                                                      # Update sum
   #                                                                                -----------------------------------         
   "Add calendar item                        " | OUT-HOST                           #
   "   Key      [$($K)]                      " | OUT-HOST                           #
   "   Subject  [$($oCalEntry.Subject)]      " | OUT-HOST                           #
   "   Duration [$($oCalEntry.Duration)][$T] " | OUT-HOST                           #
   "   Location [$($oCalEntry.Location)]     " | OUT-HOST                           #
   "   Saved    [$($oCalEntry.Saved)]        " | OUT-HOST                           #
   #                                                                                -----------------------------------      
   if ($script:SUM.Contains($K)) { $script:SUM[$K]+=$T     }                        #
   else                          { $script:SUM.Add($K, $T) }                        #
   #                                                                                -----------------------------------    
}

function CAL_Load   {
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [object] $O = New-Object -ComObject outlook.application                          #
   [object] $N = $O.GetNameSpace('MAPI')                                            #
   [object] $C = [Microsoft.Office.Interop.Outlook.OlDefaultFolders]::olFolderCalendar
   #                                                                                -----------------------------------      
   $N.getDefaultFolder($C).items | % {                                              #
      [object] $R = $script:CCI.DateTimeFormat.CalendarWeekRule                     #
      [int]    $F = $script:CCI.DateTimeFormat.FirstDayOfWeek                       #
      [int]    $W = $script:CCI.Calendar.GetWeekOfYear($_.StartUTC, $R, $F)         #
      if (($W - $script:CWN) -eq 0)                            {                    #
         if ($_.Start.Year -eq (GET-DATE).Year) { SUM_Add $_ } }                    #
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
"--------------------------------------------------------------------- " | OUT-HOST # 2 - Get week number
"Get week number.                                                      " | OUT-HOST #
try   {  CWN_Get                                                        }           #
catch { "! ERROR > A terminating error occurs." | OUT-HOST              }           #
if ($error.Count) { Le 1 }                                                          #
#-----------------------------------------------------------------------------------#
"--------------------------------------------------------------------- " | OUT-HOST # 3 - Load calendar entries
"Load calendar entries.                                                " | OUT-HOST #
try   { CAL_Load                                                        }           #
catch { "! ERROR > A terminating error occurs." | OUT-HOST              }           #
if ($error.Count) { Le 2 }                                                          #
#-----------------------------------------------------------------------------------#
"--------------------------------------------------------------------- " | OUT-HOST # 4 - Display result
"Display result Week [$($script:CWN)].                                 " | OUT-HOST #
try   { $O = $script:SUM.GetEnumerator() | sort -Property name                      #
        $O | Format-Table -AutoSize | OUT-HOST                                      #
        READ-HOST "Press ENTER to continue"                             }           #
catch { "! ERROR > A terminating error occurs." | OUT-HOST              }           #
if ($error.Count) { Le 4 }                                                          #
#-----------------------------------------------------------------------------------#
#
#endregion ************************************************************************************************************
#
# EOF