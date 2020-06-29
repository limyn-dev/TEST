VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4140
   ClientLeft      =   1710
   ClientTop       =   1740
   ClientWidth     =   6645
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4140
   ScaleWidth      =   6645
   Begin VB.PictureBox Picture1 
      Height          =   2295
      Left            =   1920
      Picture         =   "Bandit.frx":0000
      ScaleHeight     =   2235
      ScaleWidth      =   4155
      TabIndex        =   6
      Top             =   1680
      Width           =   4215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Fin"
      Height          =   375
      Left            =   360
      TabIndex        =   1
      Top             =   1080
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Jouer"
      Height          =   375
      Left            =   360
      TabIndex        =   0
      Top             =   480
      Width           =   1335
   End
   Begin VB.Label Label4 
      Caption         =   "Bandit Manchot"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   1695
      Left            =   0
      TabIndex        =   5
      Top             =   1680
      Width           =   1815
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   4800
      TabIndex        =   4
      Top             =   480
      Width           =   1215
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3360
      TabIndex        =   3
      Top             =   480
      Width           =   1095
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   1920
      TabIndex        =   2
      Top             =   480
      Width           =   1095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Picture1.Visible = False        ' cacher les pièces
    Label1.Caption = Int(Rnd * 10)  ' nombres aléatoires
    Label2.Caption = Int(Rnd * 10)
    Label3.Caption = Int(Rnd * 10)
    ' Si un chiffre vaut 7, afficher les pièces et émettre un bip
    If (Label1.Caption = 7) Or (Label2.Caption = 7) _
      Or (Label3.Caption = 7) Then
        Picture1.Visible = True
        Beep
    End If
End Sub

Private Sub Command2_Click()
    End
End Sub


