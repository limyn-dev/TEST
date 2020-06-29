VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3990
   ClientLeft      =   1125
   ClientTop       =   1470
   ClientWidth     =   7365
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3990
   ScaleWidth      =   7365
   Begin VB.CommandButton Command1 
      Caption         =   "Quitter"
      Height          =   375
      Left            =   3120
      TabIndex        =   5
      Top             =   3240
      Width           =   1095
   End
   Begin VB.OLE OLE3 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Class           =   "Paint.Picture"
      DisplayType     =   1  'Icon
      Height          =   855
      Left            =   5040
      OleObjectBlob   =   "Etude.frx":0000
      TabIndex        =   8
      Top             =   1800
      Width           =   1815
   End
   Begin VB.OLE OLE2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Class           =   "Excel.Sheet.8"
      DisplayType     =   1  'Icon
      Height          =   855
      Left            =   2760
      OleObjectBlob   =   "Etude.frx":1B618
      TabIndex        =   7
      Top             =   1800
      Width           =   1815
   End
   Begin VB.OLE OLE1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Class           =   "Word.Document.8"
      DisplayType     =   1  'Icon
      Height          =   855
      Left            =   480
      OleObjectBlob   =   "Etude.frx":1CC30
      TabIndex        =   6
      Top             =   1800
      Width           =   1695
   End
   Begin VB.Label Label5 
      Caption         =   "Plans du site"
      Height          =   255
      Left            =   5040
      TabIndex        =   4
      Top             =   1440
      Width           =   1215
   End
   Begin VB.Label Label4 
      Caption         =   "Calculs d'investissement"
      Height          =   255
      Left            =   2760
      TabIndex        =   3
      Top             =   1440
      Width           =   1935
   End
   Begin VB.Label Label3 
      Caption         =   "Notes sur l'étude"
      Height          =   255
      Left            =   480
      TabIndex        =   2
      Top             =   1440
      Width           =   1575
   End
   Begin VB.Label Label2 
      Caption         =   "Outil de construction utilisant Word, Excel et Paint"
      Height          =   255
      Left            =   240
      TabIndex        =   1
      Top             =   720
      Width           =   3735
   End
   Begin VB.Label Label1 
      Caption         =   "Etude d'investissement"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   3735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
    End
End Sub


Private Sub OLE1_Updated(Code As Integer)

End Sub


