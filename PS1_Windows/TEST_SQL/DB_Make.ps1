[string] $P = SPLIT-PATH -Path $MyInvocation.MyCommand.Definition -Parent         # Current path                    
[string] $N = "DB1"                                                                 # DB name
[string] $F = "$P\$N.xml"                                                           # DB file
[object] $D = $null                                                                 # Dataset
[object] $T = $null                                                                 # Table
[object] $C = $null                                                                 # Column
#                                                                                   -----------------------------------
"" | OUT-HOST; "Create dataset" | OUT-HOST                                          # Create Dataset
$D = NEW-OBJECT System.Data.DataSet                                                 #
$D.DataSetName = $N                                                                 #
#                                                                                   -----------------------------------
"" | OUT-HOST; "Create T1" | OUT-HOST                                               # Create table T1
$T = $D.Tables.Add('T1')                                                            #
$C = New-Object System.Data.DataColumn 'T1_ID',([int])                              #    aDD COLUMN T1_ID
$C.AllowDBNull = $false                                                             #
$C.Unique = $true                                                                   #
$T.Columns.Add($C)                                                                  #
$C = New-Object System.Data.DataColumn 'T1_F1',([string])                           #    aDD COLUMN T1_F1
$T.Columns.Add($C)                                                                  #
$C = New-Object System.Data.DataColumn 'T1_F2',([string])                           #    aDD COLUMN T1_F2
$T.Columns.Add($C)                                                                  #
#                                                                                   -----------------------------------
"" | OUT-HOST; "Create T2" | OUT-HOST                                               # Create table 2
$T = $D.Tables.Add('T2')                                                            #
$C = New-Object System.Data.DataColumn 'T2_ID',([int])                              #
$C.AllowDBNull = $false                                                             #
$C.Unique      = $true                                                              #
$T.Columns.Add($C)                                                                  #
$C = New-Object System.Data.DataColumn 'T2_F1_STR',([string])                       #
$T.Columns.Add($C)                                                                  #
$C = New-Object System.Data.DataColumn 'T2_F2_STR',([string])                       #
$T.Columns.Add($C)                                                                  #
#                                                                                   -----------------------------------
"" | OUT-HOST; "Add data to T1" | OUT-HOST                                          # Add values to T1
$T = $D.Tables["T1"]                                                                #
[void]$T.Rows.Add(1,"T1_F1_VAL1","T1_F2_VAL1")                                      #
[void]$T.Rows.Add(2,"T1_F1_VAL2","T1_F2_VAL2")                                      #
[void]$T.Rows.Add(3,"T1_F1_VAL3","T1_F2_VAL3")                                      #
[void]$T.Rows.Add(4,"T1_F1_VAL4","T1_F2_VAL4")                                      #
[void]$T.Rows.Add(5,"T1_F1_VAL5","T1_F2_VAL5")                                      #
#                                                                                   -----------------------------------
"" | OUT-HOST; "Add data to T2" | OUT-HOST                                          # Add values to T2
$T = $D.Tables["T2"]                                                                #
[void]$T.Rows.Add(1,"T2_F1_VAL1","T2_F2_VAL1")                                      #
[void]$T.Rows.Add(2,"T2_F1_VAL2","T2_F2_VAL2")                                      #
[void]$T.Rows.Add(3,"T2_F1_VAL3","T2_F2_VAL3")                                      #
[void]$T.Rows.Add(4,"T2_F1_VAL4","T2_F2_VAL4")                                      #
[void]$T.Rows.Add(5,"T2_F1_VAL5","T2_F2_VAL5")                                      #
#                                                                                   -----------------------------------
"" | OUT-HOST; "Write Dataset to [$F]" | OUT-HOST                                   # Save DB to file
$D.WriteXml($F)                                                                     #
#                                                                                   -----------------------------------