VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmMain 
   Caption         =   "Circuits"
   ClientHeight    =   6465
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   9240
   LinkTopic       =   "Form1"
   ScaleHeight     =   6465
   ScaleWidth      =   9240
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   330
      Left            =   0
      TabIndex        =   2
      Top             =   6135
      Width           =   9240
      _ExtentX        =   16298
      _ExtentY        =   582
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin RichTextLib.RichTextBox rtbMain 
      Height          =   6000
      Left            =   3150
      TabIndex        =   1
      Top             =   50
      Width           =   6000
      _ExtentX        =   10583
      _ExtentY        =   10583
      _Version        =   393217
      Enabled         =   -1  'True
      Appearance      =   0
      TextRTF         =   $"frmMain.frx":0000
   End
   Begin MSComctlLib.TreeView trvMain 
      Height          =   6000
      Left            =   100
      TabIndex        =   0
      Top             =   50
      Width           =   3000
      _ExtentX        =   5292
      _ExtentY        =   10583
      _Version        =   393217
      Style           =   7
      BorderStyle     =   1
      Appearance      =   0
   End
   Begin VB.Menu mnuCrt 
      Caption         =   "File"
      Index           =   1
      Begin VB.Menu mnuQuitter 
         Caption         =   "Quitter"
         Index           =   1
      End
   End
   Begin VB.Menu mnuCrt 
      Caption         =   "Circuit"
      Index           =   2
      Begin VB.Menu mnuCrtAdd 
         Caption         =   "Ajouter"
         Index           =   1
      End
      Begin VB.Menu mnuCrtMod 
         Caption         =   "Modifier"
      End
   End
   Begin VB.Menu mnuClt 
      Caption         =   "Client"
      Index           =   3
      Begin VB.Menu mnuCltAdd 
         Caption         =   "Ajouter"
         Index           =   2
      End
      Begin VB.Menu mnuCltMod 
         Caption         =   "Modifier"
      End
   End
   Begin VB.Menu mnuOrg 
      Caption         =   "Organismes"
      Index           =   4
      Begin VB.Menu mnuOrgMod 
         Caption         =   "Modifier"
         Index           =   3
      End
   End
   Begin VB.Menu mnuVle 
      Caption         =   "Ville"
      Index           =   5
      Begin VB.Menu mnuVleAdd 
         Caption         =   "Ajouter"
      End
      Begin VB.Menu mnuVleMod 
         Caption         =   "Modifier"
      End
   End
   Begin VB.Menu mnuAcp 
      Caption         =   "Accompagnant"
      Index           =   6
      Begin VB.Menu mnuAcpAdd 
         Caption         =   "Ajouter"
      End
      Begin VB.Menu mnuAcpMod 
         Caption         =   "Modifier"
      End
   End
   Begin VB.Menu mnuEtp 
      Caption         =   "Etape"
      Index           =   7
      Begin VB.Menu mnuEtpMod 
         Caption         =   "Modifier"
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

'##ModelId=39A6E452001E
Const MARGE_DEFAUT = "   "

'##ModelId=39A6E4520244
Private myCrtId As Long
'##ModelId=39A6E452035C
Private myEtpId As Long
'##ModelId=39A6E4530082
Private myPtiId As Long


' *****************************************************************************
' Gestion du l'affichage des valeurs
' *****************************************************************************



' Initialisation de la rtb
'------------------------------------------------------------------------------
'##ModelId=39A6E45301CC
Private Sub setRtb()
Attribute setRtb.VB_Description = " Initialisation de la rtb\r\n------------------------------------------------------------------------------"
    With rtbMain
        .Text = ""
    End With
End Sub

' Ecriture d'une ligne dans la rtb
'------------------------------------------------------------------------------
'##ModelId=39A6E45302A8
Private Sub clearTxt()
Attribute clearTxt.VB_Description = " Ecriture d'une ligne dans la rtb\r\n------------------------------------------------------------------------------"
    rtbMain.Text = ""
End Sub

