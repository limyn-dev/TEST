VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Test de données"
   ClientHeight    =   3990
   ClientLeft      =   1095
   ClientTop       =   1515
   ClientWidth     =   7365
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3990
   ScaleWidth      =   7365
   Begin VB.CommandButton Command1 
      Caption         =   "Quitter"
      Height          =   375
      Left            =   4800
      TabIndex        =   5
      Top             =   3120
      Width           =   1095
   End
   Begin VB.ListBox List1 
      Height          =   1845
      Left            =   240
      TabIndex        =   2
      Top             =   1320
      Width           =   2775
   End
   Begin VB.Label Label4 
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Left            =   3840
      TabIndex        =   4
      Top             =   1320
      Width           =   3015
   End
   Begin VB.Label Label3 
      Caption         =   "Exemple de donnée"
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
      Left            =   3840
      TabIndex        =   3
      Top             =   1080
      Width           =   2295
   End
   Begin VB.Label Label2 
      Caption         =   "Choisissez un type"
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
      Top             =   1080
      Width           =   1935
   End
   Begin VB.Label Label1 
      Caption         =   "Types de données de base"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   375
      Left            =   2040
      TabIndex        =   0
      Top             =   240
      Width           =   3015
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
    'Ces lignes ajoutent les noms à la zone de liste List1
    List1.AddItem "Entier"
    List1.AddItem "Entier long"
    List1.AddItem "Simple précision"
    List1.AddItem "Double précision"
    List1.AddItem "Monnaie"
    List1.AddItem "Chaîne"
    List1.AddItem "Booléen"
    List1.AddItem "Date"
    List1.AddItem "Variant"
End Sub

Private Sub List1_Click()
    'Section de déclaration des variables
    Dim Birds%, Loan&, Price!, Pie#, Debt@, Dog$, Total
    Dim Flag As Boolean
    Dim Birthday As Date
    
    'Select Case traite le choix de l'utilisateur
    Select Case List1.ListIndex
    Case 0
        Oiseaux% = 37
        Label4.Caption = Oiseaux%
    Case 1
        Charge& = 350000
        Label4.Caption = Charge&
    Case 2
        Prix! = -1234.123
        Label4.Caption = Prix!
    Case 3
        Pi# = 3.1415926535
        Label4.Caption = Pi#
    Case 4
        Dette@ = 299950.95
        Label4.Caption = Dette@
    Case 5
        Chien$ = "Berger allemand"
        Label4.Caption = Chien$
    Case 6  'True vaut -1 dans le code, False vaut 0
        Drapeau = True
        Label4.Caption = Drapeau
    Case 7  'Notez le # et la fonction Format ici
        Anniversaire = #11/19/63#
        Label4.Caption = Format$(Anniversaire, "dddd dd mmmm yyyy")
    Case 8
        Prix = 99.95
        Label4.Caption = Prix
    End Select
End Sub

