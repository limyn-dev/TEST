VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "SHDOCVW.dll"
Begin VB.Form frmDtl 
   Caption         =   "Form1"
   ClientHeight    =   4620
   ClientLeft      =   48
   ClientTop       =   324
   ClientWidth     =   5952
   LinkTopic       =   "Form1"
   ScaleHeight     =   4620
   ScaleWidth      =   5952
   StartUpPosition =   3  'Windows Default
   Begin SHDocVwCtl.WebBrowser wbbDtl 
      Height          =   4692
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6012
      ExtentX         =   10604
      ExtentY         =   8276
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   ""
   End
End
Attribute VB_Name = "frmDtl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


' Mise à jour du document
Public Sub loadDoc(sHtm As String)

End Sub
