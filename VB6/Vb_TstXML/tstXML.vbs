Option Explicit

' Membres
Dim myGui   ' Gui object
Dim myFle   ' Patch file object
Dim myReg   ' Registry tools
Dim myPth   ' Path of the script

' Path of the package
myPth = WScript.ScriptFullName
myPth = Left(myPth,Len(myPth)-Len(WScript.ScriptName))
myPth = myPth & "Package_20_23"

' Installation of the pckage
If Initialize Then
	If InstallPackage(myPth) Then 
		MsgBox "Installation complete"
	Else
		MsgBox "Installation complete"
	End If
End If
   


' Script Initialization
'______________________________________________________________________________________________________________________
Function Initialize()
   Dim sMsg
   
   ' Return value initialization
   Initialize = True

   ' Error handler initialization
   On Error Resume Next

   ' Gui Initialization
   sMsg = "User interface tool instanciation "
   Set myGui = New CGui       
   If Err.Number=0 Then
      myGui.WriteTitle "Patch file installation "
      myGui.WriteTitleSection "Script initialization"
      myGui.WriteStep sMsg, ""
   Else
      MsgBox sMsg & Err.Description& "/" & Err.Source & "/" & Err.Number
      Initialize = False
      Err.Clear
      Exit Function
   End If

   ' Registry tool initialization
   sMsg = "Registry tool instanciation "
   Set myReg=New CReg
   If Err.Number=0 Then
      myGui.WriteStep sMsg, ""
   Else
      myGui.WriteStep sMsg, Err.Description
      MsgBox sMsg & Err.Description & "/" & Err.Source & "/" & Err.Number 
      Initialize = False
      Err.Clear
      Exit Function
   End If

   ' Patch file tool initialization
   sMsg = "Patch file tool instanciation "
   Set myFle = New CXmlFile
   If Err.Number=0 Then
      myGui.WriteStep sMsg, ""   
   Else
      myGui.WriteStep sMsg, Err.Description
      MsgBox sMsg & Err.Description & "/" & Err.Source & "/" & Err.Number
      Initialize = False
      Err.Clear
      Exit Function
   End If
  
End Function



' Validation of the package intallation
'______________________________________________________________________________________________________________________
Function InstallPackage(sPath)
   Dim sMsg    ' Message string
   Dim nMjv    ' Major version value
   Dim nLmj    ' Last major version value 
   Dim oFso    ' File system object
   Dim oRte    ' Root folder
   Dim oFld    ' Folder object

   ' Return value initialization
   InstallPackage = True
   
   ' Gui start of sequence
   myGui.WriteTitleSection "Package installation " & sPath

   ' Error handler initialization
   On Error Resume Next:

   ' Package file loading 
   sMsg = "Package file Loading "
   myFle.LoadPackageFile sPath
   If Err.Number=0 Then
      myGui.WriteStep sMsg, ""
   Else
      myGui.WriteStep sMsg, Err.Description & "/" & Err.Number
      InstallPackage = False
      Err.Clear
      Exit Function
   End If

   ' Major version check
   sMsg = "Major version check "
   nMjv = myFle.MajorVersion
   nLmj = myReg.LastMajorVersion
   If nLmj<=nMjv Then 
      myGui.WriteStep sMsg, ""
   Else
      myGui.WriteStep sMsg, "Package major version to old"
      InstallPackage = False
   End If
   If Not Err.Number=0 Then 
      myGui.WriteStep sMsg, Err.Description & "/" & Err.Number
      InstallPackage = False
      Err.Clear
      Exit Function
   End If

   ' Patchs installation
	sMsg = "Patchs installation "
   Set oFso = CreateObject("Scripting.FileSystemObject")
   Set oRte = oFso.GetFolder(sPath)
	If Err.Number=0 Then
		myGui.WriteStep sMsg, ""
	   For Each oFld In oRte.SubFolders
			InstallPatch(oFld.Path)
		Next
	Else
		myGui.WriteStep sMsg, Err.Description & "/" & Err.Number
      InstallPackage = False
      Err.Clear
      Exit Function
	End If

