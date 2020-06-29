VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3990
   ClientLeft      =   1095
   ClientTop       =   1515
   ClientWidth     =   7365
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3990
   ScaleWidth      =   7365
   Begin VB.CommandButton Command1 
      Caption         =   "Quitter"
      Height          =   375
      Left            =   3000
      TabIndex        =   5
      Top             =   3360
      Width           =   1095
   End
   Begin VB.ListBox List1 
      Height          =   1455
      Left            =   360
      TabIndex        =   0
      Top             =   1200
      Width           =   2295
   End
   Begin VB.Label Label4 
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H00000080&
      Height          =   375
      Left            =   3360
      TabIndex        =   4
      Top             =   1200
      Width           =   3015
   End
   Begin VB.Label Label3 
      Height          =   255
      Left            =   3360
      TabIndex        =   3
      Top             =   960
      Width           =   2895
   End
   Begin VB.Label Label2 
      Caption         =   "Choisissez un pays"
      Height          =   255
      Left            =   360
      TabIndex        =   2
      Top             =   960
      Width           =   2295
   End
   Begin VB.Label Label1 
      Caption         =   "Programme international de bienvenue"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1440
      TabIndex        =   1
      Top             =   240
      Width           =   4695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    End
End Sub

Private Sub Form_Load()
    List1.AddItem "Angleterre"
    List1.AddItem "Allemagne"
    List1.AddItem "France"
    List1.AddItem "Italie"
End Sub

Private Sub List1_Click()
    Label3.Caption = List1.Text
    Select Case List1.ListIndex
    Case 0
        Label4.Caption = "Hello, Programmer"
    Case 1
        Label4.Caption = "Hallo, Programmierer"
    Case 2
        Label4.Caption = "Salut, Programmeur !"
    Case 3
        Label4.Caption = "Ciao, programmatori"
    End Select
End Sub

