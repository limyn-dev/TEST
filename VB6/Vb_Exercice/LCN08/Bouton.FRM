VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Boutons graphiques"
   ClientHeight    =   3330
   ClientLeft      =   1440
   ClientTop       =   1980
   ClientWidth     =   6705
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3330
   ScaleWidth      =   6705
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Texte d'exemple"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   27.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   1320
      TabIndex        =   1
      Top             =   1800
      Width           =   3975
   End
   Begin VB.Image Image9 
      Height          =   315
      Left            =   840
      Picture         =   "Bouton.frx":0000
      Top             =   2520
      Visible         =   0   'False
      Width           =   330
   End
   Begin VB.Image Image8 
      Height          =   315
      Left            =   840
      Picture         =   "Bouton.frx":063A
      Top             =   1920
      Visible         =   0   'False
      Width           =   330
   End
   Begin VB.Image Image7 
      Height          =   315
      Left            =   840
      Picture         =   "Bouton.frx":0C74
      Top             =   1320
      Visible         =   0   'False
      Width           =   330
   End
   Begin VB.Image Image6 
      Height          =   330
      Left            =   240
      Picture         =   "Bouton.frx":12AE
      Top             =   2520
      Visible         =   0   'False
      Width           =   345
   End
   Begin VB.Image Image5 
      Height          =   330
      Left            =   240
      Picture         =   "Bouton.frx":1900
      Top             =   1920
      Visible         =   0   'False
      Width           =   345
   End
   Begin VB.Image Image4 
      Height          =   330
      Left            =   240
      Picture         =   "Bouton.frx":1F52
      Top             =   1320
      Visible         =   0   'False
      Width           =   345
   End
   Begin VB.Image Image3 
      Height          =   315
      Left            =   4080
      Picture         =   "Bouton.frx":25A4
      Tag             =   "Relâché"
      Top             =   720
      Width           =   330
   End
   Begin VB.Image Image2 
      Height          =   315
      Left            =   3120
      Picture         =   "Bouton.frx":2BDE
      Tag             =   "Relâché"
      Top             =   720
      Width           =   330
   End
   Begin VB.Image Image1 
      Height          =   315
      Left            =   2160
      Picture         =   "Bouton.frx":3218
      Tag             =   "Relâché"
      Top             =   720
      Width           =   330
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Cliquez sur les boutons pour formater le texte"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   840
      TabIndex        =   0
      Top             =   120
      Width           =   4935
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Image1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Image1.Tag = "Relâché" Then
        Image1.Picture = Image4.Picture
        Label2.FontBold = True
        Image1.Tag = "Enfoncé"
    Else
        Image1.Picture = Image7.Picture
        Label2.FontBold = False
        Image1.Tag = "Relâché"
    End If
End Sub


Private Sub Image2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Image2.Tag = "Relâché" Then
        Image2.Picture = Image5.Picture
        Label2.FontItalic = True
        Image2.Tag = "Enfoncé"
    Else
        Image2.Picture = Image8.Picture
        Label2.FontItalic = False
        Image2.Tag = "Relâché"
    End If
End Sub


Private Sub Image3_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Image3.Tag = "Relâché" Then
        Image3.Picture = Image6.Picture
        Label2.FontUnderline = True
        Image3.Tag = "Enfoncé"
    Else
        Image3.Picture = Image9.Picture
        Label2.FontUnderline = False
        Image3.Tag = "Relâché"
    End If
End Sub