' Ecriture d'une ligne dans la rtb
'------------------------------------------------------------------------------
'##ModelId=39A6E4530352
Private Sub writeLne(Optional lne As String, Optional mrg As String)
Attribute writeLne.VB_Description = " Ecriture d'une ligne dans la rtb\r\n------------------------------------------------------------------------------"
    With rtbMain
        If Len(mrg) > 0 Then .Text = .Text & mrg
        If Len(lne) > 0 Then .Text = .Text & lne
        .Text = .Text & vbNewLine
    End With
End Sub

' Ecriture dun titre
'------------------------------------------------------------------------------
'##ModelId=39A6E45401C2
Private Sub writeTtr(titre As String, Optional mrg As String)
Attribute writeTtr.VB_Description = " Ecriture dun titre\r\n------------------------------------------------------------------------------"
    Dim str As String
    Dim car As Integer
    writeLne
    writeLne titre, mrg
    For car = Len(mrg) To 50
        str = str & "-"
    Next
    writeLne str
End Sub

' Ecriture d'un circuit
'------------------------------------------------------------------------------
'##ModelId=39A39A090122
Private Sub writeCrt(crt As CCircuit, Optional mrg As String)
Attribute writeCrt.VB_Description = " Ecriture d'un circuit\r\n------------------------------------------------------------------------------"
    Dim etp As CEtape
    Dim pti As CParticipant
    
    clearTxt
    With crt
        writeTtr "Circuit: " & crt.Intitule, mrg
        writeLne "Prix: " & .Prix, mrg
        writeLne "Accompagnateur: " & .accompagnateur.prenom & " " & .accompagnateur.prenom, mrg
        writeLne "Nombre de place: " & .NombrePlace, mrg
        For Each etp In .Etapes
            writeEtp etp, mrg & MARGE_DEFAUT
        Next
        writeTtr "Participant: ", mrg
        For Each pti In .Participants
            writePti pti, mrg & MARGE_DEFAUT
        Next
    End With
End Sub

' Ecriture d'un participant
'------------------------------------------------------------------------------
'##ModelId=39A6E45501B8
Private Sub writePti(pti As CParticipant, Optional mrg As String)
Attribute writePti.VB_Description = " Ecriture d'un participant\r\n------------------------------------------------------------------------------"
    With pti.Client
         writeLne .prenom & " " & .nom & " / " & .Adresse & " / " & .Tel, mrg
    End With
    With pti
         writeLne "Accompte: " & .Accompte & " Versement: " & .Versement & " " & .Remise, mrg
    End With
End Sub

' Ecriture d'un client
'------------------------------------------------------------------------------
'##ModelId=39A6E4560028
Private Sub writeClt(clt As CClient, Optional mrg As String)
Attribute writeClt.VB_Description = " Ecriture d'un client\r\n------------------------------------------------------------------------------"
    With clt
        writeTtr "Client: " & .nom & " " & .prenom, mrg
        writeLne "Adresse: " & .Adresse, mrg
        writeLne "Tel: " & .Tel, mrg
    End With
End Sub

' Ecriture d'une etape
'------------------------------------------------------------------------------
'##ModelId=39A6E456024E
Private Sub writeEtp(etp As CEtape, Optional mrg As String)
Attribute writeEtp.VB_Description = " Ecriture d'une etape\r\n------------------------------------------------------------------------------"
    Dim ctc As COrganisme
    With etp
        writeTtr "Etape: " & .Numero, mrg
        writeLne "Ville: " & .ville.nom, mrg
        writeLne "" & .ArriveeHeure, mrg
        writeLne "" & .DepartHeure, mrg
        For Each ctc In .Contacts
            writeCtc ctc, mrg & MARGE_DEFAUT
        Next
    End With
End Sub

' Ecriture d'un contact
'------------------------------------------------------------------------------
'##ModelId=39A6E45700C8
Private Sub writeCtc(ctc As COrganisme, Optional mrg As String)
Attribute writeCtc.VB_Description = " Ecriture d'un contact\r\n------------------------------------------------------------------------------"
    With ctc
        writeTtr "Contctes" & .nom, mrg
        writeLne "Adresse: " & .Adresse, mrg
        writeLne "Tel: " & .Tel, mrg
    End With
