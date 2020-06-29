VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmPersonne 
   Caption         =   "Personne"
   ClientHeight    =   2340
   ClientLeft      =   60
   ClientTop       =   360
   ClientWidth     =   4185
   LinkTopic       =   "Form1"
   ScaleHeight     =   2340
   ScaleWidth      =   4185
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtCtnNom 
      Appearance      =   0  'Flat
      Height          =   300
      Left            =   1100
      TabIndex        =   10
      Text            =   "Canton"
      Top             =   1300
      Width           =   3000
   End
   Begin VB.CommandButton cmdSetId 
      Caption         =   "Set ID"
      Height          =   375
      Left            =   120
      TabIndex        =   9
      Top             =   1800
      Width           =   1455
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   0
      Top             =   4560
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   393216
   End
   Begin MSComctlLib.ListView lswPrs 
      Height          =   2175
      Left            =   120
      TabIndex        =   8
      Top             =   2880
      Width           =   3975
      _ExtentX        =   7011
      _ExtentY        =   3836
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.TextBox txtPrsAdr 
      Appearance      =   0  'Flat
      Height          =   300
      Left            =   1100
      TabIndex        =   6
      Text            =   "Adresse"
      Top             =   700
      Width           =   3000
   End
   Begin VB.TextBox txtLocNom 
      Appearance      =   0  'Flat
      Height          =   300
      Left            =   1100
      TabIndex        =   5
      Text            =   "Localité"
      Top             =   1000
      Width           =   3000
   End
   Begin VB.TextBox txtPrsPrn 
      Appearance      =   0  'Flat
      Height          =   300
      Left            =   1100
      TabIndex        =   4
      Text            =   "Prénom"
      Top             =   400
      Width           =   3000
   End
   Begin VB.TextBox txtPrsNom 
      Appearance      =   0  'Flat
      Height          =   300
      Left            =   1100
      TabIndex        =   1
      Text            =   "Nom"
      Top             =   100
      Width           =   3000
   End
   Begin VB.Label lblCtnNom 
      Caption         =   "Canton"
      Height          =   300
      Left            =   100
      TabIndex        =   11
      Top             =   1300
      Width           =   1005
   End
   Begin VB.Label lblAdr 
      Caption         =   "Adresse"
      Height          =   300
      Left            =   100
      TabIndex        =   7
      Top             =   700
      Width           =   1000
   End
   Begin VB.Label lblLocNom 
      Caption         =   "Localité"
      Height          =   300
      Left            =   100
      TabIndex        =   3
      Top             =   1000
      Width           =   1000
   End
   Begin VB.Label lblPrsPrn 
      Caption         =   "Prénom"
      Height          =   300
      Left            =   100
      TabIndex        =   2
      Top             =   400
      Width           =   1000
   End
   Begin VB.Label lblPrsNom 
      Caption         =   "Nom"
      Height          =   300
      Left            =   100
      TabIndex        =   0
      Top             =   100
      Width           =   1000
   End
End
Attribute VB_Name = "frmPersonne"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'------------------------------------------------------------------------------
'  Données membres
'==============================================================================
Private DB As C_DB

'------------------------------------------------------------------------------
'  Chargement, déchargement de la forme
'==============================================================================
Private Sub Form_Load()

   ' Instanciation des objets
   Set DB = New C_DB
   
End Sub
'------------------------------------------------------------------------------
Private Sub Form_Unload(Cancel As Integer)

   ' Désinstanciation des objets membre
   Set DB = Nothing
   
End Sub

Private Sub cmdSetId_Click()
   Dim prs As New C_Personne
   
   Dim id As Long
   id = CLng(InputBox("Id de la personne"))
   
   Set prs = DB.Personne(id)
   
   With prs
      txtPrsNom.Text = .Nom
      txtPrsPrn.Text = .Prenom
      txtPrsAdr.Text = .Adresse
      txtLocNom.Text = .Localite.Nom
      txtCtnNom.Text = .Localite.Canton.Nom
   End With
   
   Set prs = Nothing
   
End Sub


'******************************************************************************



Private Sub txtCtnNom_Change()

End Sub
