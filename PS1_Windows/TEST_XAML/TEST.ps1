Add-Type -AssemblyName presentationframework

[string] $P = SPLIT-PATH -Path $MyInvocation.MyCommand.Definition -Parent           # Current path                    
[object] $R = [system.xml.xmlreader]::Create("$P\GUI.xaml")                         # Open XAML file
[object] $W = [Windows.Markup.XamlReader]::Load($R)                                 # Create window
#                                                                                   -----------------------------------
#$X.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]")  | % {
#    New-Variable  -Name $_.Name -Value $W.FindName($_.Name) -Force
#} 
#                                                                                   -----------------------------------
$Null = $W.ShowDialog()                                                             # Display window
#                                                                                   -----------------------------------