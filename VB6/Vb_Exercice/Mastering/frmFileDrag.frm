VERSION 5.00
Begin VB.Form frmFileDrag 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lstTarget 
      Height          =   1620
      Left            =   2760
      TabIndex        =   4
      Top             =   840
      Width           =   1815
   End
   Begin VB.FileListBox filSource 
      DragIcon        =   "frmFileDrag.frx":0000
      Height          =   1065
      Left            =   240
      TabIndex        =   1
      Top             =   1920
      Width           =   1935
   End
   Begin VB.DirListBox dirDirectories 
      Height          =   1215
      Left            =   240
      TabIndex        =   0
      Top             =   360
      Width           =   1935
   End
   Begin VB.Image imgInvalid 
      Height          =   480
      Left            =   3720
      Picture         =   "frmFileDrag.frx":0442
      Top             =   120
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgValid 
      Height          =   480
      Left            =   2640
      Picture         =   "frmFileDrag.frx":0884
      Top             =   120
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Label lblFileNameL 
      Caption         =   "&File Name"
      Height          =   255
      Left            =   240
      TabIndex        =   3
      Top             =   1680
      Width           =   1935
   End
   Begin VB.Label lblDirectory 
      Caption         =   "&Directory"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   120
      Width           =   1935
   End
End
Attribute VB_Name = "frmFileDrag"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub dirDirectories_Change()
    filSource.Path = dirDirectories.Path
End Sub


Private Sub filSource_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If filSource.FileName <> "" Then
        filSource.Drag vbBeginDrag
    End If
End Sub

Private Sub lstTarget_DragDrop(Source As Control, X As Single, Y As Single)
    lstTarget.AddItem filSource.FileName
End Sub

Private Sub lstTarget_DragOver(Source As Control, X As Single, Y As Single, State As Integer)
    If State = vbEnter Then
        filSource.DragIcon = imgValid.Picture
    ElseIf State = vbLeave Then
        filSource.DragIcon = imgInalid.Picture
    End If
End Sub