End Function



' Validation of the Patch intallation
'______________________________________________________________________________________________________________________
Function InstallPatch(sPath)
   Dim oShl    ' Shell object
	Dim sMsg		' Message string

   ' Return value initialization
   InstallPatch = True

   ' Gui start of sequence
   myGui.WriteTitleSection "Patch installation " & sPath

	' Error handler initialization
   On Error Resume Next
  
   ' Patch file loading 
   sMsg = "Patch file Loading "
	myGui.WriteStep sMsg, ""
   myFle.LoadPatchFile sPath
   If Err.Number=0 Then
      myGui.WriteStep sMsg, ""
   Else
      myGui.WriteStep sMsg, Err.Description & "/" & Err.Number
      InstallPatch = False
      Err.Clear
      Exit Function
   End If

   ' Patch key check
	sMsg = "Check presence of the patch"
   If myReg.KeyExist(myFle.PatchKey) Then
      myGui.WriteStep sMsg, "The patch is already installed"
		InstallPatch=False
		Exit Function
   Else
      myGui.WriteStep sMsg, ""
   End If

   ' Patch installation
   Set oShl = CreateObject("WScript.Shell")
   sMsg = "Patch installation"
   oShl.Run myFle.PatchCommand   
   If Err.Number=0 Then
      myGui.WriteStep sMsg, ""
   Else
      myGui.WriteStep sMsg, Err.Description & "/" & Err.Number
      InstallPatch = False
      Err.Clear
      Exit Function
   End If

End Function





'//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
'
' Registry tools
'
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Class CReg

   ' Contstants
   Public Property Get KEY_LMV : KEY_LMV = "HKEY_LOCAL_MACHINE\Software\ICRC\LastMJV"	: End Property ' Last major version key

   ' Finding the last major version installed in the machine
   '___________________________________________________________________________________________________________________
   Public Property Get LastMajorVersion()   
   	LastMajorVersion = CInt(ReadKey(KEY_LMV))
   End Property

   ' Check the presence of then key
   '___________________________________________________________________________________________________________________
   Public Function CheckKey(sKey) 
      On Error Resume Next
      ReadKey sKey
      If Err.Number = 0 Then
         CheckKey=True
      Else
         CheckKey=False
         Err.Clear
      End If
   End Function



   '§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§



   ' Key text reading
   Private Function ReadKey(skey)
      Dim oShl
	   Set oShl = WScript.CreateObject("WScript.Shell")
      ReadKey = oShl.RegRead(sKey)
	   Set oShl=Nothing
   End Function

   ' Instance initialisation
	Private Sub Class_Initialize()
   End Sub

   ' Instance deletion
   Private Sub Class_Terminate
   End Sub

End Class





