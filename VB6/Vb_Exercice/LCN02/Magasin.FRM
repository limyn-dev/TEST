VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Magasin en ligne"
   ClientHeight    =   4785
   ClientLeft      =   570
   ClientTop       =   1530
   ClientWidth     =   8010
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4785
   ScaleWidth      =   8010
   Begin VB.CommandButton Command1 
      Caption         =   "Quitter"
      Height          =   375
      Left            =   3000
      TabIndex        =   13
      Top             =   4200
      Width           =   975
   End
   Begin VB.ListBox List1 
      Height          =   1065
      Left            =   2400
      TabIndex        =   11
      Top             =   1560
      Width           =   2055
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   2400
      TabIndex        =   10
      Text            =   "Moyen de réglement"
      Top             =   3120
      Width           =   2055
   End
   Begin VB.Frame Frame2 
      Caption         =   "Equipement de bureau"
      Height          =   1575
      Left            =   240
      TabIndex        =   6
      Top             =   3000
      Width           =   1935
      Begin VB.CheckBox Check3 
         Caption         =   "Photocopieur"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   1080
         Width           =   1455
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Calculatrice"
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   720
         Width           =   1455
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Répondeur"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   360
         Width           =   1695
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Ordinateur (requis)"
      Height          =   1575
      Left            =   240
      TabIndex        =   2
      Top             =   1200
      Width           =   1935
      Begin VB.OptionButton Option1 
         Caption         =   "Portable"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   5
         Top             =   1080
         Width           =   1455
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Macintosh"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   4
         Top             =   720
         Width           =   1575
      End
      Begin VB.OptionButton Option1 
         Caption         =   "PC"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   3
         Top             =   360
         Width           =   1455
      End
   End
   Begin VB.Label Label4 
      Caption         =   "Produits commandés"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008080&
      Height          =   375
      Left            =   4920
      TabIndex        =   14
      Top             =   480
      Width           =   2655
   End
   Begin VB.Image Image6 
      Height          =   1095
      Left            =   6360
      Stretch         =   -1  'True
      Top             =   3600
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Image Image5 
      Height          =   1095
      Left            =   4800
      Stretch         =   -1  'True
      Top             =   3600
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Image Image4 
      Height          =   1095
      Left            =   6360
      Stretch         =   -1  'True
      Top             =   2400
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Image Image3 
      Height          =   1095
      Left            =   4800
      Stretch         =   -1  'True
      Top             =   2400
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Image Image2 
      Height          =   1215
      Left            =   6360
      Stretch         =   -1  'True
      Top             =   1080
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Image Image1 
      Height          =   1215
      Left            =   4800
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   1335
   End
   Begin VB.Label Label3 
      Caption         =   "Périphérique (1 seul)"
      Height          =   255
      Left            =   2400
      TabIndex        =   12
      Top             =   1320
      Width           =   1815
   End
   Begin VB.Label Label2 
      Caption         =   "Commandez vos équipements de bureau en utilisant les cases à cocher, les cases d'option et les zones de listes."
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   600
      Width           =   4575
   End
   Begin VB.Label Label1 
      Caption         =   "Le magasin en ligne"
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
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   3975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
    If Check1.Value = 1 Then
        Image2.Picture = _
          LoadPicture("C:\Vb\Exercice\Lcn02\answmach.wmf")
        Image2.Visible = True
    Else
        Image2.Visible = False
    End If
End Sub

Private Sub Check2_Click()
    If Check2.Value = 1 Then
        Image4.Picture = LoadPicture("C:\Vb\Exercice\Lcn02\calcultr.wmf")
        Image4.Visible = True
    Else
        Image4.Visible = False
    End If
End Sub

Private Sub Check3_Click()
    If Check3.Value = 1 Then
        Image6.Picture = LoadPicture("C:\Vb\Exercice\Lcn02\copymach.wmf")
        Image6.Visible = True
    Else
        Image6.Visible = False
    End If
End Sub

Private Sub Combo1_Click()
    Select Case Combo1.ListIndex
    Case 0
        Image5.Picture = LoadPicture("C:\Vb\Exercice\Lcn02\dollar.wmf")
    Case 1
        Image5.Picture = LoadPicture("C:\Vb\Exercice\Lcn02\check.wmf")
    Case 2
        Image5.Picture = LoadPicture("C:\Vb\Exercice\Lcn02\poundbag.wmf")
    End Select
    Image5.Visible = True
End Sub

Private Sub Command2_Click()
    End
End Sub


Private Sub Command1_Click()
    End
End Sub

Private Sub Form_Load()
    Image1.Picture = LoadPicture("C:\Vb\Exercice\Lcn02\pcomputr.wmf")
    List1.AddItem "2e disque dur"
    List1.AddItem "Imprimante"
    List1.AddItem "Antenne satellite"
    
    Combo1.AddItem "Comptant"
    Combo1.AddItem "Chèque"
    Combo1.AddItem "Livres"
End Sub





Private Sub Label1_Click()

End Sub

Private Sub List1_Click()
    Select Case List1.ListIndex
    Case 0
        Image3.Picture = _
          LoadPicture("C:\Vb\Exercice\Lcn02\harddisk.wmf")
    Case 1
        Image3.Picture = _
          LoadPicture("C:\Vb\Exercice\Lcn02\printer.wmf")
    Case 2
        Image3.Picture = _
          LoadPicture("C:\Vb\Exercice\Lcn02\satedish.wmf")
    End Select
    Image3.Visible = True
End Sub

Private Sub Option1_Click(Index As Integer)
    Select Case Index
    Case 0
        Image1.Picture = LoadPicture("C:\Vb\Exercice\Lcn02\pcomputr.wmf")
    Case 1
        Image1.Picture = LoadPicture("C:\Vb\Exercice\Lcn02\computer.wmf")
    Case 2
        Image1.Picture = LoadPicture("C:\Vb\Exercice\Lcn02\laptop1.wmf")
    End Select
End Sub

