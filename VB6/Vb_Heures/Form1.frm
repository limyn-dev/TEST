VERSION 5.00
Begin VB.Form Form1 
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
      Height          =   975
      Left            =   840
      TabIndex        =   0
      Top             =   840
      Width           =   2895
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private mTOp As C_TOp

'------------------------------------------------------------------------------
' Instanciation, désinstanciation de la forme
'==============================================================================
Private Sub Form_Initialize()

   ' Ouverture des accès sur les tables
   With dtaHeures
      .rstblTOp.Open
   End With
   
   ' Instanciation des membres
   Set mTOp = New C_TOp
   
   ' Initialisation des membres

End Sub
'------------------------------------------------------------------------------
Private Sub Form_Terminate()

   ' Ouverture des accès sur les tables
   With dtaHeures
      .rstblTOp.Close
   End With
   
   ' Désinstanciation des membres
   Set mTOp = Nothing
   
End Sub

'------------------------------------------------------------------------------
' boutton test
'==============================================================================
Private Sub Command1_Click()

   mTOp.id = 2
   Debug.Print mTOp.Nom
   
End Sub

