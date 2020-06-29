#region *** LOAD ASSEMBLIES   ***
[void][reflection.assembly]::LoadWithPartialName("System.Windows.Forms")
[void][reflection.assembly]::Load("System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a")
[void][reflection.assembly]::Load("System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
[void][reflection.assembly]::Load("System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
[void][reflection.assembly]::Load("System.Xml, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
[void][reflection.assembly]::Load("System.DirectoryServices, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a")
[void][reflection.assembly]::Load("System.Core, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
#endregion
# ---------------------------------------------------------------------------------------------------------------------
#region *** GLOBALS           ***
[hashtable] $script:HEL = @{}
#endregion
# ---------------------------------------------------------------------------------------------------------------------
#region *** DOC CHECK         ***
function ElmCheck {
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [object] $E = $null
   [string] $S = ""
   #                                                                                -----------------------------------
   '*****************************************************************' | OUT-HOST   #
   ' START DOCUMENT                                                  ' | OUT-HOST   #
   '*****************************************************************' | OUT-HOST   #
   #                                                                                -----------------------------------
   $oWBS.Document.All | %     {                                                     #
      $E = $_                                                                       #
      switch ($E.TagName.ToUpper())  {                                              #
         'FORM'      { $S="FORM     :"              }                               #
         'DIV'       { $S="DIV      :"              }                               #
         'TABLE'     { $S="TABLE    :"              }                               #
         'TBODY'     { $S="TBODY    :"              }                               #
         'TR'        { $S="TR       :"              }                               #
         'TH'        { $S="TH       :"              }                               #
         'TD'        { $S="TD       :"              }                               #
         'IMG'       { $S="IMG      :"              }                               #
         'INPUT'     { $S="INPUT    :"              }                               #
         'TEXTAREA'  { $S="TEXTAREA :"              }                               #
         'BUTTON'    { $S="BUTTON   :"              }                               #
         default     { $S="ELEMENT [$($E.TagName)]" }                               #
      }                                                                             #
      #$S += " Enabled[$($E.Enabled)]"
      #$S += " Id[$($E.Id)]"
      #$S += " Name[$($E.Name)]"
      #$S += " OffsetParent[$($E.OffsetParent)]"
      $S += " OffsetRectangle[$($E.OffsetRectangle)]"
      #$S += " ClientRectangle[$($E.ClientRectangle)]"
      $S | OUT-HOST                                                                 #
   }                                                                                #
   #                                                                                -----------------------------------
   '*****************************************************************' | OUT-HOST   #
   ' END DOCUMENT                                                    ' | OUT-HOST   #
   '*****************************************************************' | OUT-HOST   #
   #                                                                                -----------------------------------   
}
function ElmLoad {
   param ( [object]    $oElement = $null 
         , [hashtable] $oList    = @{}   )
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string] $I = ""                                                                 #
   #                                                                                -----------------------------------
   if (!($oElement.Id -like "")) {                                                  #
      $I = "$($oElement.TagName)[$($oElement.Id)]"                                  #
      "Add element [$I]"  | OUT-HOST                                                #
      $oList.Add($I, $oElement)                                                     #      
   }                                                                                #
   #                                                                                -----------------------------------
   $oElement.Children | % { ElmLoad $_ $oList }                                     #
   #                                                                                -----------------------------------
}
function ElmLoad2 {
   param ( [string]    $sId      = ""
         , [object]    $oElement = $null 
         , [hashtable] $oList    = @{}   )
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [long]      $I = 0                                                               #
   [hashtable] $L = @{}                                                             #
   [int]       $X = 0
   [int]       $Y = 0
   #                                                                                -----------------------------------
   #"Add element [$($oElement.TagName)][$sId]"  | OUT-HOST                           # Add element to list
   #$oList.Add($sId, $oElement)                                                      #      
   #                                                                                -----------------------------------
   if ($oElement.InnerTEXT) {                                                       # Display value
      if ($oElement.InnerTEXT.Length -eq $oElement.InnerHTML.Length) {              #
         "Element content [$($oElement.InnerTEXT)]" | OUT-HOST                      #
      }                                                                             #
   }                                                                                #
   #                                                                                -----------------------------------
   $oElement.Children | % {                                                         # Load children
      $X = $_.OffsetRectangle.X                                                     #
      $Y = $_.OffsetRectangle.Y                                                     #
      $I = $X*1000000 + $Y*1000                                                     #
      while ($L.Contains($I)) {$I++}
      #"   FOUND [$($oElement.TagName)][$X][$Y][$I]" | OUT-HOST                      #
      $L.Add($I, $_)                                                                #
   }                                                                                #
   #                                                                                -----------------------------------   
   $I = 0                                                                           # Add sorted children to list
   $L.GetEnumerator() | sort -Property Name | % {                                   #
      $I++                                                                          #
      ElmLoad2 "$sId.$I" $_.Value $oList                                            #
   }                                                                                #
   #                                                                                -----------------------------------
}
#endregion
# ---------------------------------------------------------------------------------------------------------------------
#region *** EVENTS HANDLERS   ***
function FRM_ON_LOAD { 
   #$oWBS.navigate("https://bcc.bechtle.com") 
   #$oWBS.navigate("http://www.google.com") 
   #$oWBS.navigate("file:///C:/_GITHUB/PS1/TEST-WebBrowser/TestForm.html")
   $oWBS.navigate("https://collab.ext.icrc.org/sites/PWA/default.aspx")
}
function WBS_ON_DOCCOMPLITED {
   $script:HEL = @{}
   ElmLoad2 "0" $oWBS.Document.Body $script:HEL
}
#endregion
# ---------------------------------------------------------------------------------------------------------------------
#region *** BUILD FORM        ***
#                                                                                   -----------------------------------
$oFRM = New-Object 'System.Windows.Forms.Form'                                      # Build form1
$oFRM.Name = "form1"                                                                #
$oFRM.ClientSize = '1024, 768'                                                      #
$oFRM.StartPosition = 'CenterScreen'                                                #
$oFRM.Text = "Form"                                                                 #
$oFRM.add_Load({FRM_ON_LOAD})                                                       #
#                                                                                   -----------------------------------
$oWBS = New-Object 'System.Windows.Forms.WebBrowser'                                # Build webbroser
$oWBS.Name = "oWBS"                                                                 #
$oWBS.TabIndex = 1                                                                  #
$oWBS.Dock = "Fill"                                                                 #
$oWBS.Add_DocumentCompleted({WBS_ON_DOCCOMPLITED})                                  #
$oFRM.Controls.Add($oWBS)                                                           #
#                                                                                   -----------------------------------
#endregion
# ---------------------------------------------------------------------------------------------------------------------
#region *** ENTRY POINT       ***
$oFRM.ShowDialog()
#endregion