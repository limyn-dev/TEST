VERSION 5.00
Begin VB.Form frmLocalite 
   Caption         =   "Localité"
   ClientHeight    =   1710
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4200
   LinkTopic       =   "Form1"
   ScaleHeight     =   1710
   ScaleWidth      =   4200
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   1200
      Width           =   2535
   End
   Begin VB.ComboBox Combo1 
      Appearance      =   0  'Flat
      Height          =   315
      Left            =   1080
      TabIndex        =   4
      Text            =   "Canton"
      Top             =   700
      Width           =   3000
   End
   Begin VB.TextBox txtNpa 
      Appearance      =   0  'Flat
      Height          =   300
      Left            =   1100
      TabIndex        =   3
      Text            =   "NPA"
      Top             =   400
      Width           =   3000
   End
   Begin VB.TextBox txtNom 
      Appearance      =   0  'Flat
      Height          =   300
      Left            =   1100
      TabIndex        =   1
      Text            =   "Nom"
      Top             =   100
      Width           =   3000
   End
   Begin VB.Label lblCanton 
      Caption         =   "Canton"
      Height          =   300
      Left            =   100
      TabIndex        =   6
      Top             =   700
      Width           =   1005
   End
   Begin VB.Label lblNPA 
      Caption         =   "NPA"
      Height          =   300
      Left            =   100
      TabIndex        =   2
      Top             =   400
      Width           =   1000
   End
   Begin VB.Label lblNom 
      Caption         =   "Nom"
      Height          =   300
      Left            =   100
      TabIndex        =   0
      Top             =   100
      Width           =   1000
   End
End
Attribute VB_Name = "frmLocalite"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
