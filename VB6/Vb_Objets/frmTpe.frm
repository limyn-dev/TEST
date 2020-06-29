VERSION 5.00
Begin VB.Form frmTpe 
   Caption         =   "Type"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5895
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   5895
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraAtr 
      Caption         =   "Attributs"
      Height          =   1575
      Left            =   120
      TabIndex        =   6
      Top             =   1320
      Width           =   5655
      Begin VB.ComboBox cboAtrTpe 
         Appearance      =   0  'Flat
         Height          =   315
         Index           =   1
         Left            =   3400
         TabIndex        =   12
         Text            =   "Combo1"
         Top             =   915
         Width           =   2000
      End
      Begin VB.ComboBox cboAtrTpe 
         Appearance      =   0  'Flat
         Height          =   315
         Index           =   0
         Left            =   3400
         TabIndex        =   11
         Text            =   "Combo1"
         Top             =   600
         Width           =   2000
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         Height          =   315
         Index           =   1
         Left            =   900
         TabIndex        =   10
         Text            =   "Nom"
         Top             =   915
         Width           =   2500
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         Height          =   315
         Index           =   0
         Left            =   900
         TabIndex        =   8
         Text            =   "ID"
         Top             =   600
         Width           =   2500
      End
      Begin VB.Label lblAtrTpe 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Caption         =   "Type"
         ForeColor       =   &H80000008&
         Height          =   300
         Left            =   3400
         TabIndex        =   14
         Top             =   300
         Width           =   2000
      End
      Begin VB.Label lblAtrNom 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Caption         =   "Nom"
         ForeColor       =   &H80000008&
         Height          =   300
         Left            =   900
         TabIndex        =   13
         Top             =   300
         Width           =   2500
      End
      Begin VB.Label lblAtr 
         Caption         =   "Attribut 1"
         Height          =   315
         Index           =   1
         Left            =   105
         TabIndex        =   9
         Top             =   915
         Width           =   800
      End
      Begin VB.Label lblAtr 
         Caption         =   "Attribut 0"
         Height          =   315
         Index           =   0
         Left            =   100
         TabIndex        =   7
         Top             =   600
         Width           =   800
      End
   End
   Begin VB.TextBox txtTblAtr 
      Appearance      =   0  'Flat
      Height          =   300
      Left            =   1700
      TabIndex        =   5
      Text            =   "txtTblAtr"
      Top             =   700
      Width           =   2500
   End
   Begin VB.TextBox txtTblObj 
      Appearance      =   0  'Flat
      Height          =   300
      Left            =   1700
      TabIndex        =   3
      Text            =   "txtTblObj"
      Top             =   400
      Width           =   2500
   End
   Begin VB.TextBox txtNomTpe 
      Appearance      =   0  'Flat
      Height          =   300
      Left            =   1700
      TabIndex        =   0
      Text            =   "txtNomTpe"
      Top             =   100
      Width           =   2500
   End
   Begin VB.Label lblTblAtr 
      Caption         =   "Table des Attributs"
      Height          =   300
      Left            =   100
      TabIndex        =   4
      Top             =   700
      Width           =   1600
   End
   Begin VB.Label lblTblObj 
      Caption         =   "Table des objet"
      Height          =   300
      Left            =   100
      TabIndex        =   2
      Top             =   400
      Width           =   1600
   End
   Begin VB.Label lblTpeNom 
      Caption         =   "Nom"
      Height          =   300
      Left            =   100
      TabIndex        =   1
      Top             =   100
      Width           =   1600
   End
End
Attribute VB_Name = "frmTpe"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private tpe As C_Types
Private atrs As C_Attributs

'------------------------------------------------------------------------------
' Initialisation, fermeture de la forme
'==============================================================================
Private Sub Form_Initialize()

   ' Instaciation du type
   Set tpe = New C_Types
   
   txtNomTpe.Text = tpe.Nom(1)
   
End Sub
'------------------------------------------------------------------------------
Private Sub Form_Terminate()

   ' Désinstanciation du type
   Set tpe = Nothing
   
End Sub


