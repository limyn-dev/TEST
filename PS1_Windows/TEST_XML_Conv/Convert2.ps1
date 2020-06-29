[string]   $P = SPLIT-PATH -Path $MyInvocation.MyCommand.Definition -Parent         # Current path         
[string[]] $O = @()                                                                 # Output content
[XML]      $X = [XML]"<R></R>"                                                      # Empthy XML document
#                                                                                   -----------------------------------
GET-CONTENT "$P\IN.xml" | % {                                                       # Process source document
   $X.R = [string]$_                                                                #    Convert current row
   $O += $X.GetElementsByTagName("R").innerxml                                      #    Add converted row to output
}                                                                                   #
#                                                                                   -----------------------------------
$O | OUT-FILE "$P\OUT2.txt"                                                         # Save output
#                                                                                   -----------------------------------
