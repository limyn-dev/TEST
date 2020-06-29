VERSION 5.00
Begin VB.Form frmAccompagnateur 
   Caption         =   "Accompagnateur"
   ClientHeight    =   2790
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5940
   LinkTopic       =   "Form1"
   ScaleHeight     =   2790
   ScaleWidth      =   5940
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnRecord 
      Caption         =   "Enregistrer"
      Height          =   350
      Left            =   4800
      TabIndex        =   10
      Top             =   120
      Width           =   1000
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "Annuler"
      Height          =   350
      Left            =   4800
      TabIndex        =   9
      Top             =   600
      Width           =   1000
   End
   Begin VB.Frame fraAcp 
      Caption         =   "Accompagnateur"
      Height          =   2655
      Left            =   100
      TabIndex        =   0
      Top             =   0
      Width           =   4575
      Begin VB.TextBox txtNom 
         Appearance      =   0  'Flat
         Height          =   350
         Left            =   820
         TabIndex        =   4
         Top             =   250
         Width           =   3500
      End
      Begin VB.TextBox txtTel 
         Appearance      =   0  'Flat
         Height          =   350
         Left            =   820
         TabIndex        =   3
         Top             =   2150
         Width           =   3500
      End
      Begin VB.TextBox txtAdresse 
         Appearance      =   0  'Flat
         Height          =   1050
         Left            =   820
         MultiLine       =   -1  'True
         TabIndex        =   2
         Top             =   1050
         Width           =   3500
      End
      Begin VB.TextBox txtPrenom 
         Appearance      =   0  'Flat
         Height          =   350
         Left            =   820
         TabIndex        =   1
         Top             =   650
         Width           =   3500
      End
      Begin VB.Label lblTel 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Caption         =   "Tel"
         ForeColor       =   &H80000008&
         Height          =   345
         Index           =   3
         Left            =   100
         TabIndex        =   8
         Top             =   2150
         Width           =   700
      End
      Begin VB.Label lblAdresse 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Caption         =   "Adresse"
         ForeColor       =   &H80000008&
         Height          =   345
         Index           =   2
         Left            =   120
         TabIndex        =   7
         Top             =   1050
         Width           =   700
      End
      Begin VB.Label lblPrenom 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Caption         =   "Prénom"
         ForeColor       =   &H80000008&
         Height          =   345
         Index           =   1
         Left            =   120
         TabIndex        =   6
         Top             =   650
         Width           =   700
      End
      Begin VB.Label lblNom 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Caption         =   "Nom"
         ForeColor       =   &H80000008&
         Height          =   345
         Index           =   0
         Left            =   120
         TabIndex        =   5
         Top             =   250
         Width           =   700
      End
   End
End
Attribute VB_Name = "frmAccompagnateur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "User interface pour la gestion des accompagnateurs"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399EA19C0104"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
'User interface pour la gestion des accompagnateurs
Option Explicit

'##ModelId=39A6E4780104
Public iUpDate As Boolean
'##ModelId=39A6E47801E1
Public myAcp As CAccompagnateur




'******************************************************************************



' Instanciation du formulaire
'------------------------------------------------------------------------------
'##ModelId=39A6E478024E
Private Sub Form_Initialize()
Attribute Form_Initialize.VB_Description = " Instanciation du formulaire\r\n------------------------------------------------------------------------------"
    Set myAcp = New CAccompagnateur
End Sub

' Désinstanciation du formulaire
'------------------------------------------------------------------------------
'##ModelId=39A6E47802F8
Private Sub Form_Terminate()
Attribute Form_Terminate.VB_Description = " Désinstanciation du formulaire\r\n------------------------------------------------------------------------------"
    Set myAcp = Nothing
End Sub

' Chargement du formulaire (show)
'------------------------------------------------------------------------------
'##ModelId=39A6E4780398
Private Sub Form_Load()
Attribute Form_Load.VB_Description = " Chargement du formulaire (show)\r\n------------------------------------------------------------------------------"
    With myAcp
        txtNom.Text = .nom
        txtPrenom.Text = .prenom
        txtAdresse.Text = .Adresse
        txtTel.Text = .Tel
    End With
End Sub

' Déchargement du formulaire (hide)
'------------------------------------------------------------------------------
'##ModelId=39A6E479005A
Private Sub Form_Unload(Cancel As Integer)
Attribute Form_Unload.VB_Description = " Déchargement du formulaire (hide)\r\n------------------------------------------------------------------------------"
End Sub

' Enregistrement des vleurs
'------------------------------------------------------------------------------
'##ModelId=39A6E4790168
Private Sub btnRecord_Click()
Attribute btnRecord_Click.VB_Description = " Enregistrement des vleurs\r\n------------------------------------------------------------------------------"
    With myAcp
        .nom = txtNom.Text
        .prenom = txtPrenom.Text
        .Adresse = txtAdresse.Text
        .Tel = txtTel.Text
    End With
    If mdlMain.tblAcp.Create(myAcp) Then
        MsgBox "Ajout OK"
    Else
        MsgBox "Erreur lors de l'ajout du client"
    End If
    Me.Hide
End Sub

' Annulation de la saisie
'------------------------------------------------------------------------------
'##ModelId=39A6E4790244
Private Sub btnCancel_Click()
Attribute btnCancel_Click.VB_Description = " Annulation de la saisie\r\n------------------------------------------------------------------------------"
    Me.Hide
End Sub