End Sub

' Ecriture d'une ville
'------------------------------------------------------------------------------
'##ModelId=39A6E4570320
Private Sub writeVle(vle As CVille, mrg)
Attribute writeVle.VB_Description = " Ecriture d'une ville\r\n------------------------------------------------------------------------------"
    Dim org As COrganisme
    With vle
        writeTtr "Ville: " & .nom, mrg
        For Each org In .Organismes
            writeOrg org, mrg & MARGE_DEFAUT
        Next
    End With
End Sub

' Ecriture d'un organisme
'------------------------------------------------------------------------------
'##ModelId=39A6E45801CC
Private Sub writeOrg(org As COrganisme, mrg)
Attribute writeOrg.VB_Description = " Ecriture d'un organisme\r\n------------------------------------------------------------------------------"
    With org
        writeTtr "Organisme: " & .TypeOrganisme.Designation & " " & .nom, mrg
        writeLne "Adresse: " & .Adresse, mrg
        writeLne "Tel: " & .Tel, mrg
    End With
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
    Dim pti As CParticipant
    Dim k_0 As String
    Dim k_1 As String
    Dim k_2 As String
    Dim txt As String
    
    Set crts = mdlMain.tblCrt.ReadAll
    
    For Each crt In crts
        
        ' Ajout du circuit
        k_0 = toKey("", "crt", crt.Id)
        trvMain.Nodes.Add , , k_0, crt.Intitule & " " & CStr(crt.Id)
        
        ' Ajout des étapes
        k_1 = toKey(k_0, "etp", 0)
        trvMain.Nodes.Add k_0, tvwChild, k_1, "Etapes"
        For Each etp In crt.Etapes
            txt = etp.ville.nom
            trvMain.Nodes.Add k_1, tvwChild, toKey(k_0, "etp", etp.Id), txt
        Next
        
        ' Ajout des participants
        k_1 = toKey(k_0, "pti", 0)
        trvMain.Nodes.Add k_0, tvwChild, k_1, "Participants"
        For Each pti In crt.Participants
            txt = pti.Client.prenom & " " & pti.Client.nom
            trvMain.Nodes.Add k_1, tvwChild, toKey(k_0, "pti", pti.Id), txt
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
        trvMain.Nodes.Add , , cleNod, txt
    Else
        trvMain.Nodes.Add clePer, tvwChild, cle, txt
    End If
End Sub

' Séléction d'un noeud du trv
'------------------------------------------------------------------------------
'##ModelId=39A6E45A0000
Private Sub trvMain_NodeClick(ByVal Node As MSComctlLib.Node)
Attribute trvMain_NodeClick.VB_Description = " Séléction d'un noeud du trv\r\n------------------------------------------------------------------------------"
    Dim pfx As String
    Dim Id As Long
    
    pfx = toPrefix(Node.key)
    Id = toId(Node.key)
    
    If pfx = "crt" Then
        clickCrt Id
    ElseIf pfx = "etp" Then
        clickEtp Id
    ElseIf pfx = "pti" Then
        clickCrt Id
    Else
    End If
    
End Sub

' Click sur un des éléments du trv
'------------------------------------------------------------------------------
'##ModelId=39A6E45A01B8
Private Sub clickCrt(Id As Long)
Attribute clickCrt.VB_Description = " Click sur un des éléments du trv\r\n------------------------------------------------------------------------------"
    Dim crt As CCircuit
    myCrtId = Id
    Set crt = mdlMain.tblCrt.ReadByCrtId(Id)
    writeCrt crt
    Set crt = Nothing
End Sub
'------------------------------------------------------------------------------
'##ModelId=39A6E45A0370
Private Sub clickEtp(Id As Long)
Attribute clickEtp.VB_Description = "------------------------------------------------------------------------------"
    Dim etp As CEtape
    myEtpId = Id
    Set etp = mdlMain.tblEtp.ReadByEtpId(Id)
    writeEtp etp
    Set etp = Nothing
