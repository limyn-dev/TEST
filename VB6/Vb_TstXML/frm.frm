VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frm 
   Caption         =   "Form1"
   ClientHeight    =   8445
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7935
   LinkTopic       =   "Form1"
   ScaleHeight     =   8445
   ScaleWidth      =   7935
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   435
      Left            =   420
      TabIndex        =   1
      Top             =   7875
      Width           =   1800
   End
   Begin MSComctlLib.TreeView trv 
      Height          =   7470
      Left            =   210
      TabIndex        =   0
      Top             =   210
      Width           =   7575
      _ExtentX        =   13361
      _ExtentY        =   13176
      _Version        =   393217
      Style           =   7
      Appearance      =   1
   End
End
Attribute VB_Name = "frm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



Dim myPth As String
Dim myNde As Node
Dim myNdc As Integer





Private Sub Form_Load()
   Dim oDoc As New MSXML2.DOMDocument
  
   
   ' Chemin du fichier
   myPth = "C:\temp\books.xml"
   
   ' initialisation du trv
   With Me.trv.Nodes
      .Clear
      Set myNde = .Add(, , myPth, myPth)
   End With
   
End Sub



Private Sub Command1_Click()
   loadDoc
End Sub



Private Sub loadDoc()
   Dim oDoc As New MSXML2.DOMDocument
   Dim oNde As IXMLDOMNode
   Dim myErr As MSXML2.IXMLDOMParseError
   
   With oDoc
      .async = False
      .resolveExternals = False
      .Load myPth
      If (.parseError.errorCode <> 0) Then
         Set myErr = .parseError
         MsgBox ("You have error " & myErr.reason)
      Else
         For Each oNde In .childNodes
            loadChildsNode oNde
         Next
      End If
   End With
   
End Sub



Private Sub loadChildsNode(oNde As IXMLDOMNode)
   Dim oChl As IXMLDOMNode
   Dim oAtr As MSXML2.IXMLDOMAttribute
   Dim oTNd As Node: Set oTNd = myNde
   Dim sNme As String
   
   ' Ajout du noeud dans le treeview
   With oNde
   
      Select Case oNde.nodeType
         Case NODE_ATTRIBUTE:                sNme = "ATTRIBUTE: " & .nodeName & " " & .nodeValue
         Case NODE_CDATA_SECTION:            sNme = "CDATA_SECTION: " & .nodeName & " " & .nodeValue
         Case NODE_COMMENT:                  sNme = "COMMENT: " & .nodeName & " " & .nodeValue
         Case NODE_DOCUMENT:                 sNme = "DOCUMENT: " & .nodeName & " " & .nodeValue
         Case NODE_DOCUMENT_FRAGMENT:        sNme = "DOCUMENT_FRAGMENT: " & .nodeName & " " & .nodeValue
         Case NODE_DOCUMENT_TYPE:            sNme = "DOCUMENT_TYPE: " & .nodeName & " " & .nodeValue
         Case NODE_ELEMENT:                  sNme = "ELEMENT: " & .nodeName & " " & .nodeValue
         Case NODE_ENTITY:                   sNme = "ENTITY: " & .nodeName & " " & .nodeValue
         Case NODE_ENTITY_REFERENCE:         sNme = "ENTITY_REFERENCE: " & .nodeName & " " & .nodeValue
         Case NODE_INVALID:                  sNme = "INVALID: " & .nodeName & " " & .nodeValue
         Case NODE_NOTATION:                 sNme = "NOTATION: " & .nodeName & " " & .nodeValue
         Case NODE_PROCESSING_INSTRUCTION:   sNme = "PROCESSING_INSTRUCTION: " & .nodeName & " " & .nodeValue
         Case NODE_TEXT:                     sNme = "TEXT: " & .nodeName & " " & .nodeValue
      End Select
      
      If Not oNde.Attributes Is Nothing Then
         For Each oAtr In oNde.Attributes
            sNme = sNme & oAtr.Name & "=" & oAtr.Value
         Next
      End If
      
      Set myNde = Me.trv.Nodes.Add(myNde.Key, tvwChild, "Nd" & CStr(myNdc), sNme)
      myNdc = myNdc + 1
      
   End With
                        
   ' Ajout des enfants
   If oNde.childNodes.length > 0 Then
      For Each oChl In oNde.childNodes
         loadChildsNode oChl
      Next
   End If
   
   Set myNde = oTNd
End Sub
