<# ====================================================================================================================
.DESCRIPTION
   Set DHCP option scope

.PARAMETER LP
   Logs files path
   
.PARAMETER DX
   Number of days max of log entry.
   
.EXAMPLE 1
   powershell.exe -f ".\SCCM_Log.ps1" -LP "C:\Windows\CCM\Logs" -DX 3

==================================================================================================================== #>
#region    **********[ PARAM       ]***********************************************************************************
param ( [Parameter(Mandatory=$true  ,Position=1)][string] $LP = ""
      , [Parameter(Mandatory=$false ,Position=2)][UInt32] $DX = 1
      )
#endregion ************************************************************************************************************
#region    **********[ GLOBAL      ]***********************************************************************************
#                                                                                   -----------------------------------
[string]   $script:SPH  = $MyInvocation.MyCommand.Definition                        # Current path
           $script:SPH  = SPLIT-PATH -Path $script:SPH -Parent                      #
[DateTime] $script:DTL  = (GET-DATE).AddDays($DX * -1)                              #
[string]   $script:LRX  = '\<\!\[LOG\[(?<Message>.*)?\]LOG\]\!\>'                   # Log line regex matching
           $script:LRX += '\<time=\"(?<Time>.+)(?<TZAdjust>[+|-])(?<TZOffset>\d{2,3})\"'
           $script:LRX += '\s+date=\"(?<Date>.+)?\"'                                #
           $script:LRX += '\s+component=\"(?<Component>.+)?\"'                      #
           $script:LRX += '\s+context="(?<Context>.*)?\"'                           #
           $script:LRX += '\s+type=\"(?<Type>\d)?\"'                                #
           $script:LRX += '\s+thread=\"(?<TID>\d+)?\"'                              #
           $script:LRX += '\s+file=\"(?<Reference>.+)?\"\>'                         #     
[string]   $script:ROW  = ""                                                        # Current row
[bool]     $script:RDY  = $false                                                    # Current row redy flag
[object[]] $script:LOG  = @()                                                       # Log entries list
#                                                                                   -----------------------------------
[string[]] $script:EX1  = @()                                                       # Line exception
           $script:EX1 += '<![LOG[Raising event'                                    #
           $script:EX1 += 'instance of CCM_PolicyAgent'                             #
           $script:EX1 += '{'                                                       #
           $script:EX1 += 'AuthorityName ='                                         #
           $script:EX1 += 'ClientID ='                                              #
           $script:EX1 += 'DateTime ='                                              #
           $script:EX1 += 'ProcessID ='                                             #
           $script:EX1 += 'ResourceName ='                                          #
           $script:EX1 += 'ResourceType ='                                          #
           $script:EX1 += 'ThreadID ='                                              #
           $script:EX1 += '};'                                                      #
           $script:EX1 += ']LOG]!>'                                                 #
