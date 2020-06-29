
function FctA {
   param(
      [Parameter( Mandatory         = $true
                , Position          = 0
                , ParameterType     = [System.String]
                , HelpMessage       ="Parameter P1")] $P1 = ""
   )
   "Inside FctA" | OUT-HOST
}
function FctB {
   "Inside FctB" | OUT-HOST
}
function FctC {
   "Inside FctC" | OUT-HOST
}


$F = GI function:\FctA
"CmdletBinding       [$($F.CmdletBinding)]" | OUT-HOST
"CommandType         [$($F.CommandType)]" | OUT-HOST
"DefaultParameterSet [$($F.DefaultParameterSet)]" | OUT-HOST
"Definition          [$($F.Definition)]" | OUT-HOST
"Description         [$($F.Description)]" | OUT-HOST
"HelpFile            [$($F.HelpFile)]" | OUT-HOST
"Module              [$($F.Module)]" | OUT-HOST
"ModuleName          [$($F.ModuleName)]" | OUT-HOST
"Name                [$($F.Name)]" | OUT-HOST
"Noun                [$($F.Noun)]" | OUT-HOST
"Options             [$($F.Options)]" | OUT-HOST
"OutputType          [$($F.OutputType)]" | OUT-HOST
"Parameters          [$($F.Parameters)]" | OUT-HOST
$F.ParameterSets | % { $_ | OUT-HOST }
"RemotingCapability  [$($F.RemotingCapability)]" | OUT-HOST
"ScriptBlock         [$($F.ScriptBlock)]" | OUT-HOST
"Verb                [$($F.Verb)]" | OUT-HOST
"Visibility          [$($F.Visibility)]" | OUT-HOST
"HelpUri             [$($F.HelpUri)]" | OUT-HOST