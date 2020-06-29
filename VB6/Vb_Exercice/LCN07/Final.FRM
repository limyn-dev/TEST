VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Test d'erreur"
   ClientHeight    =   3915
   ClientLeft      =   1215
   ClientTop       =   1650
   ClientWidth     =   4905
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3915
   ScaleWidth      =   4905
   Begin VB.CommandButton Command1 
      Caption         =   "Tester la disquette"
      Height          =   375
      Left            =   1440
      TabIndex        =   1
      Top             =   1080
      Width           =   1935
   End
   Begin VB.Image Image1 
      BorderStyle     =   1  'Fixed Single
      Height          =   1935
      Left            =   480
      Stretch         =   -1  'True
      Top             =   1680
      Width           =   3855
   End
   Begin VB.Label Label1 
      Height          =   855
      Left            =   600
      TabIndex        =   0
      Top             =   120
      Width           =   3855
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
    On Error GoTo ErreurDisque
    Image1.Picture = LoadPicture("a:\prntout2.wmf")
Exit Sub ' sortie de la procédure

ErreurDisque:
If Err.Number = 71 Then 'lecteur non prêt
    MsgBox ("Vérifiez le lecteur de disquette SVP..."), , _
      "Lecteur non prêt"
    Resume
Else
    MsgBox ("Impossible de trouver Prntout2.wmf sur A:\"), , _
      "Fichier non trouvé"
    Resume Arrêter
End If

Arrêter:
End Sub


