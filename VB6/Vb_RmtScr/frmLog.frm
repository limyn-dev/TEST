VERSION 5.00
Begin VB.Form frmLog 
   Caption         =   "frmLog"
   ClientHeight    =   4350
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5850
   LinkTopic       =   "Form1"
   ScaleHeight     =   4350
   ScaleWidth      =   5850
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtLog 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4095
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   120
      Width           =   5655
   End
End
Attribute VB_Name = "frmLog"
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


' Redimentionnement de la forme
'______________________________________________________________________________________________________________________
Private Sub Form_Resize()

   ' Position du label du Hoste name
   With Me.txtLog
      .Width = Me.Width - 2 * SEP_V - MRG_V
      .Height = Me.Height - 2 * SEP_H - MRG_H
      .Top = SEP_H
      .Left = SEP_V
   End With
   
End Sub

