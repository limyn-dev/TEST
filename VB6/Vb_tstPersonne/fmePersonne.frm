VERSION 5.00
Object = "{B5E7E66E-D077-4C01-8A1B-CAE8B6B138E6}#1.0#0"; "tstPersonneAvx.ocx"
Begin VB.Form fmePersonne 
   Caption         =   "Form1"
   ClientHeight    =   1872
   ClientLeft      =   48
   ClientTop       =   348
   ClientWidth     =   3840
   LinkTopic       =   "Form1"
   ScaleHeight     =   1872
   ScaleWidth      =   3840
   StartUpPosition =   3  'Windows Default
   Begin tstPersonneAvx.ctrPersonne ctrPersonne1 
      Height          =   1644
      Left            =   96
      TabIndex        =   0
      Top             =   96
      Width           =   3660
      _ExtentX        =   6456
      _ExtentY        =   2900
   End
End
Attribute VB_Name = "fmePersonne"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub btnValider_Click()
   MsgBox "Vôtre saisie: " & txtNom & " " & txtPrenom
End Sub
