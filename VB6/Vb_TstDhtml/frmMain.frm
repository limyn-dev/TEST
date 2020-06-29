VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "SHDOCVW.DLL"
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   9684
   ClientLeft      =   48
   ClientTop       =   288
   ClientWidth     =   9972
   LinkTopic       =   "Form1"
   ScaleHeight     =   9684
   ScaleWidth      =   9972
   StartUpPosition =   3  'Windows Default
   Begin SHDocVwCtl.WebBrowser wbbMain 
      Height          =   9372
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   9732
      ExtentX         =   17166
      ExtentY         =   16531
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   ""
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private WithEvents objPage As HTMLDocument
Attribute objPage.VB_VarHelpID = -1
Private WithEvents objFrameTitle As HTMLWindow2
Attribute objFrameTitle.VB_VarHelpID = -1
Private WithEvents objFrameMenu As HTMLWindow2
Private WithEvents objFrameMain As HTMLWindow2

Private Sub Form_Load()
    wbbMain.Navigate2 App.Path & "\first.html"
End Sub

Private Sub wbbMain_DocumentComplete(ByVal pDisp As Object, URL As Variant)
    On Error Resume Next
    If pDisp Is wbbMain.Object Then
        Set objPage = wbbMain.document
        Set objFrameTitle = objPage.frames("frmTitle")
        Set objFrameMenu = objPage.frames("frmMenu")
        Set objFrameMain = objPage.frames("frmMain")
        objFrameTitle.document.body.innerHTML = "<CENTER>Frame Title<CENTER>"
        objFrameMenu.document.body.innerHTML = "<CENTER>Frame Menu<CENTER>"
        objFrameMain.document.body.innerHTML = "<CENTER>Frame Main<CENTER>"
    End If
End Sub

Private Function objPage_onclick() As Boolean
    MsgBox objPage.body.innerText
End Function

Private Function objFrameMain_onclick() As Boolean
    MsgBox objPage.body.innerText
End Function

'Private Sub wbbMain_BeforeNavigate2(ByVal pDisp As Object, URL As Variant, Flags As Variant, TargetFrameName As Variant, PostData As Variant, Headers As Variant, Cancel As Boolean)
'    Set HTMLpage = Nothing
'End Sub

