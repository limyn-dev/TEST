VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Approche de la Terre"
   ClientHeight    =   2910
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   5070
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2910
   ScaleWidth      =   5070
   Begin VB.Image Image1 
      Height          =   480
      Left            =   1320
      Picture         =   "Zoom.frx":0000
      Stretch         =   -1  'True
      Top             =   600
      Width           =   480
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Image1_Click()
    Image1.Height = Image1.Height + 200
    Image1.Width = Image1.Width + 200
End Sub


