[string] $N = "$($env:USERPROFILE)\Desktop\myLink.lnk"                              # Shortcut full name
[string] $T = "c:\windows\notepad.exe"                                              # Shortcut target
[object] $S = New-Object -comObject WScript.Shell                                   # Shell object
[object] $L = $null                                                                 # Shortcut object
#                                                                                   -----------------------------------
if (TEST-PATH $N)       {                                                           # Check if shortcut exists
    "Shortcut [$N] already exists." | OUT-HOST                                      #   
    EXIT                                                                            #    It exists, Exit
}                                                                                   #
#                                                                                   -----------------------------------
if (!(TEST-PATH $T))    {                                                           # Check if target exists
    "Target [$N] not exists." | OUT-HOST                                            #   
    EXIT                                                                            #    It exists, Exit
}                                                                                   #
#                                                                                   -----------------------------------
"Create shortcut [$N]." | OUT-HOST                                                  # Create shortcut
$L = $S.CreateShortcut($N)                                                          #
$L.TargetPath = $T                                                                  #
$L.Save()                                                                           #
#                                                                                   -----------------------------------