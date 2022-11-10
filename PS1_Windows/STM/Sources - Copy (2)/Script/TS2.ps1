param( [string] $RDP="")
#                                                                                   -----------------------------------
[hashtable] $F = @{}                                                                # File content
[string[]]  $L = @()                                                                #
[int]       $W = 0                                                                  #
[int]       $H = 0                                                                  #
#                                                                                   -----------------------------------
Add-Type -AssemblyName System.Windows.Forms                                         # Set screen size
[System.Windows.Forms.Screen]::AllScreens | % {                                     #
   if (($_.WorkingArea.Width * $_.WorkingArea.Height) -gt ($W * $H)) {              #
      $W = $_.WorkingArea.Width                                                     #
      $H = $_.WorkingArea.Height                                                    #
   }                                                                                #
}                                                                                   #
#                                                                                   -----------------------------------
if (!(TEST-PATH $RDP))  { EXIT 2 }                                                  #
if (($W * $H) -eq 0)    { EXIT 3 }                                                  #
#                                                                                   -----------------------------------
GET-CONTENT $RDP | % { $L = $_.Split(":"); $F.Add($L[0], $_) }                      # Set RDP file
$F['desktopwidth']        = "desktopwidth:i:$W"                                     #
$F['desktopheight']       = "desktopheight:i:$H"                                    #
$F.Values | OUT-FILE $RDP -Force                                                    #
#                                                                                   -----------------------------------
mstsc.exe $RDP                                                  					      #
#                                                                                   -----------------------------------