'//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
'
' Patch file tools
'
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Class CXmlFile

   ' Constant
   Public Property Get TAG_MJV : TAG_MJV = "MJV"         : End Property  ' Tag de la major version
   Public Property Get TAG_MNV : TAG_MNV = "MNV"         : End Property  ' Tag de la minor version
   Public Property Get TAG_CMD : TAG_CMD = "CMD"         : End Property  ' Tag de la ligne de commande
   Public Property Get TAG_KEY : TAG_KEY = "KEY"         : End Property  ' Tag of the key
   Public Property Get TAG_KEQ : TAG_KEQ = "KEQ"         : End Property  ' Tag de l'équivalence d'une clef
   Public Property Get TAG_KNE : TAG_KNE = "KNE"         : End Property  ' Tag de la non équivalence d'une clef
   Public Property Get FNM_PTC : FNM_PTC = "Patch.xml"   : End Property  ' Patch file name
   Public Property Get FNM_PKG : FNM_PKG = "Package.xml" : End Property  ' Package file name

   ' Members
   Private myPtD  ' Xml documnet for Patch file
   Private myPkD  ' Xml document for package file
   Private myNde	' Xml Node object

   ' loading of the patch file
   '___________________________________________________________________________________________________________________
   Public Sub LoadPatchFile(sPath)
      Set myPtD = LoadFile(sPath, FNM_PTC)
   End Sub

   ' loading of the package file
   '___________________________________________________________________________________________________________________
   Public Sub LoadPackageFile(sPath)
      Set myPkD = LoadFile(sPath, FNM_PKG)
   End Sub
   
   ' Extract the major version of the package file
   '___________________________________________________________________________________________________________________
   Public Property Get MajorVersion()
      Set myNde = myPkD.documentElement
	   NodeSelectFirst(TAG_MJV)
      MajorVersion = NodeGetValue()
   End Property
   
   ' Extract the command of the patch file
   '___________________________________________________________________________________________________________________
   Public Property Get PatchCommand()
      Set myNde = myPtD.documentElement
	   NodeSelectFirst(TAG_CMD)
      PatchCommand = NodeGetText()
   End Property

   ' Extract the key of the patch file
   '___________________________________________________________________________________________________________________
   Public Property Get PatchKey()
      Set myNde = myPtD.documentElement
	   NodeSelectFirst(TAG_KEY)
      PatchKey = NodeGetText()
   End Property


'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§



   ' Opening of the patch file 
   Public Function LoadFile(sPath, sFile)
      Dim oFso
      Dim oDoc
      
      Set oFso = CreateObject("Scripting.FileSystemObject")
      Set oDoc = CreateObject("Msxml2.DOMDocument.3.0")
   	oDoc.async = False
      oDoc.resolveExternals = False
      If Not Right(sPath, 1)="\" Then sPath = sPath & "\"
      oDoc.Load sPath & sFile

      Set LoadFile = oDoc
   	Set oFso = Nothing
   End Function

   ' Selection of the firs child of myNde by tag
   Private Sub NodeSelectFirst(sTag)
   	Dim oNds'
	   On Error Resume Next
   	Set oNds = myNde.getElementsByTagName(sTag)
   	Set myNde = oNds.Item(0)
   	Set oNds = Nothing
   End Sub
   
   ' Extract text of myNde
   Private Function NodeGetText()
   	NodeGetText = myNde.Text
   End Function

   ' Extract int value of myNde
   Private Function NodeGetValue()
   	NodeGetValue = CInt(NodeGetText)
   End Function
   
   ' Instance initialisation
   'Private Sub Class_Initialize()
   'End Sub

   ' Instance deletion
   'Private Sub Class_Terminate
   'End Sub

End Class
   

   


