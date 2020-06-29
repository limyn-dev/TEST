VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Opérateurs de base"
   ClientHeight    =   2385
   ClientLeft      =   1665
   ClientTop       =   1755
   ClientWidth     =   6105
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2385
   ScaleWidth      =   6105
   Begin VB.Frame Frame1 
      Caption         =   "Opérateur"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1575
      Left            =   1800
      TabIndex        =   12
      Top             =   360
      Width           =   1815
      Begin VB.OptionButton Option4 
         Caption         =   "Division (/)"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   1080
         Width           =   1575
      End
      Begin VB.OptionButton Option3 
         Caption         =   "Multiplication (*)"
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   840
         Width           =   1575
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Soustraction (-)"
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   600
         Width           =   1575
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Addition (+)"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   360
         Width           =   1575
      End
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   1320
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Quitter"
      Height          =   375
      Left            =   4920
      TabIndex        =   8
      Top             =   1800
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Calculer"
      Height          =   375
      Left            =   3720
      TabIndex        =   7
      Top             =   1800
      Width           =   975
   End
   Begin VB.Label Label4 
      Caption         =   "Résultat"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3840
      TabIndex        =   11
      Top             =   360
      Width           =   1695
   End
   Begin VB.Label Label3 
      Caption         =   "Variable 2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   1080
      Width           =   1455
   End
   Begin VB.Label Label2 
      Caption         =   "Variable 1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   9
      Top             =   240
      Width           =   1455
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  'Fixed Single
      Height          =   495
      Left            =   3840
      TabIndex        =   0
      Top             =   720
      Width           =   1695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
    Dim First, Second       'déclare les variables
    
    First = Val(Text1.Text) 'convertit les nombres
    Second = Val(Text2.Text)
    
    'si premier bouton cliqué, ajoute les nombres
    If Option1.Value = True Then
        Label1.Caption = First + Second
    End If
    'si deuxième bouton cliqué, soustrait
    If Option2.Value = True Then
        Label1.Caption = First - Second
    End If
    'si troisième bouton cliqué, multiplie
    If Option3.Value = True Then
        Label1.Caption = First * Second
    End If
    'si quatrième bouton cliqué, divise
    If Option4.Value = True Then
        Label1.Caption = First / Second
    End If
End Sub

Private Sub Command2_Click()
    End
End Sub


Private Sub Label1_Click()

End Sub


