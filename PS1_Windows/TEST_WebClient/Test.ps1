#
# ********** ENTRY POINT **********************************************************************************************
#                                                                                   -----------------------------------
[string] $S = ""                                                                    #
[object] $O = $null                                                                 #
#                                                                                   -----------------------------------
$S = 'http://www.google.ch'                                                         # Get web page content
$O = New-Object System.Net.WebClient                                                #
"Load page [$S]" | OUT-HOST                                                         #
$S = $O.DownloadString($S)                                                          #
#                                                                                   -----------------------------------
"Create document from string" | OUT-HOST                                            # Parse HTML
$O = New-Object -com "HTMLFILE"                                                     #
$O.IHTMLDocument2_write($S)                                                         #
#                                                                                   -----------------------------------
$O.getElementsByTagName('DIV') | % { $_.ID }                                        # retrieve DIV IDs
#                                                                                   -----------------------------------
# ********** END OF FILE **********************************************************************************************