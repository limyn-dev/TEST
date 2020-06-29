VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "SIE des talents"
   ClientHeight    =   5805
   ClientLeft      =   720
   ClientTop       =   1500
   ClientWidth     =   8730
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5805
   ScaleWidth      =   8730
   Begin VB.CommandButton Command1 
      Caption         =   "Quitter"
      Height          =   375
      Left            =   6000
      TabIndex        =   6
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Data Data1 
      Caption         =   "Talents"
      Connect         =   "Access"
      DatabaseName    =   "C:\Vb5\Exercice\Lcn10\Talent.mdb"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   5520
      Options         =   0
      ReadOnly        =   -1  'True
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "Artists"
      Top             =   1920
      Width           =   2175
   End
   Begin VB.TextBox Text5 
      DataField       =   "WorkPhone"
      DataSource      =   "Data1"
      Height          =   375
      Left            =   3000
      TabIndex        =   5
      Top             =   2400
      Width           =   2295
   End
   Begin VB.TextBox Text4 
      DataField       =   "State"
      DataSource      =   "Data1"
      Height          =   375
      Left            =   4440
      TabIndex        =   4
      Top             =   1920
      Width           =   855
   End
   Begin VB.TextBox Text3 
      DataField       =   "City"
      DataSource      =   "Data1"
      Height          =   375
      Left            =   3000
      TabIndex        =   3
      Top             =   1920
      Width           =   1335
   End
   Begin VB.TextBox Text2 
      DataField       =   "Address"
      DataSource      =   "Data1"
      Height          =   375
      Left            =   3000
      TabIndex        =   2
      Top             =   1440
      Width           =   3615
   End
   Begin VB.TextBox Text1 
      DataField       =   "Name"
      DataSource      =   "Data1"
      Height          =   375
      Left            =   3000
      TabIndex        =   1
      Top             =   960
      Width           =   3615
   End
   Begin VB.OLE OLE2 
      Class           =   "Excel.Sheet.5"
      Height          =   2655
      Left            =   3960
      OleObjectBlob   =   "Talent.frx":0000
      SourceDoc       =   "C:\VB\EXERCICE\LCN10\SALES_95.XLS!Sheet1![SALES_95.XLS]Sheet1 Graphique 2"
      TabIndex        =   8
      Top             =   3000
      Width           =   4575
   End
   Begin VB.OLE OLE1 
      Class           =   "Excel.Sheet.5"
      Height          =   2655
      Left            =   120
      OleObjectBlob   =   "Talent.frx":2C18
      SourceDoc       =   "C:\Vb\Exercice\Lcn10\Sales_95.xls"
      TabIndex        =   7
      Top             =   3000
      Width           =   3495
   End
   Begin VB.Image Image1 
      BorderStyle     =   1  'Fixed Single
      Height          =   1815
      Left            =   840
      Picture         =   "Talent.frx":61E0
      Stretch         =   -1  'True
      Top             =   960
      Width           =   1935
   End
   Begin VB.Label Label1 
      Caption         =   "Dénicheur de talents de Seattle Beat"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   615
      Left            =   480
      TabIndex        =   0
      Top             =   120
      Width           =   7215
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


Private Sub Form_Load()
    OLE1.Update
    OLE2.Update
End Sub


