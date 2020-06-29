#
# ********** GLOABALS *************************************************************************************************
#                                                                                   -----------------------------------
[string] $script:PTH = $MyInvocation.MyCommand.Definition                           # Current path                    
         $script:PTH = SPLIT-PATH -Path $script:PTH -Parent                         #
[object] $script:PXA = $null                                                        #
[object] $script:DOC = $null                                                        #
#
# ********** ASSEMBLIES ***********************************************************************************************
#                                                                                   -----------------------------------
[void][Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")            #
[void][Reflection.Assembly]::LoadWithPartialName('presentationframework')           #
#                                                                                   -----------------------------------
# ********** FUNCTION *************************************************************************************************
#
function DocLoad {
   param ( [string] $sUrl = "")

#   [object] $P = [System.Net.WebRequest]::GetSystemWebProxy()
#   [object] $W = New-Object System.Net.WebClient
   
#   "Set proxy"
#   $P.Credentials = [System.Net.CredentialCache]::DefaultCredentials
#   $W.Proxy = $P
   
#   "Load page [$sUrl]"
#   $W.DownloadString($sUrl)

   [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null
   [string] $P = [Microsoft.VisualBasic.Interaction]::InputBox('Proxy', 'User', "")

   if ($P -eq "") {
      $R = Invoke-WebRequest $sUrl
   }
   else {
      $R = Invoke-WebRequest $sUrl -Proxy $P -ProxyUseDefaultCredentials
   }
   
   'Forms'              | OUT-HOST
   $R.Forms             | Format-Table
   'Headers'            | OUT-HOST
   $R.Headers           | Format-Table
   'Images'             | OUT-HOST
   $R.Images            | Format-Table
   'InputFields'        | OUT-HOST
   $R.InputFields       | Format-Table
   'Links'              | OUT-HOST
   $R.Links             | Format-Table
   'Scripts'            | OUT-HOST
   $R.Scripts           | Format-Table
   'StatusCode'         | OUT-HOST
   $R.StatusCode        | Format-Table
   'StatusDescription'  | OUT-HOST
   $R.StatusDescription | Format-Table


   $R.Forms | % {
      $_ | GM
   }
 
}
#
# ********** ENTRY POINT **********************************************************************************************
#                                                                                   -----------------------------------
DocLoad "http://www.google.ch/"
#                                                                                   -----------------------------------