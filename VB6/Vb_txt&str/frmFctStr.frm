VERSION 5.00
Begin VB.Form frmFctStr 
   Caption         =   "Form1"
   ClientHeight    =   9000
   ClientLeft      =   48
   ClientTop       =   384
   ClientWidth     =   6636
   LinkTopic       =   "Form1"
   ScaleHeight     =   9000
   ScaleWidth      =   6636
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdRunFct 
      Caption         =   "Executer fct"
      Height          =   372
      Left            =   5280
      TabIndex        =   32
      Top             =   6240
      Width           =   1212
   End
   Begin VB.TextBox txtInfo 
      Height          =   2532
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   31
      Top             =   6240
      Width           =   5052
   End
   Begin VB.Frame fraTxtBox 
      Caption         =   "Chaines de caractères"
      Height          =   6015
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6375
      Begin VB.TextBox txtSaisie 
         Height          =   360
         Index           =   3
         Left            =   3120
         TabIndex        =   15
         Top             =   960
         Width           =   3000
      End
      Begin VB.TextBox txtSaisie 
         Height          =   360
         Index           =   2
         Left            =   3120
         TabIndex        =   14
         Top             =   600
         Width           =   3000
      End
      Begin VB.TextBox txtSaisie 
         Height          =   360
         Index           =   1
         Left            =   3120
         TabIndex        =   13
         Top             =   240
         Width           =   3000
      End
      Begin VB.TextBox txtSaisie 
         Height          =   360
         Index           =   4
         Left            =   3120
         TabIndex        =   12
         Top             =   1320
         Width           =   3000
      End
      Begin VB.TextBox txtSaisie 
         Height          =   360
         Index           =   5
         Left            =   3120
         TabIndex        =   11
         Top             =   1680
         Width           =   3000
      End
      Begin VB.TextBox txtSaisie 
         Height          =   360
         Index           =   6
         Left            =   3120
         TabIndex        =   10
         Top             =   2040
         Width           =   3000
      End
      Begin VB.TextBox txtSaisie 
         Height          =   360
         Index           =   7
         Left            =   3120
         TabIndex        =   9
         Top             =   2385
         Width           =   3000
      End
      Begin VB.TextBox txtSaisie 
         Height          =   360
         Index           =   11
         Left            =   3120
         TabIndex        =   8
         Top             =   3870
         Width           =   3000
      End
      Begin VB.TextBox txtSaisie 
         Height          =   360
         Index           =   10
         Left            =   3120
         TabIndex        =   7
         Top             =   3510
         Width           =   3000
      End
      Begin VB.TextBox txtSaisie 
         Height          =   360
         Index           =   9
         Left            =   3120
         TabIndex        =   6
         Top             =   3150
         Width           =   3000
      End
      Begin VB.TextBox txtSaisie 
         Height          =   360
         Index           =   8
         Left            =   3120
         TabIndex        =   5
         Top             =   2790
         Width           =   3000
      End
      Begin VB.TextBox txtSaisie 
         Height          =   360
         Index           =   15
         Left            =   3120
         TabIndex        =   4
         Top             =   5352
         Width           =   3000
      End
      Begin VB.TextBox txtSaisie 
         Height          =   360
         Index           =   14
         Left            =   3120
         TabIndex        =   3
         Top             =   4980
         Width           =   3000
      End
      Begin VB.TextBox txtSaisie 
         Height          =   360
         Index           =   13
         Left            =   3120
         TabIndex        =   2
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtSaisie 
         Height          =   360
         Index           =   12
         Left            =   3120
         TabIndex        =   1
         Top             =   4275
         Width           =   3000
      End
      Begin VB.Label lblSaisie 
         Height          =   360
         Index           =   3
         Left            =   120
         TabIndex        =   30
         Top             =   960
         Width           =   3000
      End
      Begin VB.Label lblSaisie 
         Height          =   360
         Index           =   2
         Left            =   120
         TabIndex        =   29
         Top             =   600
         Width           =   3000
      End
      Begin VB.Label lblSaisie 
         Height          =   396
         Index           =   1
         Left            =   120
         TabIndex        =   28
         Top             =   240
         Width           =   3000
      End
      Begin VB.Label lblSaisie 
         Height          =   360
         Index           =   4
         Left            =   120
         TabIndex        =   27
         Top             =   1320
         Width           =   3000
      End
      Begin VB.Label lblSaisie 
         Height          =   360
         Index           =   5
         Left            =   120
         TabIndex        =   26
         Top             =   1680
         Width           =   3000
      End
      Begin VB.Label lblSaisie 
         Height          =   360
         Index           =   6
         Left            =   120
         TabIndex        =   25
         Top             =   2040
         Width           =   3000
      End
      Begin VB.Label lblSaisie 
         Height          =   360
         Index           =   7
         Left            =   120
         TabIndex        =   24
         Top             =   2400
         Width           =   3000
      End
      Begin VB.Label lblSaisie 
         Height          =   360
         Index           =   11
         Left            =   120
         TabIndex        =   23
         Top             =   3870
         Width           =   3000
      End
      Begin VB.Label lblSaisie 
         Height          =   360
         Index           =   10
         Left            =   120
         TabIndex        =   22
         Top             =   3510
         Width           =   3000
      End
      Begin VB.Label lblSaisie 
         Height          =   360
         Index           =   9
         Left            =   120
         TabIndex        =   21
         Top             =   3135
         Width           =   3000
      End
      Begin VB.Label lblSaisie 
         Height          =   360
         Index           =   8
         Left            =   120
         TabIndex        =   20
         Top             =   2790
         Width           =   3000
      End
      Begin VB.Label lblSaisie 
         Height          =   360
         Index           =   15
         Left            =   120
         TabIndex        =   19
         Top             =   5355
         Width           =   3000
      End
      Begin VB.Label lblSaisie 
         Height          =   360
         Index           =   14
         Left            =   120
         TabIndex        =   18
         Top             =   4995
         Width           =   3000
      End
      Begin VB.Label lblSaisie 
         Height          =   360
         Index           =   13
         Left            =   120
         TabIndex        =   17
         Top             =   4635
         Width           =   3000
      End
      Begin VB.Label lblSaisie 
         Height          =   360
         Index           =   12
         Left            =   120
         TabIndex        =   16
         Top             =   4275
         Width           =   3000
      End
   End
