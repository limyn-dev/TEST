VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Object = "{FAEEE763-117E-101B-8933-08002B2F4F5A}#1.1#0"; "dblist32.ocx"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Begin VB.Form forMaster 
   Caption         =   "Form1"
   ClientHeight    =   10425
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   13635
   LinkTopic       =   "Form1"
   ScaleHeight     =   10425
   ScaleWidth      =   13635
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   10320
      Top             =   1560
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   1
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ForMaster.frx":0000
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   1332
      Left            =   9960
      TabIndex        =   9
      Top             =   3120
      Width           =   2052
   End
   Begin VB.Frame frmPropriete 
      Caption         =   "Localisation"
      Height          =   6612
      Left            =   4800
      TabIndex        =   8
      Top             =   480
      Width           =   4212
   End
   Begin VB.Frame frmMaster 
      Caption         =   "Support"
      Height          =   6612
      Left            =   240
      TabIndex        =   5
      Top             =   480
      Width           =   4452
      Begin ComctlLib.TreeView trvMaster 
         Height          =   4932
         Left            =   240
         TabIndex        =   7
         Top             =   600
         Width           =   3972
         _ExtentX        =   7011
         _ExtentY        =   8705
         _Version        =   327682
         Style           =   7
         Appearance      =   1
      End
      Begin VB.Label labTpeSup 
         Caption         =   "Type de support"
         Height          =   252
         Left            =   240
         TabIndex        =   6
         Top             =   360
         Width           =   3132
      End
   End
   Begin VB.Frame frmSelect 
      Caption         =   "Données"
      Height          =   1332
      Left            =   0
      TabIndex        =   1
      Top             =   8640
      Width           =   3852
      Begin MSDBCtls.DBCombo dcbTpeDta 
         Height          =   288
         Left            =   120
         TabIndex        =   4
         Top             =   480
         Width           =   3132
         _ExtentX        =   5530
         _ExtentY        =   556
         _Version        =   393216
         Text            =   "DBCombo2"
      End
      Begin MSDBCtls.DBList DBList1 
         Height          =   1584
         Left            =   120
         TabIndex        =   2
         Top             =   1080
         Width           =   3132
         _ExtentX        =   5530
         _ExtentY        =   2514
         _Version        =   393216
      End
      Begin VB.Label labTpeDta 
         Caption         =   "Type de donnée"
         Height          =   252
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   3132
      End
   End
   Begin MSComctlLib.Toolbar tlbMaster 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   13635
      _ExtentX        =   24051
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      Appearance      =   1
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   1
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
               NumButtonMenus  =   4
               BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "asdfas"
               EndProperty
               BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
               EndProperty
               BeginProperty ButtonMenu3 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "qweqwe"
               EndProperty
               BeginProperty ButtonMenu4 {66833FEE-8583-11D1-B16A-00C0F0283628} 
               EndProperty
            EndProperty
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "forMaster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public con As ADODB.Connection

Dim DbPath As String

Dim nomCmd As String


Private Sub Command1_Click()
   Dim lstViw() As String
   
   ' Création de liste des tables
   ReDim lstViw(1)
   lstViw(0) = "trv_MtpMauCdrMmqPst"
   lstViw(1) = "trv_MtpMauCdrMmqMp3"
   
   ' execution de la requete
   putViws con, trvMaster, lstViw

End Sub

'------------------------------------------------------------------------------
' Chargement du formilaire
'==============================================================================
Private Sub Form_Load()

   ' Connexion sur la DB
   DbPath = App.Path & "\DB\GstMedia.mdb"
   Set con = New ADODB.Connection
   con.Provider = "Microsoft.Jet.OLEDB.4.0"
   con.Open DbPath, "Admin", ""
      
   
   
End Sub

'------------------------------------------------------------------------------
' Déchargement du formilaire
'==============================================================================
Private Sub Form_Unload(Cancel As Integer)

   ' Fermeture de la connexion
   con.Close
   Set con = Nothing
   
End Sub

