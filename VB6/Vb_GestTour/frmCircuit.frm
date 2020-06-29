VERSION 5.00
Begin VB.Form frmCircuit 
   Caption         =   "Circuit"
   ClientHeight    =   6600
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5940
   LinkTopic       =   "Form1"
   ScaleHeight     =   6600
   ScaleWidth      =   5940
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraPti 
      Caption         =   "Participants"
      Height          =   2100
      Left            =   105
      TabIndex        =   17
      Top             =   4350
      Width           =   5700
      Begin VB.CommandButton Command2 
         Caption         =   "<<"
         Height          =   300
         Left            =   2900
         TabIndex        =   21
         Top             =   1700
         Width           =   2700
      End
      Begin VB.CommandButton Command1 
         Caption         =   ">>"
         Height          =   300
         Left            =   100
         TabIndex        =   20
         Top             =   1700
         Width           =   2700
      End
      Begin VB.ListBox List3 
         Appearance      =   0  'Flat
         Height          =   1400
         Left            =   2900
         TabIndex        =   19
         Top             =   250
         Width           =   2700
      End
      Begin VB.ListBox List2 
         Appearance      =   0  'Flat
         Height          =   1400
         Left            =   100
         TabIndex        =   18
         Top             =   250
         Width           =   2700
      End
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "Annuler"
      Height          =   350
      Left            =   4700
      TabIndex        =   16
      Top             =   600
      Width           =   1000
   End
   Begin VB.CommandButton btnRecod 
      Caption         =   "Enregistrer"
      Height          =   350
      Left            =   4700
      TabIndex        =   15
      Top             =   200
      Width           =   1000
   End
   Begin VB.Frame fraEtapes 
      Caption         =   "Etapes"
      Height          =   1800
      Left            =   100
      TabIndex        =   7
      Top             =   2500
      Width           =   5700
      Begin VB.CommandButton btnDelEtp 
         Caption         =   "Supprimer"
         Height          =   350
         Left            =   4600
         TabIndex        =   14
         Top             =   650
         Width           =   1000
      End
      Begin VB.CommandButton btnAddEtp 
         Caption         =   "Ajouter"
         Height          =   350
         Left            =   4600
         TabIndex        =   13
         Top             =   250
         Width           =   1000
      End
      Begin VB.ListBox List1 
         Appearance      =   0  'Flat
         Height          =   1395
         Left            =   100
         TabIndex        =   12
         Top             =   250
         Width           =   4200
      End
   End
   Begin VB.Frame fraCrt 
      Caption         =   "Circuit"
      Height          =   2350
      Left            =   100
      TabIndex        =   0
      Top             =   100
      Width           =   4400
      Begin VB.ComboBox cboAcp 
         Height          =   315
         Left            =   1400
         TabIndex        =   11
         Text            =   "Combo1"
         Top             =   650
         Width           =   2900
      End
      Begin VB.TextBox txtDateReserve 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   2100
         TabIndex        =   9
         Top             =   1850
         Width           =   2200
      End
      Begin VB.TextBox txtPlaces 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   2100
         TabIndex        =   6
         Top             =   1450
         Width           =   2200
      End
      Begin VB.TextBox txtPrix 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   2100
         TabIndex        =   4
         Top             =   1050
         Width           =   2200
      End
      Begin VB.TextBox txtIntitule 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   1400
         TabIndex        =   2
         Top             =   250
         Width           =   2900
      End
      Begin VB.Label lblAccompagnateur 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Caption         =   "Accompagnateur"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   100
         TabIndex        =   10
         Top             =   650
         Width           =   1305
      End
      Begin VB.Label lblDateReserv 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Caption         =   "Date des résérvations"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   100
         TabIndex        =   8
         Top             =   1850
         Width           =   2000
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Caption         =   "Nombre de Places"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   100
         TabIndex        =   5
         Top             =   1450
         Width           =   2000
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Caption         =   "Prix"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   100
         TabIndex        =   3
         Top             =   1050
         Width           =   2000
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Caption         =   "Intitulé"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   100
         TabIndex        =   1
         Top             =   250
         Width           =   1305
      End
   End
End
Attribute VB_Name = "frmCircuit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"39A6E4BD0244"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit



'##ModelId=39A6E4C2038F
Public iUpDate As Boolean
'##ModelId=39A6E4C30015
Public myCrt As CCircuit


' Initialisation de la combo des accompagnateurs
'------------------------------------------------------------------------------
'##ModelId=39A6E4C30082
Private Sub setAcp()
Attribute setAcp.VB_Description = " Initialisation de la combo des accompagnateurs\r\n------------------------------------------------------------------------------"
    Dim acps As CAccompagnateurs
    
End Sub

'******************************************************************************
' Gestion du formulaire
'******************************************************************************



' Instanciation du formulaire
'------------------------------------------------------------------------------
'##ModelId=39A6E4C300B4
Private Sub Form_Initialize()
Attribute Form_Initialize.VB_Description = " Instanciation du formulaire\r\n------------------------------------------------------------------------------"
    Set myCrt = New CCircuit
End Sub

' Désinstanciation du formulaire
'------------------------------------------------------------------------------
'##ModelId=39A6E4C300F0
Private Sub Form_Terminate()
Attribute Form_Terminate.VB_Description = " Désinstanciation du formulaire\r\n------------------------------------------------------------------------------"
    Set myCrt = Nothing
End Sub

' Chargement du formulaire (show)
'------------------------------------------------------------------------------
'##ModelId=39A6E4C30122
Private Sub Form_Load()
Attribute Form_Load.VB_Description = " Chargement du formulaire (show)\r\n------------------------------------------------------------------------------"
End Sub

' Déchargement du formulaire (hide)
'------------------------------------------------------------------------------
'##ModelId=39A6E4C30123
Private Sub Form_Unload(Cancel As Integer)
Attribute Form_Unload.VB_Description = " Déchargement du formulaire (hide)\r\n------------------------------------------------------------------------------"
End Sub
