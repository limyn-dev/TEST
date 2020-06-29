VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.1#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "Explorateur de textes"
   ClientHeight    =   4005
   ClientLeft      =   1125
   ClientTop       =   1770
   ClientWidth     =   5910
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4005
   ScaleWidth      =   5910
   Begin VB.TextBox txtFichier 
      Enabled         =   0   'False
      Height          =   3135
      Left            =   240
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   600
      Width           =   5415
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   5280
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      FontSize        =   2,54016e-29
   End
   Begin VB.Label lblFichier 
      Caption         =   "Chargez un fichier texte avec la commande Ouvrir"
      Height          =   255
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   3975
   End
   Begin VB.Menu mnuFichier 
      Caption         =   "&Fichier"
      Begin VB.Menu mnuItemOuvrir 
         Caption         =   "&Ouvrir..."
      End
      Begin VB.Menu mnuItemFermer 
         Caption         =   "&Fermer"
         Enabled         =   0   'False
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
Private Sub mnuItemFermer_Click()
    txtFichier.Text = ""            'vider la zone texte
    lblFichier.Caption = "Chargez un fichier texte avec la commande Ouvrir."
    mnuItemFermer.Enabled = False   'griser la commande Fermer
    mnuItemOuvrir.Enabled = True    'valider la commande Ouvrir
    txtFichier.Enabled = False      'invalider la zone texte
End Sub

Private Sub mnuItemQuitter_Click()
    End
End Sub

Private Sub mnuItemOuvrir_Click()
    Wrap$ = Chr$(13) + Chr$(10)  'caractère de retour à la ligne
    CommonDialog1.Filter = "Fichiers Texte (*.TXT)|*.TXT"
    CommonDialog1.ShowOpen       'affiche boîte de dialogue Ouvrir
    If CommonDialog1.filename <> "" Then
        Form1.MousePointer = 11  'affiche le sablier
        Open CommonDialog1.filename For Input As #1
        On Error GoTo TropGros:  'annonce le gestionnaire d'erreur
        Do Until EOF(1)          'lit le fichier
            Line Input #1, LineOfText$
            AllText$ = AllText$ & LineOfText$ & Wrap$
        Loop
        lblFichier.Caption = CommonDialog1.filename
        txtFichier.Text = AllText$  'affiche fichier
        txtFichier.Enabled = True
        mnuItemFermer.Enabled = True
        mnuItemOuvrir.Enabled = False 'autorise le défilement
CleanUp:
        Form1.MousePointer = 0   'RAZ souris
        Close #1                 'fermer le fichier
    End If
    Exit Sub

TropGros:             'gestionnaire d'erreur
    MsgBox ("Le fichier est trop grand.")
    Resume CleanUp: 'alors nettoyer
End Sub


