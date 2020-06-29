VERSION 5.00
Begin VB.Form frmPath 
   Caption         =   "Form1"
   ClientHeight    =   5012
   ClientLeft      =   35
   ClientTop       =   343
   ClientWidth     =   7665
   LinkTopic       =   "Form1"
   ScaleHeight     =   5012
   ScaleWidth      =   7665
   Begin VB.TextBox txtPath 
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Text            =   "Text1"
      Top             =   4440
      Width           =   3615
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   375
      Left            =   3960
      TabIndex        =   2
      Top             =   4440
      Width           =   1815
   End
   Begin VB.FileListBox flePath 
      Height          =   2142
      Left            =   2597
      TabIndex        =   1
      Top             =   98
      Width           =   2499
   End
   Begin VB.DirListBox Dir1 
      Height          =   1932
      Left            =   98
      TabIndex        =   0
      Top             =   98
      Width           =   2499
   End
End
Attribute VB_Name = "frmPath"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public iSelectFic As Boolean
