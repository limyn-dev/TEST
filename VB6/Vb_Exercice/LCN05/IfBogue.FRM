VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "IfBogue"
   ClientHeight    =   2985
   ClientLeft      =   1095
   ClientTop       =   1515
   ClientWidth     =   6885
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2985
   ScaleWidth      =   6885
   Begin VB.CommandButton Command2 
      Caption         =   "Quitter"
      Height          =   375
      Left            =   5280
      TabIndex        =   6
      Top             =   1920
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Tester"
      Height          =   375
      Left            =   3840
      TabIndex        =   5
      Top             =   1920
      Width           =   1095
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   840
      TabIndex        =   2
      Top             =   1920
      Width           =   2535
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   840
      TabIndex        =   1
      Text            =   "0"
      Top             =   1080
      Width           =   2535
   End
   Begin VB.Label Label3 
      Caption         =   "Sortie"
      Height          =   255
      Left            =   840
      TabIndex        =   4
      Top             =   1680
      Width           =   2295
   End
   Begin VB.Label Label2 
      Caption         =   "Quel âge avez-vous ?"
      Height          =   255
      Left            =   840
      TabIndex        =   3
      Top             =   840
      Width           =   2295
   End
   Begin VB.Label Label1 
      Caption         =   "Test : Pouvez-vous trouver l'erreur ?"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1680
      TabIndex        =   0
      Top             =   240
      Width           =   3735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
    Age = Text1.Text
    
    If Age > 13 And Age < 20 Then
        Text2.Text = "Vous êtes un adolescent."
    Else
        Text2.Text = "Vous n'êtes pas un adolescent."
    End If
End Sub

Private Sub Command2_Click()
    End
End Sub

