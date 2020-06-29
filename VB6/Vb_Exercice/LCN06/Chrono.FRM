VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Mot de passe"
   ClientHeight    =   1515
   ClientLeft      =   1905
   ClientTop       =   1965
   ClientWidth     =   3855
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1515
   ScaleWidth      =   3855
   Begin VB.Timer Timer1 
      Interval        =   15000
      Left            =   240
      Top             =   1080
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Test du mot de passe"
      Height          =   375
      Left            =   960
      TabIndex        =   2
      Top             =   1080
      Width           =   1935
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   240
      PasswordChar    =   "*"
      TabIndex        =   0
      Top             =   480
      Width           =   3375
   End
   Begin VB.Label Label1 
      Caption         =   "Tapez votre mot de passe en 15 secondes"
      Height          =   255
      Left            =   240
      TabIndex        =   1
      Top             =   120
      Width           =   3375
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    If Text1.Text = "secret" Then
        Timer1.Enabled = False
        MsgBox ("Bienvenue sur ce PC !")
        End
    Else
        MsgBox ("Désolé, mon ami, je ne vous connais pas.")
    End If
End Sub

Private Sub Timer1_Timer()
    MsgBox ("Désolé, le temps est dépassé.")
    End
End Sub