'//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
'
' User iterface tools
'
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Class CGui

	' HTML tags
	Public Property Get HTG_ZNU : HTG_ZNU = "zoneUp"        : End Property
	Public Property Get HTG_ZNL : HTG_ZNL = "ZoneLeft"      : End Property
	Public Property Get HTG_ZNC : HTG_ZNC = "ZoneCenter"    : End Property
	Public Property Get HTG_ZNR : HTG_ZNR = "ZoneRight"     : End Property
	Public Property Get HTG_ZND : HTG_ZND = "ZoneDown"      : End Property
 	Public Property Get HTG_TBL : HTG_TBL = "tableMain"     : End Property

	' Membres
	Dim myIea	' Internet explorer application
	Dim myHdc	' Html document
	Dim myHst	' Html string
	Dim myMdU	' Mode of the up zone
	Dim myMdL	' Mode of the left zone
	Dim myMdC	' Mode of the center zone
	Dim myMdR	' Mode of the right zone
	Dim myMdD	' Mode of the down zone



	' Clear the selected zone
	'__________________________________________________________________________________________________________________
	Public Sub ClearZone(sZone)
		InitZone sZone, ""
	End Sub

	' Write the title of the document
	'__________________________________________________________________________________________________________________
	Public Sub WriteTitle(sTitle)
		InitZone HTG_ZNU, "<H1>" & sTitle & "</H1>"
	End Sub

	' Write the title of a section
	'__________________________________________________________________________________________________________________
	Public Sub WriteTitleSection(sSectionTitle)
		WriteZone HTG_ZNC, "<HR><H2>" & sSectionTitle & "</H2>"
	End Sub

   ' Write an installation step
	'__________________________________________________________________________________________________________________
	Public Sub WriteStep(sDescript, sError)	
		If sError="" Then
			WriteZone HTG_ZNC, sDescript & " <FONT color=""#006400""><B> - Passed</B></FONT><BR>"
		Else
			WriteZone HTG_ZNC, sDescript & " <FONT color=""#A52A2A""><B> - Failed</B></FONT>: " & sError & "<BR>"
		End if
	End Sub



	'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§



   ' Initalization of the selected zone
   Private Sub InitZone(sZone, sHtml)
      On Error Resume Next
      myHdc.All.Item(sZone).innerHTML = sHtml
      If Not Err.Number=0 Then MsgBox "Output Error" & "/" & Err.Number & "/" & Err.Description
      Err.Clear
   End Sub

   ' Writing of the selected zone
   Private Sub WriteZone(sZone, sHtml)
      On Error Resume Next
      myHdc.All.Item(sZone).insertAdjacentHTML "BeforeEnd", sHtml
      If Not Err.Number=0 Then MsgBox "Output Error" & "/" & Err.Number & "/" & Err.Description
      Err.Clear
   End Sub

	' Instance initialisation
	Private Sub Class_Initialize()
		
		' IE initialisation
		Set myIea = WScript.CreateObject("InternetExplorer.Application")
		myIea.Navigate2 "about:blank", 12
		while myIea.Busy
		Wend
		myIea.AddressBar  = False
		myIea.MenuBar     = False
		myIea.StatusBar   = False
		myIea.ToolBar     = False 
		myIea.Offline     = True
		myIea.TheaterMode = False
		myIea.Silent      = False 
		myIea.FullScreen  = False
		myIea.Height      = 700 
		myIea.Left        = 50
		myIea.Top         = 10 
		myIea.Width       = 700 
		myIea.Resizable   = False
		myIea.Visible     = True 
		Set myHdc = myIea.Document
	
		' Page Initialisation 
		myHdc.WriteLn "<HTML>																               "
		myHdc.WriteLn "  <HEAD>																               "
		myHdc.WriteLn "    <TITLE> Install patch </TITLE>									         "
		myHdc.WriteLn "  </HEAD>															               "
		myHdc.WriteLn "  <BODY>																               "
		myHdc.WriteLn "    <CENTER>															            "
		myHdc.WriteLn "      <TABLE rows=""3"" cols=""1"" border=""0"" >					      "
		myHdc.WriteLn "        <TR><TD id=""" & HTG_ZNU & """ align=""center""> </TD></TR>	"
		myHdc.WriteLn "        <TR><TD><TABLE rows""1"" cols""3""><TR>				            "
		myHdc.WriteLn "          <TD id=""" & HTG_ZNL & """ align=""left"" /> 			      "
		myHdc.WriteLn "          <TD id=""" & HTG_ZNC & """ align=""Left"" nowrap />        "
		myHdc.WriteLn "          <TD id=""" & HTG_ZNR & """ align=""left"" />			      "
		myHdc.WriteLn "	     </TR></TABLE></TD></TR>										         "
		myHdc.WriteLn "        <TR><TD id=""" & HTG_ZND & """ align=""left"" > </TD></TR>	"
		myHdc.WriteLn "      </TABLE>														               "
		myHdc.WriteLn "    </CENTER>														               "
		myHdc.WriteLn "  </BODY>															               "
		myHdc.WriteLn "</HTML>					                                                "

	End Sub

	' Destruction of the instance
	Private Sub Class_Terminate
		'myIea.Quit
		'Set myHdc = Nothing
		'Set myIea = Nothing	
	End Sub

End Class
