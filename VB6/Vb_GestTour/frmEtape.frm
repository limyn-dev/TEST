VERSION 5.00
Begin VB.Form frmEtape 
   Caption         =   "Etape"
   ClientHeight    =   4500
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5745
   LinkTopic       =   "Form1"
   ScaleHeight     =   4500
   ScaleWidth      =   5745
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraCtc 
      Caption         =   "Contactes"
      Height          =   2200
      Left            =   100
      TabIndex        =   11
      Top             =   2150
      Width           =   5500
      Begin VB.CommandButton btnAddCtc 
         Caption         =   "<<"
         Height          =   300
         Left            =   2800
         TabIndex        =   15
         Top             =   1725
         Width           =   2595
      End
      Begin VB.CommandButton btnDelCtc 
         Caption         =   ">>"
         Height          =   300
         Left            =   100
         TabIndex        =   14
         Top             =   1725
         Width           =   2595
      End
      Begin VB.ListBox lstCtcVle 
         Appearance      =   0  'Flat
         Height          =   1395
         Left            =   2800
         TabIndex        =   13
         Top             =   250
         Width           =   2600
      End
      Begin VB.ListBox lstCtcEtp 
         Appearance      =   0  'Flat
         Height          =   1395
         Left            =   105
         TabIndex        =   12
         Top             =   255
         Width           =   2595
      End
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "Annuler"
      Height          =   350
      Left            =   4600
      TabIndex        =   10
      Top             =   600
      Width           =   1000
   End
   Begin VB.CommandButton btnRecord 
      Caption         =   "Enregistrer"
      Height          =   350
      Left            =   4600
      TabIndex        =   9
      Top             =   200
      Width           =   1000
   End
   Begin VB.Frame fraEtp 
      Caption         =   "Etape"
      Height          =   1950
      Left            =   100
      TabIndex        =   0
      Top             =   100
      Width           =   4400
      Begin VB.ComboBox cboVille 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   800
         TabIndex        =   8
         Top             =   650
         Width           =   3500
      End
      Begin VB.TextBox txtNumero 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   800
         TabIndex        =   7
         Top             =   250
         Width           =   3500
      End
      Begin VB.TextBox txtDepartHeure 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   800
         TabIndex        =   5
         Top             =   1450
         Width           =   3500
      End
      Begin VB.TextBox txtArriveeHeure 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   800
         TabIndex        =   4
         Top             =   1050
         Width           =   3500
      End
      Begin VB.Label lblNumero 
         Caption         =   "Numero"
         Height          =   315
         Left            =   100
         TabIndex        =   6
         Top             =   250
         Width           =   700
      End
      Begin VB.Label lblDepartHeure 
         Caption         =   "Depart"
         Height          =   315
         Left            =   100
         TabIndex        =   3
         Top             =   1450
         Width           =   700
      End
      Begin VB.Label lblArriveeHeure 
         Caption         =   "Arrivee"
         Height          =   315
         Left            =   100
         TabIndex        =   2
         Top             =   1050
         Width           =   700
      End
      Begin VB.Label lblVille 
         Caption         =   "Ville"
         Height          =   315
         Left            =   100
         TabIndex        =   1
         Top             =   650
         Width           =   700
      End
   End
End
Attribute VB_Name = "frmEtape"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"39A6E4B00046"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit



'##ModelId=39A6E4B3038F
Public iUpDate As Boolean
'##ModelId=39A6E4B40051
Public myEtp As CEtape


'******************************************************************************
' Gestion des villes
'******************************************************************************
'##ModelId=39A6E4B40082
Private Sub setVille()
Attribute setVille.VB_Description = "******************************************************************************\r\n Gestion des villes\r\n******************************************************************************"
    Dim vles As CVilles
    Dim vle As CVille
    With cboVille
        .Clear
        Set vles = tblVle.ReadAll
        For Each vle In vles
            .AddItem vle.nom
            .ItemData(.NewIndex) = vle.Id
        Next
    End With
    Set vles = Nothing
End Sub



'******************************************************************************
' Gestion de l'instance
'******************************************************************************



' Chargement du formulaire
'------------------------------------------------------------------------------
'##ModelId=39A6E4B400BE
Private Sub Form_Load()
Attribute Form_Load.VB_Description = " Chargement du formulaire\r\n------------------------------------------------------------------------------"
    Dim ctc As COrganisme
    With myEtp
        If iUpDate Then
            txtNumero.Text = .Numero
            txtArriveeHeure.Text = .ArriveeHeure
            txtDepartHeure.Text = .DepartHeure
            cboVille.Text = .ville.nom
            cboVille.Enabled = False
            lstCtcEtp.Clear
            For Each ctc In myEtp.Contacts
                lstCtcEtp.AddItem ctc.nom
                lstCtcEtp.ItemData(lstCtcEtp.NewIndex) = ctc.Id
            Next
            lstCtcVle.Clear
            For Each ctc In myEtp.ville.Organismes
                lstCtcVle.AddItem ctc.nom
                lstCtcVle.ItemData(lstCtcVle.NewIndex) = ctc.Id
            Next
        Else
            txtNumero.Text = ""
            txtArriveeHeure.Text = ""
            txtDepartHeure.Text = ""
            setVille
            cboVille.Enabled = True
            lstCtcEtp.Clear
        End If
        
    End With
End Sub

' Déchargement du formulaire
'------------------------------------------------------------------------------
'##ModelId=39A6E4B400F0
Private Sub Form_Unload(Cancel As Integer)
Attribute Form_Unload.VB_Description = " Déchargement du formulaire\r\n------------------------------------------------------------------------------"
End Sub

' Instanciation
'------------------------------------------------------------------------------
'##ModelId=39A6E4B4015E
Private Sub Form_Initialize()
Attribute Form_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    Set myEtp = New CEtape
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=39A6E4B4015F
Private Sub Form_Terminate()
Attribute Form_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    Set myeto = Nothing
End Sub

