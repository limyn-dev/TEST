VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Correcteur orthographique personnel"
   ClientHeight    =   2340
   ClientLeft      =   1245
   ClientTop       =   2775
   ClientWidth     =   6645
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2340
   ScaleWidth      =   6645
   Begin VB.CommandButton Command2 
      Caption         =   "Quitter"
      Height          =   375
      Left            =   4200
      TabIndex        =   3
      Top             =   1800
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Correcteur orthographique"
      Height          =   375
      Left            =   960
      TabIndex        =   2
      Top             =   1800
      Width           =   2175
   End
   Begin VB.TextBox Text1 
      Height          =   855
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   720
      Width           =   6495
   End
   Begin VB.Label Label1 
      Caption         =   "Tapez un ou plusieurs mots dans la zone de texte puis cliquez sur ""Correcteur orthographique"""
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Dim X As Object
    Set X = CreateObject("Word.Application")
    X.Visible = False
    X.Documents.Add
    X.Selection.Text = Text1.Text
    X.ActiveDocument.CheckSpelling
    Text1.Text = X.Selection.Text
    X.ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges
    X.Quit
    
    Set X = Nothing
End Sub


Private Sub Command2_Click()
    End
End Sub


