VERSION 5.00
Begin VB.Form frmVille 
   Caption         =   "Ville"
   ClientHeight    =   3135
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6090
   LinkTopic       =   "Form1"
   ScaleHeight     =   3135
   ScaleWidth      =   6090
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraOrganismes 
      Caption         =   "Organismes"
      Height          =   2000
      Left            =   120
      TabIndex        =   5
      Top             =   960
      Width           =   5775
      Begin VB.CommandButton btnUpDOrg 
         Caption         =   "Modifier"
         Height          =   350
         Left            =   4680
         TabIndex        =   9
         Top             =   650
         Width           =   1000
      End
      Begin VB.CommandButton btnDelOrg 
         Caption         =   "Supprimer"
         Height          =   350
         Left            =   4680
         TabIndex        =   8
         Top             =   1050
         Width           =   1000
      End
      Begin VB.CommandButton bntAddOrg 
         Caption         =   "Ajouter"
         Height          =   350
         Left            =   4680
         TabIndex        =   7
         Top             =   250
         Width           =   1000
      End
      Begin VB.ListBox lstOrg 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         Height          =   1590
         Left            =   120
         TabIndex        =   6
         Top             =   250
         Width           =   4455
      End
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "Annuler"
      Height          =   350
      Left            =   4920
      TabIndex        =   4
      Top             =   550
      Width           =   1000
   End
   Begin VB.CommandButton btnRecord 
      Height          =   350
      Left            =   4920
      TabIndex        =   3
      Top             =   200
      Width           =   1000
   End
   Begin VB.Frame fraVle 
      Caption         =   "Ville"
      Height          =   800
      Left            =   100
      TabIndex        =   0
      Top             =   100
      Width           =   4700
      Begin VB.TextBox txtNom 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   1000
         TabIndex        =   2
         Top             =   240
         Width           =   3500
      End
      Begin VB.Label lblNom 
         Caption         =   "Nom"
         Height          =   315
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   900
      End
   End
End
Attribute VB_Name = "frmVille"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"39A39A460280"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit



'##ModelId=39A6E4AA0385
Public myVle As CVille
'##ModelId=39A6E4AB000A
Public iUpDate As Boolean



'******************************************************************************



' Instanciation du formulaire
'------------------------------------------------------------------------------
'##ModelId=39A6E4AB0046
Private Sub Form_Initialize()
Attribute Form_Initialize.VB_Description = " Instanciation du formulaire\r\n------------------------------------------------------------------------------"
    Set myVle = New CVille
End Sub

' Désinstanciation du formulaire
'------------------------------------------------------------------------------
'##ModelId=39A6E4AB0078
Private Sub Form_Terminate()
Attribute Form_Terminate.VB_Description = " Désinstanciation du formulaire\r\n------------------------------------------------------------------------------"
    Set myVle = Nothing
End Sub

' Chargement du formulaire (show)
'------------------------------------------------------------------------------
'##ModelId=39A6E4AB00B4
Private Sub Form_Load()
Attribute Form_Load.VB_Description = " Chargement du formulaire (show)\r\n------------------------------------------------------------------------------"
    If iUpDate Then
        txtNom.Text = myVle.nom
        With lstOrg
            Dim org As COrganisme
            For Each org In myVle.Organismes
                .AddItem org.nom
                .ItemData(.NewIndex) = org.Id
            Next
        End With
        btnRecord.Caption = "Modifier"
    Else
        txtNom.Text = ""
        lstOrg.Clear
        btnRecord.Caption = "Créer"
    End If
End Sub

' Déchargement du formulaire (hide)
'------------------------------------------------------------------------------
'##ModelId=39A6E4AB00E6
Private Sub Form_Unload(Cancel As Integer)
Attribute Form_Unload.VB_Description = " Déchargement du formulaire (hide)\r\n------------------------------------------------------------------------------"
End Sub

' Enregistrement des vleurs
'------------------------------------------------------------------------------
'##ModelId=39A6E4AB0154
Private Sub btnRecord_Click()
Attribute btnRecord_Click.VB_Description = " Enregistrement des vleurs\r\n------------------------------------------------------------------------------"
    With myVle
        .nom = txtNom.Text
    End With
    If mdlMain.tblClt.Create(myClt) Then
        MsgBox "Ajout OK"
    Else
        MsgBox "Erreur lors de l'ajout du client"
    End If
    Me.Hide
End Sub

' Annulation de la saisie
'------------------------------------------------------------------------------
'##ModelId=39A6E4AB0190
Private Sub btnCancel_Click()
Attribute btnCancel_Click.VB_Description = " Annulation de la saisie\r\n------------------------------------------------------------------------------"
    Me.Hide
End Sub

