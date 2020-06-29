VERSION 5.00
Begin VB.Form frmPrincipal 
   Caption         =   "Form1"
   ClientHeight    =   3192
   ClientLeft      =   60
   ClientTop       =   348
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3192
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "frmPrincipal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Public Type T_Personne
   Nom As String
   Prenom As String
   estHme As Boolean
End Type

Public Type T_Couple
   Homme As T_Personne
   Femme As T_Personne
End Type
   

Private Sub Form_Load()

   mdlDbIO.connecter
   
End Sub

Private Sub Form_Unload(Cancel As Integer)

   mdlDbIO.deconnecter
   
End Sub