#                                                                                   -----------------------------------           
#                                                                                   -----------------------------------
#endregion ************************************************************************************************************
#region    **********[ FUNCTIONS   ]***********************************************************************************
#
function LOG_ROW_Set  {
   param ( [string] $sString = "" )
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [int]    $C = $script:EX1.Count                                                  #
   [int]    $F = $C                                                                 #
   [string] $S = ""                                                                 #
   #                                                                                -----------------------------------
   for ([int]$N=1; $N -lt $C; $N++)                                     {           # Check if string is in exceptionlist
      $S = $script:EX1[$N]                                                          #
      if ($sString.Length -ge $S.Length)                             {              #
         if ($sString.Substring(0,$S.Length) -like $S ) { $F = $N }  }  }           #
   #                                                                                -----------------------------------
   if     ($F -eq 0   ) { $script:ROW = $sString   ; $script:RDY=$false }           # String is first exception of the list
   elseif ($F -eq $C-1) { $script:ROW+= " $sString"; $script:RDY=$true  }           # String is the last exception of the list
   elseif ($F -eq $C  ) { $script:ROW = $sString   ; $script:RDY=$true  }           # String is not in exception list
   else                 { $script:ROW+= " $sString"; $script:RDY=$false }           # String is in exception list
   #                                                                                -----------------------------------   
   "LOG_ROW_Set         > - Exception [$F]                             " | OUT-HOST #   
   "LOG_ROW_Set         > - ROW       [$($script:ROW)]                 " | OUT-HOST #   
   "LOG_ROW_Set         > - RDY       [$($script:RDY)]                 " | OUT-HOST #   
   #                                                                                -----------------------------------      
}
function LOG_ROW_Load {
   param ( [string] $sComputer  = ""                                                #
         , [string] $sFile      = ""                                                #
         , [string] $sComponent = ""                                                #
         , [string] $sType      = ""                                                #
         , [string] $sDate      = ""                                                #
         , [string] $sTime      = ""                                                #
         , [string] $sMessage   = ""   )                                            #
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [hashtable] $H = @{}                                                             #
   [string]    $T = ""                                                              #
   [string[]]  $A = @()                                                             #
   [hashtable] $D = @{ 'year'        = 0                                            #
                       'Month'       = 0                                            #
                       'Day'         = 0                                            #
                       'Hour'        = 0                                            #
                       'Minute'      = 0                                            #
                       'Second'      = 0                                            #
                       'Millisecond' = 0 }                                          #   
   #                                                                                -----------------------------------   
   switch($matches.Type)                     {                                      # Set entry type
      0 { $T = 'Verbose'               }                                            #
      1 { $T = 'Default'               }                                            #
      2 { $T = 'Warnings and errors'   }                                            #
      3 { $T = 'Errors only'           }  }                                         #
   #                                                                                -----------------------------------
   $A = $sDate.Split('-')                                                           # Get date value
   $D['year']=$A[2]; $D['Month']=$A[0]; $D['Day']=$A[1]                             #
   $A = $sTime.Replace('.', ':').Split(':')                                         #
   $D['Hour']=$A[0];$D['Minute']=$A[1];$D['Second']=$A[2];$D['Millisecond']=$A[3]   #
   if ((GET-DATE @D) -lt $script:DTL) { return }                                    #
   #                                                                                -----------------------------------
   $H = @{ 'COMPUTER'  = $sComputer                                                 # Set entry
           'FILE'      = $sFile                                                     #
           'COMPONENT' = $sComponent                                                #
           'MESSAGE'   = $sMessage                                                  #
           'TYPE_ID'   = $sType                                                     #
           'TYPE_TEXT' = $T                                                         #
           'DATE_VAL'  = GET-DATE @D                                                #
           'DATE_TEXT' = "$sDate $sTime"  }                                         #
   #                                                                                -----------------------------------                 
   $script:LOG += NEW-OBJECT PSObject -Property $H                                  # Add entry to list
   #                                                                                -----------------------------------                           
}
function LOG_FLE_Load {
   param ([string] $sFile = "")
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string]    $F = ""                                                              #
   [hashtable] $P = @{}                                                             #
   [Int32]     $R = 0                                                               #
   [Int32]     $E = 0                                                               #
   #                                                                                -----------------------------------
   "LOG_FLE_Load        > - - - - - - - - - - - - - - - - - - - - - - -" | OUT-HOST # Read file   
   "LOG_FLE_Load        > LOAD file [$sFile]                           " | OUT-HOST #
   $F = (GET-CONTENT $sFile -Raw).Replace(">`r`n","@@@@@@@@@@")                     #
   $F = $F.Replace("`r", "")                                                        #
   $F = $F.Replace("`n", "")                                                        #
   $F = $F.Replace("`t", "")                                                        #
   $F = $F.Replace("@@@@@@@@@@", ">`r`n")                                           #
   $F | OUT-FILE $sFile.Replace('.log', '.txt')                                     #
   #                                                                                -----------------------------------
   GET-CONTENT $sFile.Replace('.log', '.txt') | %                    {              # Process file lines
      $R++                                                                          #
      "LOG_FLE_Load        > Row [$R]" | OUT-HOST                                   #
      if ($script:ROW -match $script:LRX)                         {                 #
         $P = @{ 'sComputer'  = $env:COMPUTERNAME                                   #
                 'sFile'      = $sFile                                              #
                 'sComponent' = $matches.Component                                  #
                 'sType'      = $matches.Type                                       #
                 'sDate'      = $matches.Date                                       #
                 'sTime'      = $matches.Time                                       #
                 'sMessage'   = $matches.Message      }                             #
         LOG_ROW_Load @P                                          }                 #
      else                                                        {                 #
         $E++                                                                       #
         "LOG_FLE_Load        >    !ERROR on row [$R]" | OUT-HOST }  }              #
   #                                                                                -----------------------------------
   "LOG_FLE_Load        > STATUS:                                      " | OUT-HOST #
   "LOG_FLE_Load        >    Number of rows [$R]                       " | OUT-HOST #
   "LOG_FLE_Load        >    Errors rows    [$E]                       " | OUT-HOST #
   #                                                                                -----------------------------------
}
#
#endregion ************************************************************************************************************
#region    **********[ ENTRY POINT ]***********************************************************************************
#                                                                                   -----------------------------------
GCI "$LP\*.log" | ? { $_.LastWriteTime -gt $script:DTL } | %   {                    #
   LOG_FLE_Load $_.FullName                                    }                    #
#                                                                                   -----------------------------------
$script:LOG | OUT-GRIDVIEW                                                          #
READ-HOST "Press ENTER to close." | OUT-NULL                                        #
#                                                                                   -----------------------------------
#endregion ************************************************************************************************************
#
# EOF

