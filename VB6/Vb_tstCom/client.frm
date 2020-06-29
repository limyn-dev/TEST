VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2544
   ClientLeft      =   48
   ClientTop       =   288
   ClientWidth     =   3744
   LinkTopic       =   "Form1"
   ScaleHeight     =   2544
   ScaleWidth      =   3744
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnMtdB 
      Caption         =   "MethodeB"
      Height          =   372
      Left            =   360
      TabIndex        =   1
      Top             =   1080
      Width           =   2772
   End
   Begin VB.CommandButton btnMtdA 
      Caption         =   "MethodeA"
      Height          =   372
      Left            =   360
      TabIndex        =   0
      Top             =   600
      Width           =   2772
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim CTstCom As Project1.CTest

Private Sub btnMtdA_Click()
    CTstCom.MethodeA
End Sub

Private Sub btnMtdB_Click()
    CTstCom.MethodeB
End Sub

Private Sub Form_Initialize()
    Set CTstCom = New Project1.CTest
End Sub

Private Sub Form_Terminate()
    Set CTstCom = Nothing
End Sub
