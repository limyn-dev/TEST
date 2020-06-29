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
function SUM_Add    {
   param ([object] $oCalEntry = $null)
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string] $S = $oCalEntry.Categories.ToUpper()                                    #
   [Int32]  $D = 0                                                                  #
   [string] $M = ""                                                                 #
   #                                                                                -----------------------------------      
   $M  = "Add calendar item          "                                              #
   $M += " [$($oCalEntry.Start)]     "                                              #
   $M += " [$($oCalEntry.Categories)]"                                              #
   $M += " [$($oCalEntry.Subject)]   "                                              #
   $M += " [$($oCalEntry.Duration)]  "                                              #
   $M += " [$($oCalEntry.Location)]  "                                              #
   $M += " [$($oCalEntry.Saved)]     "                                              #
   $M | OUT-HOST                                                                    #
   #                                                                                -----------------------------------      
   if ($script:SUM.Contains($S)) {                                                  #
      $D = $script:SUM[$S].DURATION + $oCalEntry.Duration                           #
      $script:SUM[$S].COUNT++                                                       #
      $script:SUM[$S].SUBJECT += ";$($oCalEntry.Subject)"                           #
      $script:SUM[$S].START   += ";$($oCalEntry.Start.ToString())"                  #
      $script:SUM[$S].DURATION += ($D/60)                                           #
      $script:SUM[$S].DUR_1_9  += ($D/540)                                          #
      $script:SUM[$S].DUR_2_9  += ($D/270)                                          #
   }                                                                                #
   else                          {                                                  #
      $H = @{}                                                                      #
      $H.Add( 'COUNT'     , 1                                  )                    #      
      $H.Add( 'SUBJECT'   , "$($oCalEntry.Subject)"            )                    #
      $H.Add( 'CATEGORIES', $oCalEntry.Categories              )                    #
      $H.Add( 'LOCATION'  , $oCalEntry.Location                )                    #      
      $H.Add( 'START'     , ";$($oCalEntry.Start.ToString())"  )                    #
      $H.Add( 'DURATION'  , $oCalEntry.Duration/60             )                    #
      $H.Add( 'DUR_1_9'   , $oCalEntry.Duration/540            )                    #
      $H.Add( 'DUR_2_9'   , $oCalEntry.Duration/270            )                    #
      $script:SUM.Add($S, (New-Object PSObject -Property $H)   )                    #
   }                                                                                #
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
      if ($W -eq $script:CWN)                                  {                    #
         if ($_.Start.Year -eq (GET-DATE).Year) {SUM_Add $_ }  }                    #
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