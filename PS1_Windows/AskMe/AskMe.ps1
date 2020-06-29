#
#
# ********** GLOBALS **************************************************************************************************
#
#                                                                                   -----------------------------------
[string]    $script:sPth = ""                                                       # 
[string]    $script:sFle = ""                                                       # 
[string]    $script:sSfd = "Sound"                                                  # 
[hashtable] $script:aQst = @{}                                                      # Questions table
[hashtable] $script:aAsr = @{}                                                      # Answers table
[hashtable] $script:aTpe = @{}                                                      # Answers table
[hashtable] $script:aCur = @{}                                                      # Current table
[hashtable] $script:aVld = @{}                                                      # Valid counter table
[hashtable] $script:aErr = @{}                                                      # Error counter tble
[int]       $script:nRty = 2                                                        # Retry initial value
[int]       $script:nSst = 0                                                        # Retry initial value
#                                                                                   -----------------------------------
#
# ********** FUNCTIONS ************************************************************************************************
#
#
function SoundPlay      {
   param ([string] $sFile = "")
   #                                                                                -----------------------------------
   [string]            $F = "$($script:sPth)\$($script:sSfd)\$sFile"                #
   [Media.SoundPlayer] $P = NEW-OBJECT Media.SoundPlayer ($F)                       #
   #                                                                                -----------------------------------   
   $P.PlaySync()                                                                    #
   #                                                                                -----------------------------------   
}
function GuidGet        {
   [string[]] $aGid = @()                                                           #
   [int]      $nGid = 0                                                             #
   #                                                                                -----------------------------------               
   $aGid = [string[]]$script:aCur.Keys                                              #
   $nGid = GET-RANDOM -Maximum ($aGid.Count)                                        #
   #                                                                                -----------------------------------            
   return $aGid[$nGid]                                                              #
}
function CounterDisplay {
   param ([string] $sGid = "")
   #                                                                                -----------------------------------
   CLS                                                                              #
   WRITE-HOST ""                                                                    #
   WRITE-HOST "Total restant : $($script:aCur.Keys.Count)"                          #
   WRITE-HOST "Courant Juste : $($script:aVld[$sGid])"                              #
   WRITE-HOST "Courant Faux  : $($script:aErr[$sGid])"                              #
   WRITE-HOST ("-" * 80)                                                            #
   WRITE-HOST ""                                                                    #
   #                                                                                -----------------------------------   
}
function ResponceValide {
   param ([string] $sGid = "")
   #                                                                                -----------------------------------
   SoundPlay "_OK.wav"                                                              #
   WRITE-HOST "OK"                                                                  #
   $script:aVld[$sGid] ++                                                           #
   #                                                                                -----------------------------------
   if (($script:aVld[$sGid]-$script:aErr[$sGid]) -eq $script:nRty) {                #
      $script:aCur.Remove($sGid)                                                    #
   }                                                                                #
   #                                                                                -----------------------------------   
}
function ResponceError  {
   param ( [string] $sGid ="")                                                      #
   #                                                                                -----------------------------------   
   SoundPlay "_ERROR.wav"                                                           #
   WRITE-HOST "ERREUR! La bonne réponse est: $($script:aAsr[$sGid])"                #
   READ-HOST "Press enter to continue"                                              #
   $script:aErr[$sGid] ++                                                           #
   #                                                                                -----------------------------------   
}
function FileGet        {
   
   [string[]] $aFle = @()
   [int]      $nFle = 0
   [string]   $sFle = ""
   
   $aFle = [string[]](GET-CHILDITEM "$($script:sPth)\Data")
   
   do {
      CLS
      for ($nFle=0; $nFle -lt $aFle.Count; $nFle++) {
         WRITE-HOST "[$nFle] $($aFle[$nFle])"
      }
      $nFle = [int](READ-HOST "File")
      if ($nFle -lt $aFle.Count -and -not($nFle -lt 0)) { $sFle = $aFle[$nFle] }
   } while ($sFle -like "")
   
   $script:sFle = "$($script:sPth)\Data\$sFle"
}
function Load           {
   param( [string] $bDirect = $true )
   #                                                                                -----------------------------------
   [string] $sAsr = ""                                                              #    
   [string] $sQst = ""                                                              #    
   [string] $sGid = ""                                                              #    
   [string] $sFle = ""                                                              #    
   #                                                                                -----------------------------------
   FileGet                                                                          # Get file
   WRITE-HOST "Open file [$($script:sFle)]"                                         #
   [XML] $oXdc = [XML](GET-CONTENT $script:sFle)                                    #
   #                                                                                -----------------------------------   
   $script:aQst = @{}                                                               # Reset table
   $script:aAsr = @{}                                                               #    
   #                                                                                -----------------------------------   
   WRITE-HOST "Load tables"                                                         #    
   $oXdc.A.I | foreach {                                                            #    
      if ($bDirect) {                                                               #    
         $sAsr = $_.A                                                               #    
         $sQst = $_.Q.InnerText                                                               #    
      }                                                                             #    
      else          {                                                               #    
         $sAsr = $_.Q.InnerText                                                               #    
         $sQst = $_.A                                                               #    
      }                                                                             #    
      WRITE-HOST "Add [$sAsr]=[$sQst]"                                              #    
      $sGid = [guid]::NewGuid()                                                     #    
      $script:aQst += @{ $sGid=$sQst         }                                      #    
      $script:aAsr += @{ $sGid=$sAsr         }                                      #    
      $script:aTpe += @{ $sGid=$_.Q.Type     }                                      #    
   }                                                                                #    
   #                                                                                -----------------------------------   
}
function CounterLoad    {
   #                                                                                -----------------------------------      
   [string] $sGid = ""                                                              #
   #                                                                                -----------------------------------         
   $script:aCur = @{}                                                               # Load counter table
   $script:aVld = @{}                                                               # Load counter table
   $script:aErr = @{}                                                               # Load counter table
   #                                                                                -----------------------------------            
   $script:aAsr.Keys | foreach {                                                    #
      $sGid = $_                                                                    #
      $script:aCur += @{ $sGid=0 }                                                  #
      $script:aVld += @{ $sGid=0 }                                                  #
      $script:aErr += @{ $sGid=0 }                                                  #
   }                                                                                #
   #                                                                                -----------------------------------         
   if ($script:nSst -eq 0) { return }                                               #
   #                                                                                -----------------------------------            
   while ($script:aCur.Count -gt $script:nSst) {                                    # remove over count items
      [string[]] $aGid = $script:aCur.Keys                                          #
      [int]      $nGid = GET-RANDOM -Maximum ($aGid.Count)                          #
      $script:aCur.Remove($aGid[$nGid])                                             #
      $script:aVld.Remove($aGid[$nGid])                                             #
      $script:aErr.Remove($aGid[$nGid])                                             #
   }                                                                                #
   #                                                                                -----------------------------------               
}
function SubSet         {
   #                                                                                -----------------------------------   
   $nSze = READ-HOST "Nombre de question"                                           #
   $script:nSst = $nSze                                                             #
   #                                                                                -----------------------------------   
}
function AskUser        {
   param ( [string] $sQuestion = ""
         , [string] $sType     = ""
         )   
   #                                                                                -----------------------------------
   [string] $A = ""                                                                 #
   #                                                                                -----------------------------------   
   switch ($sType) {                                                                #
      "SOUND" {                                                                     #
         do {                                                                       #
            SoundPlay $sQuestion                                                    #
            $A = READ-HOST "   Réponse (? nouvelle ecoute)"                         #
         } while ($A -eq "?")                                                       #
      }                                                                             #
      default {                                                                     #
         $A = READ-HOST "   $sQuestion"                                             #
      }                                                                             #
   }                                                                                #
   #                                                                                -----------------------------------
   return $A                                                                        #
}
function QcmMenu        {
   #                                                                                -----------------------------------
   [Collections.ArrayList]  $aGid = $null                                           #
   [int]                    $nGid = 0                                               #
   [string]                 $sGid = ""                                              #
   [int]                    $nCho = 0                                               #
   #                                                                                -----------------------------------
   $aGid = NEW-OBJECT Collections.ArrayList $script:aCur.Keys                       # Build GUID table
   while ($aGid.Count -gt 4) {                                                      #
      $nGid = GET-RANDOM -Maximum ($aGid.Count)                                     #
      $aGid.Remove($aGid[$nGid])                                                    #
   }                                                                                #
   #                                                                                -----------------------------------   
   $nGid = GET-RANDOM -Maximum ($aGid.Count)                                        # Select Question
   $sGid = $aGid[$nGid]                                                             #
   #                                                                                -----------------------------------   
   CounterDisplay $sGid                                                             # Display answers list
   for ($nCho=0; $nCho -lt $aGid.Count; $nCho++) {                                  #
      WRITE-HOST "[$($nCho+1)] - $($script:aAsr[$aGid[$nCho]])"                     #
   }                                                                                #
   WRITE-HOST ""                                                                    #
   #                                                                                -----------------------------------   
   $nCho = [int](AskUser $script:aQst[$sGid] $script:aTpe[$sGid])                   #         
   #                                                                                -----------------------------------      
   if (($nCho-1) -eq $nGid) { ResponceValide $sGid }                                # Process result
   else                     { ResponceError $sGid  }                                #
   #                                                                                -----------------------------------   
}
function Qcm            {
   #                                                                                -----------------------------------   
   CounterLoad                                                                      #
   while ($script:aCur.Keys.Count -gt 1) { QcmMenu }                                #
   #                                                                                -----------------------------------      
}
function Questions      {
   #                                                                                -----------------------------------         
   [string]   $sGid = ""                                                            #
   [string]   $sAsr = ""                                                            #
   #                                                                                -----------------------------------         
   CounterLoad                                                                      #
   #                                                                                -----------------------------------            
   do {                                                                             #
      $sGid = GuidGet                                                               #
      CounterDisplay $sGid                                                          #
      WRITE-HOST ""                                                                 #
      WRITE-HOST ""                                                                 #      
      $sAsr = AskUser $script:aQst[$sGid] $script:aTpe[$sGid]                       #      
      if ($sAsr -like $script:aAsr[$sGid]) { ResponceValide $sGid  }                #
      else                                 { ResponceError $sGid   }                #
   } while ($script:aCur.Keys.Count)                                                #
   #                                                                                -----------------------------------      
}
function Menu           {
   #                                                                                -----------------------------------
   [string] $sChx = ""                                                              #
   #                                                                                -----------------------------------
   do {                                                                             #
      CLS                                                                           #
      WRITE-HOST ""                                                                 #
      WRITE-HOST " [A] - Charger un fichier de questions."                          #
      WRITE-HOST " [B] - Charger un fichier de questions inverses."                 #
      WRITE-HOST " [C] - Modification du nombre de questions."                      #
      WRITE-HOST " [D] - Entrainement Questions direct."                            #
      WRITE-HOST " [E] - Entrainement QCM."                                         #
      WRITE-HOST " [Q] - Quit."                                                     #
      $sChx = READ-HOST "Choix"                                                     #
      switch ($sChx.ToUpper()) {                                                    #
         "A"      { Load $true   }                                                  #
         "B"      { Load $false  }                                                  #
         "C"      { SubSet       }                                                  #
         "D"      { Questions    }                                                  #
         "E"      { Qcm          }                                                  #
         "Q"      {}                                                                #
         default  {}                                                                #
      }                                                                             #
   } until ($sChx -like "Q")                                                        #
   #                                                                                -----------------------------------      
}
#
#
# ********** ENTRY POINT **********************************************************************************************
#
#                                                                                   -----------------------------------
$script:sPth = $MyInvocation.MyCommand.Definition                                   # Set current script path
$script:sPth = Split-Path -Path $script:sPth -Parent                                #
PUSH-LOCATION                                                                       # Set script location
CD $script:sPth                                                                     #
#                                                                                   -----------------------------------
Menu                                                                                #
#                                                                                   -----------------------------------
POP-LOCATION                                                                       # Set script location
#                                                                                   -----------------------------------
#
# ********** EOF ******************************************************************************************************