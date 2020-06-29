
[string] $P = "Microsoft-Windows-TCPIP"
[string] $N = ([GUID]::NewGuid()).Tostring()
[object] $S = $null
[string] $F = ""
[object] $L = $null

Get-NetEventSession | % { 
   "Remove NetEventSession [$($_.Name)]"
   Remove-NetEventSession -Name $_.Name 
}

"Initialize NetEventSession [$N]"
$S = New-NetEventSession -Name $N
Add-NetEventProvider -Name $P -SessionName $N

"Start NetEventSession [$N]"
Start-NetEventSession -Name $N

"Waitting 60 seconds...."
Start-Sleep -s 60

"Stop NetEventSession [$N]"
Stop-NetEventSession -Name $N

$F = $S.LocalFilePath
"Open log file [$F]"
Get-WinEvent -Path $F -Oldest | % { $_ }