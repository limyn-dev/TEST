Add-Type -AssemblyName presentationframework

[string] $P = SPLIT-PATH -Path $MyInvocation.MyCommand.Definition -Parent           # Current path                    
[string] $N = "DB1"                                                                 # DB name
[string] $F = "$P\$N.xml"                                                           # DB file
[object] $R = $null                                                                 # XmlReader object
[object] $W = $null                                                                 # Window object
[object] $D = $null                                                                 # Dataset object
#                                                                                   -----------------------------------
"" | OUT-HOST; "Open XML DB [$F]" | OUT-HOST                                        # Open DB
$D = NEW-OBJECT System.Data.DataSet                                                 #
$D.ReadXml($F)                                                                      #
#                                                                                   -----------------------------------
$R = [system.xml.xmlreader]::Create("$P\GUI.xaml")                                  # Load XAML
$W = [Windows.Markup.XamlReader]::Load($R)                                          #
New-Variable -Name "DG_MAIN" -Value $W.FindName("DG_MAIN") -Force                   #     Bind datagrid
#                                                                                   -----------------------------------
$DG_MAIN.ItemsSource = $D.Tables['T1'].DefaultView                                  # Bind data to datagrid
$DG_MAIN | GM
#                                                                                   -----------------------------------
$Null = $W.ShowDialog()                                                             # Display window
#                                                                                   -----------------------------------
"" | OUT-HOST; "Save XML DB [$F]" | OUT-HOST                                        # Save DB to file
$D.WriteXml($F)                                                                     #
#                                                                                   -----------------------------------
