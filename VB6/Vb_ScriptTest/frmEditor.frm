VERSION 5.00
Begin VB.Form frmEditor 
   Caption         =   "Form1"
   ClientHeight    =   5172
   ClientLeft      =   48
   ClientTop       =   348
   ClientWidth     =   7512
   LinkTopic       =   "Form1"
   ScaleHeight     =   5172
   ScaleWidth      =   7512
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnRun 
      Caption         =   "Executer"
      Height          =   372
      Left            =   120
      TabIndex        =   1
      Top             =   4680
      Width           =   1332
   End
   Begin VB.TextBox txtScript 
      Height          =   4452
      Left            =   120
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   120
      Width           =   7212
   End
End
Attribute VB_Name = "frmEditor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnRun_Click()
    Dim objScriptControl
    
    objScriptControl.Language = ""
    objScriptControl.ExecuteStatement "msgbox ""Coucou"""
    
    Set objScriptControl = Nothing
End Sub
