VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   3630
   ClientTop       =   3135
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   495
      Left            =   1080
      TabIndex        =   1
      Top             =   1920
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Height          =   735
      Left            =   960
      TabIndex        =   0
      Top             =   840
      Width           =   2895
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Text1.Text = "Bonjour !"
End Sub
