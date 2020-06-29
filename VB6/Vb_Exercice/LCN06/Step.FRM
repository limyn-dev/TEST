VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4140
   ClientLeft      =   1785
   ClientTop       =   1515
   ClientWidth     =   6645
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4140
   ScaleWidth      =   6645
   Begin VB.CommandButton Command1 
      Caption         =   "Afficher les icônes"
      Height          =   495
      Left            =   2040
      TabIndex        =   0
      Top             =   3240
      Width           =   2535
   End
   Begin VB.Image Image1 
      BorderStyle     =   1  'Fixed Single
      Height          =   975
      Index           =   28
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   240
      Width           =   975
   End
   Begin VB.Image Image1 
      BorderStyle     =   1  'Fixed Single
      Height          =   975
      Index           =   26
      Left            =   3600
      Stretch         =   -1  'True
      Top             =   240
      Width           =   975
   End
   Begin VB.Image Image1 
      BorderStyle     =   1  'Fixed Single
      Height          =   975
      Index           =   24
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   240
      Width           =   975
   End
   Begin VB.Image Image1 
      BorderStyle     =   1  'Fixed Single
      Height          =   975
      Index           =   22
      Left            =   480
      Stretch         =   -1  'True
      Top             =   240
      Width           =   975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    For i = 22 To 28 Step 2
        Image1(i).Picture = _
          LoadPicture("C:\Vb\Exercice\Lcn06\misc" & i & ".ico")
    Next i
End Sub


