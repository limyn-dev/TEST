VERSION 5.00
Begin VB.UserControl ctrPersonne 
   ClientHeight    =   1512
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3528
   ScaleHeight     =   1512
   ScaleWidth      =   3528
   Begin VB.CommandButton cmdValider 
      Caption         =   "Valider"
      Height          =   396
      Left            =   768
      TabIndex        =   4
      Top             =   960
      Width           =   1740
   End
   Begin VB.TextBox txtPrenom 
      Height          =   288
      Left            =   900
      TabIndex        =   3
      Top             =   500
      Width           =   2500
   End
   Begin VB.TextBox txtNom 
      Height          =   288
      Left            =   900
      TabIndex        =   2
      Top             =   100
      Width           =   2500
   End
   Begin VB.Label lblPrenom 
      Caption         =   "Prénom"
      Height          =   250
      Left            =   100
      TabIndex        =   1
      Top             =   500
      Width           =   800
   End
   Begin VB.Label lblNom 
      Caption         =   "Nom"
      Height          =   250
      Left            =   100
      TabIndex        =   0
      Top             =   100
      Width           =   800
   End
End
Attribute VB_Name = "ctrPersonne"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private Sub cmdValider_Click()
   MsgBox "Vôtre saisie: " & txtNom & " " & txtPrenom
End Sub
