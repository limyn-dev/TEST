VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Baril"
   ClientHeight    =   2910
   ClientLeft      =   1545
   ClientTop       =   1530
   ClientWidth     =   5235
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2910
   ScaleWidth      =   5235
   Begin VB.Image Image6 
      Height          =   480
      Left            =   3480
      Picture         =   "Baril.frx":0000
      Stretch         =   -1  'True
      Top             =   2040
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Image5 
      DragIcon        =   "Baril.frx":030A
      DragMode        =   1  'Automatic
      Height          =   480
      Left            =   2160
      Picture         =   "Baril.frx":0614
      Top             =   840
      Width           =   480
   End
   Begin VB.Image Image4 
      DragIcon        =   "Baril.frx":091E
      DragMode        =   1  'Automatic
      Height          =   480
      Left            =   1200
      Picture         =   "Baril.frx":0C28
      Top             =   840
      Width           =   480
   End
   Begin VB.Image Image3 
      DragIcon        =   "Baril.frx":0F32
      DragMode        =   1  'Automatic
      Height          =   480
      Left            =   240
      Picture         =   "Baril.frx":123C
      Tag             =   "Feu"
      Top             =   1560
      Width           =   480
   End
   Begin VB.Image Image2 
      DragIcon        =   "Baril.frx":1546
      DragMode        =   1  'Automatic
      Height          =   480
      Left            =   240
      Picture         =   "Baril.frx":1850
      Top             =   840
      Width           =   480
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   4200
      Picture         =   "Baril.frx":1B5A
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   480
   End
   Begin VB.Label Label1 
      Caption         =   "Prenez chaque objet et déposez-le dans le baril."
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   840
      TabIndex        =   0
      Top             =   240
      Width           =   4095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Image1_DragDrop(Source As Control, X As Single, Y As Single)
    Source.Visible = False
    If Source.Tag = "Feu" Then
        Image1.Picture = Image6.Picture
    End If
End Sub


