VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Explorateur de données"
   ClientHeight    =   4620
   ClientLeft      =   1095
   ClientTop       =   1515
   ClientWidth     =   5910
   LinkTopic       =   "Form1"
   ScaleHeight     =   4620
   ScaleWidth      =   5910
   Begin VB.CommandButton cmdQuit 
      Caption         =   "Quitter"
      Height          =   375
      Left            =   4080
      TabIndex        =   7
      Top             =   3960
      Width           =   855
   End
   Begin VB.CommandButton cmdFind 
      Caption         =   "Chercher"
      Height          =   375
      Left            =   840
      TabIndex        =   6
      Top             =   3960
      Width           =   855
   End
   Begin VB.TextBox txtYear 
      DataField       =   "Year Published"
      DataSource      =   "datBiblio"
      Height          =   285
      Left            =   1320
      TabIndex        =   11
      Top             =   3360
      Width           =   975
   End
   Begin VB.TextBox txtISBN 
      DataField       =   "ISBN"
      DataSource      =   "datBiblio"
      Height          =   285
      Left            =   1320
      TabIndex        =   10
      Top             =   2880
      Width           =   1815
   End
   Begin VB.TextBox txtInfo 
      DataField       =   "Description"
      DataSource      =   "datBiblio"
      Height          =   285
      Left            =   1320
      TabIndex        =   9
      Top             =   2400
      Width           =   4335
   End
   Begin VB.TextBox txtTitle 
      DataField       =   "Title"
      DataSource      =   "datBiblio"
      Height          =   285
      Left            =   1320
      TabIndex        =   8
      Top             =   1920
      Width           =   4335
   End
   Begin VB.Data datBiblio 
      Caption         =   "Biblio.mdb"
      Connect         =   "Access"
      DatabaseName    =   "D:\DevStudio\VB\Biblio.mdb"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   300
      Left            =   1560
      Options         =   0
      ReadOnly        =   -1  'True
      RecordsetType   =   0  'Table
      RecordSource    =   "Titles"
      Top             =   1320
      Width           =   2415
   End
   Begin VB.Label lblInfo 
      Caption         =   "Description:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   2400
      Width           =   1095
   End
   Begin VB.Label lblISBN 
      Caption         =   "ISBN:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   1
      Top             =   2880
      Width           =   615
   End
   Begin VB.Label lblYear 
      Caption         =   "Année:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   3360
      Width           =   495
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00800000&
      BorderWidth     =   2
      X1              =   240
      X2              =   5400
      Y1              =   1080
      Y2              =   1080
   End
   Begin VB.Label lblTitle 
      Caption         =   "Titre:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   3
      Top             =   1920
      Width           =   975
   End
   Begin VB.Image imgBook 
      Height          =   735
      Left            =   4920
      Picture         =   "Chercher.frx":0000
      Stretch         =   -1  'True
      Top             =   120
      Width           =   735
   End
   Begin VB.Label lblDescription 
      Caption         =   "Une liste de livres sur les bases de données et leur programmation"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   600
      Width           =   4695
   End
   Begin VB.Label lblHead 
      Caption         =   "La Base des Bases"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   495
      Left            =   240
      TabIndex        =   5
      Top             =   120
      Width           =   4455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdFind_Click()
    prompt$ = "Tapez le titre (complet) du livre :"
    'obtenir la chaîne pour rechercher sur le champ Title
    SearchStr$ = InputBox(prompt$, "Chercher un livre")
    datBiblio.Recordset.Index = "Title"   'table Title
    datBiblio.Recordset.Seek "=", SearchStr$   'et recherche
    If datBiblio.Recordset.NoMatch Then  'si pas de correspondance
        MsgBox ("Désolé. Je ne trouve pas votre livre.")
        datBiblio.Recordset.MoveFirst 'aller au premier livre
    End If
End Sub

Private Sub cmdQuit_Click()
    End
End Sub

