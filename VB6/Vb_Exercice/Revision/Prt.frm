VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "Form2"
   ClientHeight    =   4500
   ClientLeft      =   2790
   ClientTop       =   1530
   ClientWidth     =   4350
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4500
   ScaleWidth      =   4350
   Begin VB.Image Image1 
      Height          =   3615
      Left            =   135
      Stretch         =   -1  'True
      Top             =   720
      Width           =   4095
   End
   Begin VB.Label Label1 
      Caption         =   "Image bitmap agrandie"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4185
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub mnuCloseItem_Click()
    Picture1.Picture = LoadPicture("")
    mnuCloseItem.Enabled = False
End Sub

Private Sub mnuExitItem_Click()
    End
End Sub

Private Sub mnuOpenItem_Click()
    CommonDialog1.Filter = "Bitmaps (*.BMP)|*.BMP"
    CommonDialog1.ShowOpen
    Picture1.Picture = LoadPicture(CommonDialog1.filename)
    mnuCloseItem.Enabled = True
End Sub

