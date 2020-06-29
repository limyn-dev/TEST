VERSION 5.00
Begin VB.Form frmClient 
   Caption         =   "Client"
   ClientHeight    =   3030
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6045
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   6045
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnCancel 
      Caption         =   "Annuler"
      Height          =   350
      Left            =   4920
      TabIndex        =   6
      Top             =   840
      Width           =   1000
   End
   Begin VB.CommandButton btnRecord 
      Caption         =   "Enregistrer"
      Height          =   350
      Left            =   4920
      TabIndex        =   5
      Top             =   360
      Width           =   1000
   End
   Begin VB.Frame fraClt 
      Caption         =   "Client"
      Height          =   2655
      Left            =   120
      TabIndex        =   0
      Top             =   200
      Width           =   4575
      Begin VB.TextBox txtPrenom 
         Appearance      =   0  'Flat
         Height          =   350
         Left            =   820
         TabIndex        =   2
         Top             =   650
         Width           =   3500
      End
      Begin VB.TextBox txtAdresse 
         Appearance      =   0  'Flat
         Height          =   1050
         Left            =   820
         MultiLine       =   -1  'True
         TabIndex        =   3
         Top             =   1050
         Width           =   3500
      End
      Begin VB.TextBox txtTel 
         Appearance      =   0  'Flat
         Height          =   350
         Left            =   820
         TabIndex        =   4
         Top             =   2150
         Width           =   3500
      End
      Begin VB.TextBox txtNom 
         Appearance      =   0  'Flat
         Height          =   350
         Left            =   820
         TabIndex        =   1
         Top             =   250
         Width           =   3500
      End
      Begin VB.Label lblNom 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Caption         =   "Nom"
         ForeColor       =   &H80000008&
         Height          =   345
         Index           =   0
         Left            =   120
         TabIndex        =   10
         Top             =   250
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
         TabIndex        =   9
         Top             =   650
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
         TabIndex        =   8
         Top             =   1050
         Width           =   700
      End
      Begin VB.Label lblTel 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Caption         =   "Tel"
         ForeColor       =   &H80000008&
         Height          =   345
         Index           =   3
         Left            =   100
         TabIndex        =   7
         Top             =   2150
         Width           =   700
      End
   End
End
Attribute VB_Name = "frmClient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"39A39A4103CA"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit



'##ModelId=39A6E4A301AE
Public iUpDate As Boolean
'##ModelId=39A6E4A3021D
Public myClt As CClient




'******************************************************************************



' Instanciation du formulaire
'------------------------------------------------------------------------------
'##ModelId=39A6E4A3028A
Private Sub Form_Initialize()
Attribute Form_Initialize.VB_Description = " Instanciation du formulaire\r\n------------------------------------------------------------------------------"
    Set myClt = New CClient
End Sub

' Désinstanciation du formulaire
'------------------------------------------------------------------------------
'##ModelId=39A6E4A302C6
Private Sub Form_Terminate()
Attribute Form_Terminate.VB_Description = " Désinstanciation du formulaire\r\n------------------------------------------------------------------------------"
    Set myClt = Nothing
End Sub

' Chargement du formulaire (show)
'------------------------------------------------------------------------------
'##ModelId=39A6E4A302F8
Private Sub Form_Load()
Attribute Form_Load.VB_Description = " Chargement du formulaire (show)\r\n------------------------------------------------------------------------------"
    With myClt
        txtNom.Text = .nom
        txtPrenom.Text = .prenom
        txtAdresse.Text = .Adresse
        txtTel.Text = .Tel
    End With
End Sub

' Déchargement du formulaire (hide)
'------------------------------------------------------------------------------
'##ModelId=39A6E4A30334
Private Sub Form_Unload(Cancel As Integer)
Attribute Form_Unload.VB_Description = " Déchargement du formulaire (hide)\r\n------------------------------------------------------------------------------"
End Sub

' Enregistrement des vleurs
'------------------------------------------------------------------------------
'##ModelId=39A6E4A303A2
Private Sub btnRecord_Click()
Attribute btnRecord_Click.VB_Description = " Enregistrement des vleurs\r\n------------------------------------------------------------------------------"
    With myClt
        .nom = txtNom.Text
        .prenom = txtPrenom.Text
        .Adresse = txtAdresse.Text
        .Tel = txtTel.Text
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
'##ModelId=39A6E4A303D4
Private Sub btnCancel_Click()
Attribute btnCancel_Click.VB_Description = " Annulation de la saisie\r\n------------------------------------------------------------------------------"
    Me.Hide
End Sub
