Add-Type -AssemblyName presentationframework

[string] $P = SPLIT-PATH -Path $MyInvocation.MyCommand.Definition -Parent           # Current path                    
[object] $R = [system.xml.xmlreader]::Create("$P\GUI.xaml")                         # Open XAML file
[object] $W = [Windows.Markup.XamlReader]::Load($R)                                 # Create window
#                                                                                   -----------------------------------
$C = $W.FindName("CNV_BCG")
#                                                                                   -----------------------------------
$L = NEW-OBJECT "System.Windows.Shapes.Line"
$L.Stroke = "Red"
$L.X1     = 50
$L.X2     = 100
$L.Y1     = 50
$L.Y2     = 100
$C.Children.Add($L)
#                                                                                   -----------------------------------
$Null = $W.ShowDialog()                                                             # Display window
#                                                                                   -----------------------------------