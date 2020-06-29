VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmMain 
   Caption         =   "Circuits"
   ClientHeight    =   7440
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   9930
   LinkTopic       =   "Form1"
   ScaleHeight     =   7440
   ScaleWidth      =   9930
   StartUpPosition =   3  'Windows Default
   Begin RichTextLib.RichTextBox rtbMain 
      Height          =   6735
      Left            =   4200
      TabIndex        =   1
      Top             =   120
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   11880
      _Version        =   393217
      Appearance      =   0
      TextRTF         =   $"frmCircuits.frx":0000
   End
   Begin MSComctlLib.TreeView trvMain 
      Height          =   6735
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3975
      _ExtentX        =   7011
      _ExtentY        =   11880
      _Version        =   393217
      Style           =   7
      BorderStyle     =   1
      Appearance      =   0
   End
   Begin VB.Menu mnuCrt 
      Caption         =   "File"
      Begin VB.Menu mnuQuitter 
         Caption         =   "Quitter"
      End
   End
   Begin VB.Menu mnuClt 
      Caption         =   "Ajouter"
      Begin VB.Menu mnuAddClt 
         Caption         =   "Client"
      End
      Begin VB.Menu mnuAddOrg 
         Caption         =   "Organismes"
      End
      Begin VB.Menu mnuAddVle 
         Caption         =   "Ville"
      End
      Begin VB.Menu mnuAddCrt 
         Caption         =   "Circuit"
      End
      Begin VB.Menu mnuAddAcp 
         Caption         =   "Accompagnant"
      End
      Begin VB.Menu mnuAddEtp 
         Caption         =   "Etape"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "User interface pour la gestion des circuits. forme d'ouverture de l'application"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399EA0A90366"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
'User interface pour la gestion des circuits. forme d'ouverture de l'application
Option Explicit



' *****************************************************************************
' Gestion du l'affichage des valeurs
' *****************************************************************************



' Initialisation de la rtb
'------------------------------------------------------------------------------
Private Sub setRtb()
    With rtbCrt
        .Text = ""
    End With
End Sub

' Ecriture d'une ligne dans la rtb
'------------------------------------------------------------------------------
Private Sub clearTxt()
    rtbCrt.Text = ""
End Sub

' Ecriture d'une ligne dans la rtb
'------------------------------------------------------------------------------
Private Sub writeLne(lne As String)
    With rtbCrt
        .Text = .Text & lne & vbNewLine
    End With
End Sub

' Ecriture d'un circuit
'------------------------------------------------------------------------------
Private Sub writeCrt(crt As CCircuit)
Attribute writeCrt.VB_Description = " Ecriture\r\n------------------------------------------------------------------------------"
    clearTxt
    writeLne "Circuit: " & crt.Intitule
    writeLne "Prix   : " & crt.Prix
End Sub

' Ecriture d'un client
'------------------------------------------------------------------------------
Private Sub writeClt(clt As CClient)
    writeLne "Client: " & clt.nom & " " & clt.prenom & vbCr
End Sub

' Ecriture d'une etape
'------------------------------------------------------------------------------
Private Sub writeEtp(etp As CEtape)
    writeLne "Etape: " & etp.ville.nom
End Sub

' Ecriture d'une ville
'------------------------------------------------------------------------------
Private Sub writeVle(vle As CVille)
    writeLne "Ville: " & vle.nom
End Sub



'******************************************************************************
' Gestion du trv
'******************************************************************************



' Chargement des circuits depuis la db
'------------------------------------------------------------------------------
'##ModelId=39A39A0901C2
Private Sub setTrv()
    Dim crts As CCircuits
    Dim crt As CCircuit
    Dim etp As CEtape
    Dim pti As CClient
    Dim k_0 As String
    Dim k_1 As String
    Dim k_2 As String
    Dim txt As String
    
    Set crts = mdlMain.tblCrt.Circuits
    
    For Each crt In crts
        
        ' Ajout du circuit
        k_0 = toKey("", "crt", crt.Id)
        trvCrt.Nodes.Add , , k_0, crt.Intitule & " " & CStr(crt.Id)
        
        ' Ajout des étapes
        k_1 = toKey(k_0, "etp", 0)
        trvCrt.Nodes.Add k_0, tvwChild, k_1, "Etapes"
        For Each etp In crt.Etapes
            txt = etp.ville.nom
            trvCrt.Nodes.Add k_1, tvwChild, toKey(k_0, "etp", etp.Id), txt
        Next
        
        ' Ajout des participants
        k_1 = toKey(k_0, "pti", 0)
        trvCrt.Nodes.Add k_0, tvwChild, k_1, "Participants"
        For Each pti In crt.Participants
            txt = pti.prenom & " " & pti.nom
            trvCrt.Nodes.Add k_1, tvwChild, toKey(k_0, "pti", pti.Id), txt
        Next
        
    Next
    
    For Each crt In crts
        Set crt = Nothing
    Next
    Set crts = Nothing
    