End Sub
'------------------------------------------------------------------------------
'##ModelId=39A6E45B0172
Private Sub clickPti(Id As Long)
Attribute clickPti.VB_Description = "------------------------------------------------------------------------------"
    Dim clt As CClient
    mycltid = Id
    Set clt = mdlMain.tblClt.ReadByCltId(Id)
    writeClt clt
    Set clt = Nothing
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



' Ajout d'un nouveau circuit
'------------------------------------------------------------------------------
'##ModelId=39A6E45D0122
Private Sub mnuCrtAdd_Click(Index As Integer)
Attribute mnuCrtAdd_Click.VB_Description = " Ajout d'un nouveau circuit\r\n------------------------------------------------------------------------------"
    With frmCircuit
        .iUpDate = False
        .Show vbModal
    End With
End Sub

' Modification d'un circuit
'------------------------------------------------------------------------------
'##ModelId=39A6E45D02DA
Private Sub mnuCrtMod_Click()
Attribute mnuCrtMod_Click.VB_Description = " Modification d'un circuit\r\n------------------------------------------------------------------------------"
    With frmCircuit
        .iUpDate = True
        .Show vbModal
    End With
End Sub

' Modification d'une nouvelle étape
'------------------------------------------------------------------------------
'##ModelId=39A6E45E000A
Private Sub mnuEtpMod_Click()
Attribute mnuEtpMod_Click.VB_Description = " Modification d'une nouvelle étape\r\n------------------------------------------------------------------------------"

End Sub

' Ajout d'un nouveau client
'------------------------------------------------------------------------------
'##ModelId=39A39A0B0096
Private Sub mnuCltAdd_Click(Index As Integer)
    With frmClient
        .iUpDate = False
        .Show vbModal
    End With
End Sub

' Modification du client
'------------------------------------------------------------------------------
'##ModelId=39A6E45E0230
Private Sub mnuCltMod_Click()
Attribute mnuCltMod_Click.VB_Description = " Modification du client\r\n------------------------------------------------------------------------------"

End Sub

' Ajout d'un nouvel accompagnant
'------------------------------------------------------------------------------
'##ModelId=39A6E45E033E
Private Sub mnuAcpAdd_Click()
Attribute mnuAcpAdd_Click.VB_Description = " Ajout d'un nouvel accompagnant\r\n------------------------------------------------------------------------------"
    With frmAccompagnateur
        .iUpDate = False
        .Show vbModal
    End With
End Sub

' Modification d'un accompagnant
'------------------------------------------------------------------------------
'##ModelId=39A6E45F0032
Private Sub mnuAcpMod_Click()
Attribute mnuAcpMod_Click.VB_Description = " Modification d'un accompagnant\r\n------------------------------------------------------------------------------"

End Sub

' Ajout d'un organisme
'------------------------------------------------------------------------------
'##ModelId=39A6E45F014A
Private Sub mnuOrgMod_Click(Index As Integer)
Attribute mnuOrgMod_Click.VB_Description = " Ajout d'un organisme\r\n------------------------------------------------------------------------------"
    With frmOrganisme
        .iUpDate = False
        .Show vbModal
    End With
End Sub

' Ajout d'une ville
'------------------------------------------------------------------------------
'##ModelId=39A6E45F0334
Private Sub mnuVleAdd_Click()
Attribute mnuVleAdd_Click.VB_Description = " Ajout d'une ville\r\n------------------------------------------------------------------------------"
    With frmVille
        .iUpDate = False
        .Show vbModal
    End With
End Sub

' Modification d'une ville
'------------------------------------------------------------------------------
'##ModelId=39A6E4600064
Private Sub mnuVleMod_Click()
Attribute mnuVleMod_Click.VB_Description = " Modification d'une ville\r\n------------------------------------------------------------------------------"

End Sub


'******************************************************************************
' Gestion du formulaire
'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=39A6E4600172
Private Sub Form_Initialize()
Attribute Form_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
End Sub

' Déinstanciation
'------------------------------------------------------------------------------
'##ModelId=39A6E460028A
Private Sub Form_Terminate()
Attribute Form_Terminate.VB_Description = " Déinstanciation\r\n------------------------------------------------------------------------------"
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

