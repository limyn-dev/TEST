[string]   $P = SPLIT-PATH -Path $MyInvocation.MyCommand.Definition -Parent         # Current path                    
[string[]] $O = @()                                                                 # Output strings tables
[string]   $S = ""                                                                  # Generic string
#                                                                                   -----------------------------------
GET-CONTENT "$P\IN.xml" | % {                                                       # Process source rowa
   $S = $_                                                                          #    Replace strings
   $S = $S.Replace("'", '&apos;')                                                   #
   $S = $S.Replace('"', '&quot;')                                                   #
   $S = $S.Replace('&', '&amp;')                                                    #
   $S = $S.Replace('<', '&lt;')                                                     #
   $S = $S.Replace('>', '&gt;')                                                     #
   $O += $S                                                                         #    Add row to output
}                                                                                   #
#                                                                                   -----------------------------------
$O | OUT-FILE "$P\OUT.txt"                                                          # Write out file
#                                                                                   -----------------------------------