param( [string] $CPT="" 
     , [string] $USR=""
     )
#                                                                                   -----------------------------------
[string]    $P = SPLIT-PATH -Path $MyInvocation.MyCommand.Definition -Parent        # Current path
[string]    $T = "$P\_.rdp"                                                         # RDP template
[string]    $F = "$P\Files\$($CPT).rdp"                                             # RDP file
[string]    $A = ""                                                                 # Host IP address
[hashtable] $V = @{}                                                                # File content
[int]       $C = 0                                                                  # Display number
[int]       $W = 0                                                                  # Display width
[int]       $H = 0                                                                  # Display height
[hashtable] $D = @{'H'=0; 'W'=0}                                                    # Display size
#                                                                                   -----------------------------------
try   { $A = (RESOLVE-DNSNAME $CPT -Server '10.64.2.181').IPAddress }               # Get host IP
catch { $A = ""                                                     }               #
#                                                                                   -----------------------------------
Add-Type -AssemblyName System.Windows.Forms                                         # Get screen parameters
[System.Windows.Forms.Screen]::AllScreens | % {                                     #
   $C++                                                                             #
   $H = $_.WorkingArea.Height                                                       #
   $W = $_.WorkingArea.Width                                                        #
   "              " | OUT-HOST                                                      #
   "Screen [$C]   " | OUT-HOST                                                      #
   "   Width  [$W]" | OUT-HOST                                                      #
   "   Height [$H]" | OUT-HOST                                                      #
   if ($W -gt $D['W']) { $D['W']=$W; $D['H']=$H }                                   #
}                                                                                   #
#                                                                                   -----------------------------------
"RDP template    [$T]             " | OUT-HOST                                      # Display param
"RDP file        [$F]             " | OUT-HOST                                      #
"Host Name       [$CPT]           " | OUT-HOST                                      #
"Host IP address [$A]             " | OUT-HOST                                      #
"User name       [$USR]           " | OUT-HOST                                      #
"Display count   [$C]             " | OUT-HOST                                      #
"Display With    [$($($D['W']))]  " | OUT-HOST                                      #
"Display Height  [$($($D['H']))]  " | OUT-HOST                                      #
#                                                                                   -----------------------------------
if (!((READ-HOST "Start [Y,N]") -like 'Y'))  { EXIT 1 }                             # Checks
if (!(TEST-PATH $T)                       )  { EXIT 2 }                             #
if (($W * $H) -eq 0                       )  { EXIT 3 }                             #
if ($A -eq ""                             )  { EXIT 4 }                             #
#                                                                                   -----------------------------------
"Read file [$T]" | OUT-HOST                                                         # Read RDP file
GET-CONTENT $T | % { $V.Add(($_.Split(":"))[0], $_) }                               #
#                                                                                   -----------------------------------
$V['desktopwidth']       = "desktopwidth:i:$($D['W'])"                              # Set values
$V['desktopheight']      = "desktopheight:i:$($D['H'])"                             #
$V['connection type']    = 'connection type:i:1'                                    #
$V['full address']       = "full address:s:$A"                                      #
$V['redirectclipboard']  = 'redirectclipboard:i:1'                                  #
$V['redirectcomports']   = 'redirectcomports:i:0'                                   #
$V['redirectdirectx']    = 'redirectdirectx:i:0'                                    #
$V['redirectdrives']     = 'redirectdrives:i:1'                                     #
$V['redirectposdevices'] = 'redirectposdevices:i:0'                                 #
$V['redirectprinters']   = 'redirectprinters:i:0'                                   #
$V['redirectsmartcards'] = 'redirectsmartcards:i:0'                                 #
$V['username']           = "username:s:$USR"                                        #
#                                                                                   -----------------------------------
"Write file [$F]" | OUT-HOST                                                        # Write file
if (TEST-PATH $F) { RM $F -Force }                                                  #
$V.GetEnumerator() | sort -Property name | % { AC $F $_.Value -Force }              #
#                                                                                   -----------------------------------
if ($C -gt 1)                                                  {                    # Start mstsc.exe
   "Start single display RDP session from [$F]  " | OUT-HOST                        #
   START mstsc.exe -ArgumentList "/ADMIN"     ,"""$F"""        }                    #
else                                                           {                    #
   "Start mutiple display RDP session from [$F] " | OUT-HOST                        #
   START mstsc.exe -ArgumentList "/ADMIN","/f","""$F"""        }                    #
#                                                                                   -----------------------------------
