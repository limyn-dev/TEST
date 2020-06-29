
[string]    $sLPath = SPLIT-PATH -Path $MyInvocation.MyCommand.Definition -Parent   # Current path
[hashtable] $aCList = @{}                                                           # Commands list
[string]    $sCFile = ""                                                            # Command file
[string]    $sValue = ""                                                            # Value for selecting file
#                                                                                   -----------------------------------
$aCList.Add('HP EliteBook 840 G2'    , "C_HP_840_G2.ps1")                           # Build actions list
$aCList.Add('VMware Virtual Platform', "C_VMWARE_VM.ps1")                           #
#                                                                                   -----------------------------------
$sValue = (gwmi -Class win32_computersystem).Model                                  # Get value
#                                                                                   -----------------------------------
if ($aCList.Contains($sValue)) {                                                    # Execute command file if exists
   $sCFile = $aCList[$sValue]                                                       #    Select command file
   $sCFile = "$sLPath\$sCFile"                                                      #    Set file full name
   "Execute command file [$sCFile]" | OUT-HOST                                      #    Value not found
   if ([System.IO.File]::Exists($sCFile)) { . $sCFile                             } #    Run command file
   else                                   { "File not found [$sCFile]" | OUT-HOST } #
}                                                                                   #
else {                                                                              #
   "Unable to find command for value [$sValue]" | OUT-HOST                          #    Value not found
}                                                                                   #
#                                                                                   -----------------------------------
