
[string]    $P = SPLIT-PATH -Path $MyInvocation.MyCommand.Definition -Parent         # Current path                    
[string]    $F = "$P\DATA.xml"
[hashtable] $L = @{}

"Create hashtable" | OUT-HOST
$L.Add('PS1', 'PS+_AAA;PS+_BBB;PS+_CCC')
$L.Add('CMT', 'CMT_AAA;CMT_BBB;CMT_CCC')
$L.Add('CMP', 'CMP_AAA;CMP_BBB;CMP_CCC')

"Export hashtable to [$F]" | OUT-HOST
$L | EXPORT-CLIXML $F

"Import hashtable from [$F]" | OUT-HOST
$L = [hashtable](IMPORT-CLIXML $F)

"value of CMT [$($L['CMT'])]" | Out-Host