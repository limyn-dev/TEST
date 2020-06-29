VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Rechercher et remplacer"
   ClientHeight    =   3555
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   5775
   LinkTopic       =   "Form1"
   ScaleHeight     =   3555
   ScaleWidth      =   5775
   Begin VB.TextBox Text3 
      Height          =   375
      Left            =   2880
      TabIndex        =   2
      Top             =   2160
      Width           =   1455
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   1200
      TabIndex        =   1
      Top             =   2160
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Quitter"
      Height          =   375
      Left            =   2880
      TabIndex        =   4
      Top             =   2880
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Remplacer"
      Height          =   375
      Left            =   1320
      TabIndex        =   3
      Top             =   2880
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      Height          =   975
      Left            =   360
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   720
      Width           =   5055
   End
   Begin VB.Label Label3 
      Caption         =   "Remplacer"
      Height          =   255
      Left            =   2880
      TabIndex        =   7
      Top             =   1920
      Width           =   1695
   End
   Begin VB.Label Label2 
      Caption         =   "Rechercher"
      Height          =   255
      Left            =   1200
      TabIndex        =   6
      Top             =   1920
      Width           =   1455
   End
   Begin VB.Label Label1 
      Caption         =   "Saisissez du texte dans la zone, spécifiez les valeurs de recherche/remplace, puis cliquez sur ""Remplacer""."
      Height          =   495
      Left            =   360
      TabIndex        =   5
      Top             =   240
      Width           =   5175
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
Dim X As Object      'crée la variable d'objet Word
Set X = CreateObject("Word.Application")
X.Visible = False    'masque Word
X.Documents.Add      'ouvre un nouveau document
X.Selection.Text = Text1.Text  'copie la zone de texte dans le document

With X.Selection.Find   'lance la fonction de recherche/remplace
    .ClearFormatting    'ignore le formatage
    .Text = Text2.Text  'recherche le texte
    .Replacement.ClearFormatting
    .Replacement.Text = Text3.Text 'remplace le texte
    .Execute Replace:=wdReplaceAll, Forward:=True, _
        Wrap:=wdFindContinue
End With

Text1.Text = X.Selection.Text  'retourne les résultats
X.ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges
X.Quit                         'quitte Word

Set X = Nothing      'libère la variable objet
End Sub

Private Sub Command2_Click()
    End
End Sub



