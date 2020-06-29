VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.1#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4140
   ClientLeft      =   1695
   ClientTop       =   1965
   ClientWidth     =   6645
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4140
   ScaleWidth      =   6645
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   240
      Top             =   3360
      _ExtentX        =   847
      _ExtentY        =   847
      FontSize        =   2,54016e-29
   End
   Begin VB.Image Image1 
      Height          =   2775
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   960
      Width           =   3735
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1920
      TabIndex        =   0
      Top             =   120
      Width           =   2895
   End
   Begin VB.Menu mnuFichier 
      Caption         =   "&Fichier"
      Begin VB.Menu mnuOuvrirItem 
         Caption         =   "&Ouvrir"
      End
      Begin VB.Menu mnuFermerItem 
         Caption         =   "&Fermer"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuQuitterItem 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuHorloge 
      Caption         =   "&Horloge"
      Begin VB.Menu mnuHeureItem 
         Caption         =   "H&eure"
         Shortcut        =   ^H
      End
      Begin VB.Menu mnuDateItem 
         Caption         =   "&Date"
         Shortcut        =   ^D
      End
      Begin VB.Menu mnuTextColorItem 
         Caption         =   "&Couleur du texte..."
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub mnuDateItem_Click()
    Label1.Caption = Date
End Sub

Private Sub mnuFermerItem_Click()
    Image1.Picture = LoadPicture("")
    mnuFermerItem.Enabled = False
End Sub

Private Sub mnuHeureItem_Click()
    Label1.Caption = Time
End Sub


Private Sub mnuOuvrirItem_Click()
    CommonDialog1.Filter = "Métafichiers (*.WMF)|*.WMF"
    CommonDialog1.ShowOpen
    Image1.Picture = LoadPicture(CommonDialog1.filename)
    mnuFermerItem.Enabled = True
End Sub


Private Sub mnuQuitterItem_Click()
    End
End Sub

Private Sub mnuTextColorItem_Click()
    CommonDialog1.Flags = &H1&
    CommonDialog1.ShowColor
    Label1.ForeColor = CommonDialog1.Color
End Sub


