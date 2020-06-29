
#
# LITERALS
#                                                                                   -----------------------------------
[string] $script:PTH = SPLIT-PATH -Path $MyInvocation.MyCommand.Definition -Parent  # Current path                    
[string] $script:UIF = "$($script:PTH)\GUI.xaml"                                    # XAML file
#                                                                                   -----------------------------------
# LIBS
#                                                                                   -----------------------------------
Add-Type -AssemblyName presentationframework                                        # Load lib
#                                                                                   -----------------------------------
# GLOBALS
#                                                                                   -----------------------------------
[object] $script:WND =$null                                                         # Window object
#                                                                                   -----------------------------------
# FUNCTIONS
#
function Init     {
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [Windows.Controls.Grid] $G = $null                                               #
   [object]                $O = $null                                               #
   #                                                                                -----------------------------------
   $script:WND = [system.xml.xmlreader]::Create($script:UIF)                        # Load XAML file
   $script:WND = [Windows.Markup.XamlReader]::Load($script:WND)                     #
   #                                                                                -----------------------------------
   $G = $script:WND.FindName("GD_MAIN")                                             # Add Grid title
   $O = NEW-OBJECT "Windows.Controls.RowDefinition"                                 #    Add rowdefinition
   $O.Height = 24                                                                   #
   $O = $G.RowDefinitions.Add($O)                                                   #
   $O          = NEW-OBJECT "Windows.Controls.TextBlock"                            #    Add textblock
   $O.Text     = 'TIME'                                                             #
   $O.FontSize = 14                                                                 #
   [Windows.Controls.Grid]::SetRow($O, 0)                                           #
   [Windows.Controls.Grid]::SetColumn($O, 0)                                        #
   $O = $G.Children.Add($O)                                                         #
   #                                                                                -----------------------------------
}
function ITM_Add {
   param ( [string] $sComputer = ""
         , [string] $sTask     = ""
         , [string] $sTime     = "" )
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [Windows.Controls.DataGrid] $D = $script:WND.FindName("DG_MAIN")                 #
   [Windows.Controls.Grid]     $G = $script:WND.FindName("GD_MAIN")                 #
   [hashtable]                 $H = @{}                                             #
   [object]                    $O = $null                                           #
   [int]                       $R = $D.Items.count+1                                #
   #                                                                                -----------------------------------           
   $H = @{}                                                                         # Update datagrid
   $H.Add('COMPUTER', $sComputer                   )                                #
   $H.Add('TASK'    , $sTask                       )                                #
   $O = $D.Items.Add((NEW-OBJECT PSObject -Property $H) )                           #
   #                                                                                -----------------------------------
   $O = NEW-OBJECT "Windows.Controls.RowDefinition"                                 #
   $O.Height = 19                                                                   #
   $O = $G.RowDefinitions.Add($O)                                                   # Add Grid row definition
   #                                                                                -----------------------------------
   $O          = NEW-OBJECT "Windows.Controls.TextBlock"                            # Add time
   $O.Text     = $sTime                                                             #
   $O.FontSize = 14                                                                 #
   [Windows.Controls.Grid]::SetRow($O, $R)                                          #
   [Windows.Controls.Grid]::SetColumn($O, 0)                                        #
   $O = $G.Children.Add($O)                                                         #
   #                                                                                -----------------------------------
}
#
# ENTRY POINT
#                                                                                   -----------------------------------
Init                                                                                #
#                                                                                   -----------------------------------
ITM_Add 'Computer_1' 'Task_11' '-----000----------------'                           # Add items
ITM_Add 'Computer_1' 'Task_12' '----------000-----------'                           #
ITM_Add 'Computer_1' 'Task_13' '-------00000------------'                           #
ITM_Add 'Computer_2' 'Task_21' '---------------0000-----'                           #
ITM_Add 'Computer_2' 'Task_22' '--------0---------------'                           #
ITM_Add 'Computer_3' 'Task_31' '------------00----------'                           #
ITM_Add 'Computer_3' 'Task_32' '-----000----------------'                           # Add items
ITM_Add 'Computer_4' 'Task_41' '----------000-----------'                           #
ITM_Add 'Computer_4' 'Task_42' '-------00000------------'                           #
ITM_Add 'Computer_5' 'Task_51' '---------------0000-----'                           #
ITM_Add 'Computer_5' 'Task_52' '--------0---------------'                           #
ITM_Add 'Computer_6' 'Task_61' '------------00----------'                           #
#                                                                                   -----------------------------------
$Null = $script:WND.ShowDialog()                                                    # Display window
#                                                                                   -----------------------------------