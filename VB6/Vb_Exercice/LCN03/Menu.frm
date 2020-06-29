VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4140
   ClientLeft      =   1785
   ClientTop       =   1935
   ClientWidth     =   6645
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4140
   ScaleWidth      =   6645
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1920
      TabIndex        =   0
      Top             =   120
      Width           =   2895
   End
   Begin VB.Menu mnuHorloge 
      Caption         =   "&Horloge"
      Begin VB.Menu mnuDateItem 
         Caption         =   "&Date"
      End
      Begin VB.Menu mnuHeureItem 
         Caption         =   "H&eure"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub mnuDateItem_Click()
    Label1.Caption = Date
End Sub

Private Sub mnuHeureItem_Click()
    Label1.Caption = Time
End Sub