End Sub

' Insértion d'un circuit à la racine du trv
'------------------------------------------------------------------------------
'##ModelId=39A39A090230
Public Sub addNod(clePer As String, cleNod As String, txt As String)
Attribute addNod.VB_Description = " Insértion d'un circuit à la racine du trv\r\n------------------------------------------------------------------------------"
    If clePer = "" Then
        trvCrt.Nodes.Add , , cleNod, txt
    Else
        trvCrt.Nodes.Add clePer, tvwChild, cle, txt
    End If
End Sub

' Séléction d'un noeud du trv
'------------------------------------------------------------------------------
Private Sub trvCrt_NodeClick(ByVal Node As MSComctlLib.Node)
    Dim pfx As String
    Dim Id As Long
    
    pfx = toPrefix(Node.key)
    Id = toId(Node.key)
    
    If pfx = "crt" Then
        Dim crt As CCircuit
        Set crt = mdlMain.tblCrt.CircuitByCrtId(Id)
        writeCrt crt
        Set crt = Nothing
    ElseIf pfx = "etp" Then
        Dim etp As CEtape
        Set etp = mdlMain.tblEtp.EtapeByEtpId(Id)
        writeEtp etp
        Set etp = Nothing
    ElseIf pfx = "pti" Then
        Dim clt As CClient
        Set clt = mdlMain.tblClt.ClientByCltId(Id)
        writeClt clt
        Set clt = Nothing
    End If
    
End Sub

' Calcul d'un clef depuis les valeurs d'un élément
'------------------------------------------------------------------------------
'##ModelId=39A39A0A003C
Private Function toKey(k_0 As String, prefix As String, Id As Long) As String
Attribute toKey.VB_Description = " Calcul d'un clef depuis les valeurs d'un élément\r\n------------------------------------------------------------------------------"
    If k_0 = "" Then
        toKey = CStr(Id) & "_" & prefix
    Else
        toKey = CStr(Id) & "_" & k_0 & "_" & prefix
    End If
End Function

' Calcul du prefix depuis une clef
'------------------------------------------------------------------------------
'##ModelId=39A39A0A0262
Private Function toPrefix(key As String) As String
Attribute toPrefix.VB_Description = " Calcul du prefix depuis une clef\r\n------------------------------------------------------------------------------"
    toPrefix = mId(key, Len(key) - 2, 3)
End Function

' Calcul de l'id depuis une clef
'------------------------------------------------------------------------------
'##ModelId=39A39A0A0370
Private Function toId(key As String) As Long
Attribute toId.VB_Description = " Calcul de l'id depuis une clef\r\n------------------------------------------------------------------------------"
    Dim posId As Long
    Dim strId As String
    posId = InStr(1, key, "_", vbTextCompare)
    strId = mId(key, 1, posId - 1)
    toId = CLng(strId)
End Function



'******************************************************************************
' Gestion des menus
'******************************************************************************



' Ajout d'une nouvelle étape
'------------------------------------------------------------------------------
Private Sub mnuAddEtp_Click()
    With frmEtape
        .iUpDate = False
        .Show vbModal
    End With
End Sub

' Ajout d'un nouveau client
'------------------------------------------------------------------------------
'##ModelId=39A39A0B0096
Private Sub mnuAddClt_Click()
Attribute mnuAddClt_Click.VB_Description = " Ajout d'un nouveau client\r\n------------------------------------------------------------------------------"
    With frmClient
        .iUpDate = False
        .Show vbModal
    End With
End Sub

' Ajout d'un nouvel accompagnant
'------------------------------------------------------------------------------
Private Sub mnuAddAcp_Click()
    With frmAccompagnateur
        .iUpDate = False
        .Show vbModal
    End With
End Sub

' Ajout d'un organisme
'------------------------------------------------------------------------------
Private Sub mnuAddOrg_Click()
    With frmOrganisme
        .iUpDate = False
        .Show vbModal
    End With
End Sub

' Ajout d'une ville
'------------------------------------------------------------------------------
Private Sub mnuAddVle_Click()
    With frmVille
        .iUpDate = False
        .Show vbModal
    End With
End Sub



'******************************************************************************
' Gestion du formulaire
'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
Private Sub Form_Initialize()
End Sub

' Déinstanciation
'------------------------------------------------------------------------------
Private Sub Form_Terminate()
End Sub

' Chargement du formulaire
'------------------------------------------------------------------------------
'##ModelId=399EB1230258
Private Sub Form_Load()
    setRtb
    setTrv
End Sub

' Déchargement du formulaire
'------------------------------------------------------------------------------
'##ModelId=39A39A090046
Private Sub Form_Unload(Cancel As Integer)
End Sub

