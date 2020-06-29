VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   615
      Left            =   480
      TabIndex        =   0
      Top             =   720
      Width           =   2655
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()

   frmTpe.Show
   
End Sub

'------------------------------------------------------------------------------
' Initialisation, cloture de la forme
'==============================================================================
Private Sub Form_Initialize()

   ' Ouverture de la DB et des tables
   M_Db.ouvrir
   
End Sub
'------------------------------------------------------------------------------
Private Sub Form_Terminate()

   ' Fermeture des des tables et de la DB
   M_Db.fermer
   
End Sub
