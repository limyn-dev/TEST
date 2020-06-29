VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CXmlFile"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

   ' Constant
   Const FNM_PCH = "Patch.xml"   ' Patch file name
   Const FNM_PKG = "Package.xml" ' Package file name
   Const TAG_PKG = "PACKAGE"     ' Package file root tag of the
   Const TAG_PCH = "PATCH"       ' Patch file root tag
   Const TAG_MJV = "MJV"         ' Major version tag
   Const TAG_MNV = "MNV"         ' Minor version tag
   Const TAG_CMD = "CMD"         ' Command line tag
   Const TAG_KEY = "KEY"         ' Key tag
   
   ' Members
   Private myPtD As DOMDocument     ' Xml documnet for Patch file
   Private myPkD As DOMDocument     ' Xml document for package file
   Private myNde As IXMLDOMElement  ' Xml Node object

   ' loading of the patch file
   '___________________________________________________________________________________________________________________
   Public Sub LoadPatchFile(sPath)
      Set myPtD = LoadFile(sPath, FNM_PCH)
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
      NodeSelectFirst (TAG_MJV)
      MajorVersion = NodeGetValue()
   End Property

   ' Extract the command of the patch file
   '___________________________________________________________________________________________________________________
   Public Property Get PatchCommand()
      Set myNde = myPtD.documentElement
      NodeSelectFirst (TAG_CMD)
      PatchCommand = NodeGetText()
   End Property

   ' Extract the key of the patch file
   '___________________________________________________________________________________________________________________
   Public Property Get PatchKey()
      Set myNde = myPtD.documentElement
      NodeSelectFirst (TAG_KEY)
      PatchKey = NodeGetText()
   End Property

   ' Creation of the patch file
   '___________________________________________________________________________________________________________________
   Public Sub CreatePatchFile(oPatch As CPatch, sPath As String)
      Dim oDoc As New DOMDocument
      Dim sXml As String
      
      ' Document creation
      With oPatch
         sXml = sXml & "<?xml version=""1.0"" ?>                              "
         sXml = sXml & "<" & TAG_PCH & ">                                     "
         sXml = sXml & "  <" & TAG_KEY & ">" & .Key & "</" & TAG_KEY & ">     "
         sXml = sXml & "  <" & TAG_CMD & ">" & .Command & "</" & TAG_CMD & "> "
         sXml = sXml & "</" & TAG_PCH & ">                                    "
      End With

      ' File creation
      With oDoc
         .loadXML sXml
         .save sPath
      End With
      
   End Sub

   ' Creation of the package file
   '___________________________________________________________________________________________________________________
   Public Sub CreatePackageFile(oPackage As CPackage, sPath As String)
      Dim oDoc As New DOMDocument
      Dim sXml As String
      
     ' Document creation
      With oPackage
         sXml = sXml & "<?xml version=""1.0"" ?>                                    "
         sXml = sXml & "<" & TAG_PKG & ">                                           "
         sXml = sXml & "  <" & TAG_MJV & ">" & .MajorVersion & "</" & TAG_MJV & ">  "
         sXml = sXml & "  <" & TAG_MNV & ">" & .MinorVersion & "</" & TAG_MNV & ">  "
         sXml = sXml & "</" & TAG_PKG & ">                                          "
      End With

      ' File creation
      With oDoc
         .Text = sXml
         .save sPath
      End With
      
   End Sub
   
   
   
'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§



   ' Opening of the patch file
   Public Function LoadFile(sPath, sFile)
      'Dim oFso
      Dim oDoc
      
      'Set oFso = CreateObject("Scripting.FileSystemObject")
      Set oDoc = CreateObject("Msxml2.DOMDocument.3.0")
      oDoc.async = False
      oDoc.resolveExternals = False
      If Not Right(sPath, 1) = "\" Then sPath = sPath & "\"
      oDoc.Load sPath & sFile

      Set LoadFile = oDoc
      'Set oFso = Nothing
   End Function

   ' Selection of the firs child of myNde by tag
   Private Sub NodeSelectFirst(sTag)
      Dim oNds '
      On Error Resume Next
      Set oNds = myNde.getElementsByTagName(sTag)
      Set myNde = oNds.Item(0)
      Set oNds = Nothing
   End Sub
   
   ' Extract text of myNde
   Private Function NodeGetText()
      NodeGetText = myNde.Text
   End Function

   ' Extract text of myNde
   Private Sub NodeSetText(sText)
      myNde.Text = sText
   End Sub

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

