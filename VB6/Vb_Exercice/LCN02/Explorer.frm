VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4065
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6435
   LinkTopic       =   "Form1"
   ScaleHeight     =   4065
   ScaleWidth      =   6435
   StartUpPosition =   3  'Windows Default
   Begin VB.FileListBox File1 
      Height          =   1065
      Left            =   240
      Pattern         =   "*.bmp;*.wmf;*.ico"
      TabIndex        =   2
      Top             =   2280
      Width           =   2055
   End
   Begin VB.DirListBox Dir1 
      Height          =   1155
      Left            =   240
      TabIndex        =   1
      Top             =   840
      Width           =   2055
   End
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   2055
   End
   Begin VB.Image Image1 
      BorderStyle     =   1  'Fixed Single
      Height          =   3135
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   240
      Width           =   3255
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Dir1_Change()
File1.Path = Dir1.Path
End Sub

Private Sub Drive1_Change()
Dir1.Path = Drive1.Drive
End Sub

Private Sub File1_Click()
SelectedFile = File1.Path & "\" & File1.filename
Image1.Picture = LoadPicture(SelectedFile)
End Sub
