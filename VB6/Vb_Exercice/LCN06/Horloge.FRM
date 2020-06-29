VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Horloge numérique"
   ClientHeight    =   1020
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   3540
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1020
   ScaleWidth      =   3540
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   120
      Top             =   240
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   27.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   840
      TabIndex        =   0
      Top             =   120
      Width           =   2535
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Timer1_Timer()
    Label1.Caption = Time
End Sub


