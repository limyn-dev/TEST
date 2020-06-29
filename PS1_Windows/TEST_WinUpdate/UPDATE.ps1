$S = New-Object -ComObject "Microsoft.Update.Session"
$F = $S.CreateUpdateSearcher()
$C = $F.GetTotalHistoryCount()
$F.QueryHistory(0, $C) | % { $_.Title }