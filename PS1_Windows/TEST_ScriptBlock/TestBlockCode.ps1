
#                                                                                   -----------------------------------
[string]    $P = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent        #
[string]    $F = "$P\Code.txt"                                                      #
[object]    $B = $null                                                              #
[string]    $S = ""                                                                 #
[string]    $V = "Variable"                                                         #
[object[]]  $I = @()                                                                #
[object[]]  $O = @()                                                                #
[hashtable] $H = @{}                                                                #
#                                                                                   -----------------------------------
function FCT { param($A, $B) "From FCT, V[$V] A[$A] B[$B]" | OUT-HOST }             #
#                                                                                   -----------------------------------
"" | OUT-HOST; "Literal ScriptBlock" | OUT-HOST                                     #
$B = { param($A, $B) write-host "From ScriptBlock, v[$V] A[$A] B[$B]" }             #
$H = @{}                                                                            #
$H.Add("A", "VAL_A")                                                                #
$H.Add("B", "VAL_B")                                                                #
& $B @H                                                                             #
#                                                                                   -----------------------------------
"" | OUT-HOST; "ScriptBlock from string" | OUT-HOST                                 #
$S = 'param($A, $B) write-host "From ScriptBlock, V[$V] A[$A] B[$B]"'               #
$B = [scriptblock]::Create($S)                                                      #
$H = @{}                                                                            #
$H.Add("A", "VAL_A")                                                                #
$H.Add("B", "VAL_B")                                                                #
& $B @H                                                                             #
#                                                                                   -----------------------------------
"" | OUT-HOST; "ScriptBlock from function" | OUT-HOST                               #
$B = (GI "Function:\FCT").ScriptBlock                                               #
$H = @{}                                                                            #
$H.Add("A", "VAL_A")                                                                #
$H.Add("B", "VAL_B")                                                                #
& $B @H                                                                             #
#                                                                                   -----------------------------------
"" | OUT-HOST; "INVOKE-COMMAND from Literal ScriptBlock" | OUT-HOST                 #
$B = { param($A, $B) write-host "From ScriptBlock, V[$V] [$A], B [$B]" }            #
Invoke-Command -ScriptBlock $B -ArgumentList "VAL_A", "VAL_B"                       #
#                                                                                   -----------------------------------
"" | OUT-HOST; "INVOKE-COMMAND from string" | OUT-HOST                              #
$S = 'param($A, $B) write-host "From ScriptBlock, V[$V] A[$A] B[$B]"'               #
$B = [scriptblock]::Create($S)                                                      #
$I = @();  $I += "VAL_A"; $I += "VAL_B"                                             #
Invoke-Command -ScriptBlock $B -ArgumentList $I                                     #
#                                                                                   -----------------------------------
"" | OUT-HOST; "INVOKE-COMMAND from file [$F]" | OUT-HOST                           #
$B = [scriptblock]::Create([IO.File]::ReadAllText($F))                              #
Invoke-Command -ScriptBlock $B -ArgumentList @("VAL_A", "VAL_B")                    #
#                                                                                   -----------------------------------
"" | OUT-HOST; "INVOKE-COMMAND from function" | OUT-HOST                            #
$B = (GI "Function:\FCT").ScriptBlock                                               #
Invoke-Command -ScriptBlock $B -ArgumentList @("VAL_A", "VAL_B")                    #
#                                                                                   -----------------------------------
