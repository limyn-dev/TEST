VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   3852
   ClientLeft      =   48
   ClientTop       =   324
   ClientWidth     =   3420
   LinkTopic       =   "Form1"
   ScaleHeight     =   3852
   ScaleWidth      =   3420
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.TreeView trvPrc 
      Height          =   3612
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3132
      _ExtentX        =   5522
      _ExtentY        =   6361
      _Version        =   393217
      Style           =   7
      Appearance      =   1
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



' Chargement dse la form
'______________________________________________________________________________________________________________________
Private Sub Form_Load()

   ' Initialisation du treview
   dtaTre
   
End Sub