End
Attribute VB_Name = "frmFctStr"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'Position des textBox dans la frame
Const MRG = 240
Const BOXHAUT = 360
Const NBRTXTBOX = 15

Public Sub Dimentionner(nbrStr As Integer, nbrLneTxtInfo As Integer)
   Dim numStr As Integer

   If nbrStr > NBRTXTBOX Then nbrStr = NBRTXTBOX
   
   ' Redimentionnement de la frame des chaines
   fraTxtBox.Height = MRG + MRG + nbrStr * BOXHAUT
   
   ' Position des lables et textBox dans la frame
   For numStr = 1 To nbrStr
      lblSaisie(numStr).Top = MRG + (numStr - 1) * BOXHAUT
      lblSaisie(numStr).Visible = True
      txtSaisie(numStr).Top = MRG + (numStr - 1) * BOXHAUT
      txtSaisie(numStr).Visible = True
   Next numStr
   
   ' Affichage des labels et textBox utiles
   For numStr = nbrStr + 1 To NBRTXTBOX
      lblSaisie(numStr).Visible = False
      txtSaisie(numStr).Visible = False
   Next numStr
   
   ' Taille de la txtInfo
   With txtInfo
      If nbrLneTxtInfo = 0 Then
         .Visible = False
      Else
         .Locked = False
         .Visible = True
         .Height = BOXHAUT * nbrLneTxtInfo
         .Locked = True
      End If
   End With
   
   ' Position de la txtBox des infos
   txtInfo.Top = fraTxtBox.Top + fraTxtBox.Height + MRG
   
   ' Position du boutton executer Fct
   cmdRunFct.Top = txtInfo.Top
   
   ' Dimention de la fenêtre
   If txtInfo.Visible Then
      frmFctStr.Height = txtInfo.Top + txtInfo.Height + 3 * MRG
   Else
      frmFctStr.Height = txtInfo.Top + BOXHAUT + 3 * MRG
   End If
   
End Sub

Public Sub initTxtBox(prmTxtBox As Integer)
   Dim numTxtBox As Integer
    
   ' Initialisation de la txtBox d'info
   txtInfo.Text = ""
   
   ' Initialisation des textbox de saisie
   For numTxtBox = prmTxtBox To NBRTXTBOX
      txtSaisie(numTxtBox).Text = ""
   Next numTxtBox
   
End Sub

Private Sub cmdRunFct_Click()

   Call frmMenu.executerFct
   
End Sub
