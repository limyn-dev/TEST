VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.1#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "Note Express"
   ClientHeight    =   4230
   ClientLeft      =   1095
   ClientTop       =   1800
   ClientWidth     =   6720
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4230
   ScaleWidth      =   6720
   Begin VB.TextBox txtNote 
      Height          =   3015
      Left            =   360
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   600
      Width           =   6015
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   360
      Top             =   3720
      _ExtentX        =   847
      _ExtentY        =   847
      FontSize        =   2,54016e-29
   End
   Begin VB.Label Label1 
      Caption         =   "Tapez une note et enregistrez-la sur disque."
      Height          =   255
      Left            =   360
      TabIndex        =   1
      Top             =   240
      Width           =   3375
   End
   Begin VB.Menu mnuFichier 
      Caption         =   "&Fichier"
      Begin VB.Menu mnuItemEnregistrer 
         Caption         =   "&Enregistrer sous..."
      End
      Begin VB.Menu mnuItemDate 
         Caption         =   "Insérer la &Date"
      End
      Begin VB.Menu mnuItemQuitter 
         Caption         =   "&Quitter"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()

End Sub


Private Sub Label1_Click()

End Sub


Private Sub mnuFichier_Click()

End Sub

Private Sub mnuItemDate_Click()
    Wrap$ = Chr$(13) & Chr$(10) 'ajoute la date
    txtNote.Text = Date$ & Wrap$ & txtNote.Text
End Sub

Private Sub mnuItemQuitter_Click()
    End
End Sub

Private Sub mnuItemEnregistrer_Click()
'le fichier en entier est dans une chaîne
    CommonDialog1.Filter = "Fichiers Texte (*.TXT)|*.TXT"
    CommonDialog1.ShowSave      'affiche boîte de dialogue Enregistrer sous
    If CommonDialog1.filename <> "" Then
        Open CommonDialog1.filename For Output As #1
        Print #1, txtNote.Text  'enregistre le fichier
        Close #1                'ferme le fichier
    End If
End Sub

Private Sub txtNote_Change()

End Sub


