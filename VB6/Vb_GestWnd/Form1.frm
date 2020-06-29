VERSION 5.00
Begin VB.Form forFenetre 
   Caption         =   "Fenêtre"
   ClientHeight    =   3510
   ClientLeft      =   60
   ClientTop       =   375
   ClientWidth     =   4470
   LinkTopic       =   "Form1"
   ScaleHeight     =   3510
   ScaleWidth      =   4470
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "Fenêtre"
      Height          =   630
      Left            =   120
      TabIndex        =   6
      Top             =   120
      Width           =   4215
      Begin VB.ComboBox cboWndTop 
         Height          =   315
         Left            =   100
         TabIndex        =   7
         Top             =   200
         Width           =   4000
      End
   End
   Begin VB.Frame frmMsh 
      Caption         =   "Message"
      Height          =   2415
      Left            =   1920
      TabIndex        =   0
      Top             =   840
      Width           =   2415
      Begin VB.OptionButton optMsg 
         Caption         =   "WM_SETTEXT"
         Height          =   400
         Index           =   3
         Left            =   100
         TabIndex        =   5
         Top             =   1400
         Width           =   2200
      End
      Begin VB.OptionButton optMsg 
         Caption         =   "WM_GETTEXTLENGTH"
         Height          =   400
         Index           =   2
         Left            =   100
         TabIndex        =   4
         Top             =   1005
         Width           =   2200
      End
      Begin VB.OptionButton optMsg 
         Caption         =   "WM_GETTEXT"
         Height          =   400
         Index           =   1
         Left            =   100
         TabIndex        =   3
         Top             =   600
         Width           =   2200
      End
      Begin VB.OptionButton optMsg 
         Caption         =   "WM_CLOSE"
         Height          =   400
         Index           =   0
         Left            =   100
         TabIndex        =   2
         Top             =   200
         Width           =   2200
      End
      Begin VB.CommandButton cmdMsg 
         Caption         =   "Envoi"
         Height          =   400
         Left            =   100
         TabIndex        =   1
         Top             =   1800
         Width           =   2200
      End
   End
End
Attribute VB_Name = "forFenetre"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Membres §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

Dim wndTop As CWndsClass



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Gestion de l'instance §§§§§§§§§§§§§§§§§§§§§§§§§§§

Private Sub Form_Initialize()

    ' Création de la liste des windows class au top
    Set wndTop = New CWndsClass
    
End Sub

Private Sub Form_Terminate()

    ' Suppression de la liste des windowsClass
    Set wndTop = Nothing
    
End Sub

Private Sub Form_Load()
    Dim wnd As CWndClass
    
    ' Chargement de la combobox avec les textes des windows class
    For Each wnd In wintop
        cboWndTop.AddItem wnd
    Next wnd
    
End Sub

