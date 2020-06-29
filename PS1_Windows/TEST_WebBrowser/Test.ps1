#
# ********** GLOABALS *************************************************************************************************
#                                                                                   -----------------------------------
[string] $script:PTH = $MyInvocation.MyCommand.Definition                           # Current path                    
         $script:PTH = SPLIT-PATH -Path $script:PTH -Parent                         #
[string] $script:FUI = "$($script:PTH)\GUI.xaml"                                    # Current path                             
[object] $script:FRM = $null                                                        #
[object] $script:WBR = $null                                                        #
[object] $script:DOC = $null                                                        #
#
# ********** ASSEMBLIES ***********************************************************************************************
#                                                                                   -----------------------------------
[void][Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")            #
[void][Reflection.Assembly]::LoadWithPartialName('presentationframework')           #
#                                                                                   -----------------------------------
# ********** FUNCTION *************************************************************************************************
#
function DOC_Load {

    "Get document" | OUT-HOST
    $script:WBR = $script:FRM.FindName('WBR_Main') 
    if ($script:WBR -eq $null) { '$script:FRM is NULL'  | OUT-HOST; return  }

    $script:WBR.Document | GM

    return 
    
    $script:DOC = [Windows.Forms.HtmlDocument] $script:WBR.Document
    if ($script:DOC -eq $null) { 'Document is NULL'     | OUT-HOST; return  }
    
    $script:DOC | GM

}
function EVT_CPN  {
   param ( [object] $Sender )
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string] $K = ""                                                                 #
   #                                                                                -----------------------------------
   $K  = $Sender.Source.Name + '@' + $Sender.GetType().Name                         # Get event source
   "EVENT RAISED [$K]" | OUT-HOST                                                   #
   #                                                                                -----------------------------------
   switch ($K) {                                                                    # Process event actions
    '@NavigationEventArgs' { DOC_Load }                                             #
   }                                                                                #
   #                                                                                -----------------------------------
}
function FRM_Init {
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string] $F = ""                                                                 #
   [object] $R = $null                                                              #
   [object] $O = $null                                                              #
   #                                                                                -----------------------------------
   
   #                                                                                -----------------------------------    
   $R=[system.xml.xmlreader]::Create($script:FUI)                                   #
   $script:FRM = [Windows.Markup.XamlReader]::Load($R)                              #
   #                                                                                -----------------------------------
   $O = $script:FRM.FindName('WBR_Main' )                                           #
   $O.Add_LoadCompleted( { EVT_CPN $_ } ) | OUT-NULL                                #
   #                                                                                -----------------------------------
}
#
# ********** ENTRY POINT **********************************************************************************************
#                                                                                   -----------------------------------
FRM_Init                                                                            #
#                                                                                   -----------------------------------
$script:WBR = $script:FRM.FindName("WBR_Main")                                      #
$script:WBR.Navigate("http://www.google.ch/")                                       #   
$script:FRM.ShowDialog()                                                            #
#                                                                                   -----------------------------------