VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "Définition"
   ClientHeight    =   1545
   ClientLeft      =   1395
   ClientTop       =   3645
   ClientWidth     =   5340
   LinkTopic       =   "Form2"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1545
   ScaleWidth      =   5340
   Begin VB.CommandButton Command2 
      Caption         =   "Imprimer"
      Height          =   375
      Left            =   2880
      TabIndex        =   3
      Top             =   240
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Fermer"
      Height          =   375
      Left            =   4080
      TabIndex        =   2
      Top             =   240
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   1560
      TabIndex        =   1
      TabStop         =   0   'False
      Text            =   "Text1"
      Top             =   840
      Width           =   3495
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1560
      TabIndex        =   0
      Top             =   240
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   975
      Left            =   120
      Picture         =   "Printer.frx":0000
      Stretch         =   -1  'True
      Top             =   120
      Width           =   1095
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Form2.Hide
End Sub


Private Sub Command2_Click()
    Printer.FontName = "Arial"
    Printer.FontSize = 14
    Printer.FontBold = True
    Printer.Print Label1.Caption
    Printer.FontBold = False
    Printer.Print Text1.Text
    Printer.EndDoc
End Sub


