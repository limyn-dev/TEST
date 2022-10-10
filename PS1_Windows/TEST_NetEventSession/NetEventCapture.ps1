
[string] $P = SPLIT-PATH -Path $MyInvocation.MyCommand.Definition -Parent           #
[string] $N = "NetCapSes_$(GET-DATE -format 'yyMMddhhmmss')"                        #
[string] $F = "$($P)\$($N).etl"                                                     #
#                                                                                   -----------------------------------
"Initialize net capture session [$N] to [$F]" | OUT-HOST
$S = New-NetEventSession -Name $N -LocalFilePath $F
Add-NetEventProvider -Name "Microsoft-Windows-TCPIP" -SessionName $N
#                                                                                   -----------------------------------
"Start net capture session [$N]" | OUT-HOST
Start-NetEventSession -Name $N
#                                                                                   -----------------------------------
START-SLEEP -s 10
#                                                                                   -----------------------------------
"Stop net capture session [$N]" | OUT-HOST
Stop-NetEventSession -Name $N
#                                                                                   -----------------------------------
"Remove net capture session [$N]" | OUT-HOST
Remove-NetEventSession -Name $N
#                                                                                   -----------------------------------

