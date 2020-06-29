VERSION 5.00
Begin VB.Form frmScr 
   Caption         =   "Form1"
   ClientHeight    =   6255
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8760
   LinkTopic       =   "Form1"
   ScaleHeight     =   6255
   ScaleWidth      =   8760
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtHst 
      Height          =   375
      Left            =   1320
      TabIndex        =   2
      Text            =   "Text1"
      Top             =   120
      Width           =   3495
   End
   Begin VB.CommandButton btnRun 
      Caption         =   "Run"
      Height          =   375
      Left            =   5880
      TabIndex        =   1
      Top             =   120
      Width           =   1695
   End
   Begin VB.TextBox txtScr 
      BeginProperty Font 
         Name            =   "Lucida Console"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4335
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Main.frx":0000
      Top             =   600
      Width           =   7455
   End
   Begin VB.Label lblHst 
      Caption         =   "HosteName"
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   120
      Width           =   975
   End
End
Attribute VB_Name = "frmScr"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


' Marges et séparation
Private Const SEP_H = 50
Private Const SEP_V = 50
Private Const MRG_H = 400
Private Const MRG_V = 150


Private myScr As CScript



' Initialisation de la form
'______________________________________________________________________________________________________________________
Private Sub Form_Load()
   Set myScr = New CScript
End Sub



' Destruction de la forme
'______________________________________________________________________________________________________________________
Private Sub Form_Terminate()
   Set myScr = Nothing
End Sub



' Redimentionnement de la forme
'______________________________________________________________________________________________________________________
Private Sub Form_Resize()

   ' Position du label du Hoste name
   With lblHst
      .Width = 1000
      .Height = 300
      .Top = SEP_H
      .Left = SEP_V
   End With
   
   ' Position du bouton run
   With btnRun
      .Width = 500
      .Height = lblHst.Height
      .Top = lblHst.Top
      .Left = Me.Width - Me.btnRun.Width - MRG_V - SEP_V
   End With
   
   ' Position de la texte box pour le hoste name
   With txtHst
      .Width = Me.Width - 4 * SEP_V - MRG_V - lblHst.Width - btnRun.Width
      .Height = lblHst.Height
      .Top = lblHst.Top
      .Left = lblHst.Left + lblHst.Width + SEP_V
   End With
   
   ' Position du code
   With txtScr
      .Top = lblHst.Height + 2 * SEP_H
      .Left = SEP_V
      .Width = Me.Width - 2 * SEP_V - MRG_V
      .Height = Me.Height - MRG_H - 3 * SEP_H - lblHst.Height
   End With
   
End Sub


' Execution du script
'______________________________________________________________________________________________________________________
Private Sub btnRun_Click()
   With myScr
      .HostName = txtHst.Text ' Mise à jour du hoste name
      .ClearCode              ' Reset du code
      .AddCode txtScr.Text    ' Ajout du code
      .RunCode                ' Execution
   End With
   
   ' Affichage du log
   myScr.LogLoadTxt frmLog.txtLog
   frmLog.Show
   
End Sub


