VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   855
      Left            =   240
      TabIndex        =   0
      Text            =   "My TextBox"
      Top             =   480
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "My label"
      Height          =   855
      Left            =   2400
      TabIndex        =   1
      Top             =   480
      Width           =   1935
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Text1_Change()
    Label1.Caption = Text1.Text
End Sub
