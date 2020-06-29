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
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   65
      Left            =   360
      Top             =   2280
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   4200
      Picture         =   "Anim.frx":0000
      ScaleHeight     =   495
      ScaleWidth      =   495
      TabIndex        =   1
      Top             =   1560
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Image Image6 
      Height          =   480
      Left            =   3480
      Picture         =   "Anim.frx":030A
      Stretch         =   -1  'True
      Top             =   2040
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Image5 
      DragIcon        =   "Anim.frx":0614
      DragMode        =   1  'Automatic
      Height          =   480
      Left            =   2160
      Picture         =   "Anim.frx":091E
      Top             =   840
      Width           =   480
   End
   Begin VB.Image Image4 
      DragIcon        =   "Anim.frx":0C28
      DragMode        =   1  'Automatic
      Height          =   480
      Left            =   1200
      Picture         =   "Anim.frx":0F32
      Top             =   840
      Width           =   480
   End
   Begin VB.Image Image3 
      DragIcon        =   "Anim.frx":123C
      DragMode        =   1  'Automatic
      Height          =   480
      Left            =   240
      Picture         =   "Anim.frx":1546
      Tag             =   "Feu"
      Top             =   1560
      Width           =   480
   End
   Begin VB.Image Image2 
      DragIcon        =   "Anim.frx":1850
      DragMode        =   1  'Automatic
      Height          =   480
      Left            =   240
      Picture         =   "Anim.frx":1B5A
      Top             =   840
      Width           =   480
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   4200
      Picture         =   "Anim.frx":1E64
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
        Picture1.Visible = True
        Timer1.Enabled = True
    End If
End Sub


Private Sub Timer1_Timer()
    If Picture1.Top > 0 Then
        Picture1.Move Picture1.Left - 50, Picture1.Top - 75
    Else
        Picture1.Visible = False
        Timer1.Enabled = False
    End If
End Sub


