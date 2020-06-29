VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Bienvenue"
   ClientHeight    =   4005
   ClientLeft      =   1575
   ClientTop       =   1515
   ClientWidth     =   6765
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4005
   ScaleWidth      =   6765
   Begin VB.CommandButton Command2 
      Caption         =   "Continuer"
      Height          =   375
      Left            =   3720
      TabIndex        =   3
      Top             =   3000
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Quitter"
      Height          =   375
      Left            =   5280
      TabIndex        =   2
      Top             =   3000
      Width           =   1095
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   """Des produits de qualité pour le bureau et la maison"""
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3480
      TabIndex        =   1
      Top             =   1200
      Width           =   2895
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00FFFF00&
      FillColor       =   &H00FFFF00&
      FillStyle       =   6  'Cross
      Height          =   1335
      Left            =   720
      Shape           =   4  'Rounded Rectangle
      Top             =   2040
      Width           =   1935
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H0000C0C0&
      FillColor       =   &H0000C0C0&
      FillStyle       =   6  'Cross
      Height          =   2295
      Left            =   120
      Top             =   1200
      Width           =   1815
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FF0000&
      BorderWidth     =   5
      X1              =   840
      X2              =   5760
      Y1              =   840
      Y2              =   840
   End
   Begin VB.Label Label1 
      Caption         =   "Les Ecrans de l'Ouest"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   26.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   855
      Left            =   840
      TabIndex        =   0
      Top             =   240
      Width           =   4935
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


