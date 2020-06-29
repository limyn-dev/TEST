VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "SHDOCVW.DLL"
Begin VB.Form frmMain 
   Caption         =   "Web Interface"
   ClientHeight    =   8232
   ClientLeft      =   5268
   ClientTop       =   2952
   ClientWidth     =   7836
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   8232
   ScaleWidth      =   7836
   Begin SHDocVwCtl.WebBrowser Web1 
      Height          =   5292
      Left            =   240
      TabIndex        =   0
      Top             =   2400
      Width           =   3972
      ExtentX         =   7011
      ExtentY         =   9340
      ViewMode        =   1
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   1
      RegisterAsDropTarget=   0
      AutoArrange     =   -1  'True
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "res://C:\WINNT\system32\shdoclc.dll/dnserror.htm#http:///"
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim WithEvents HTMLpage As HTMLDocument
Attribute HTMLpage.VB_VarHelpID = -1

Private Sub Web1_BeforeNavigate2(ByVal pDisp As Object, URL As Variant, Flags As Variant, TargetFrameName As Variant, PostData As Variant, Headers As Variant, Cancel As Boolean)
    Set HTMLpage = Nothing
End Sub

Private Sub Web1_DocumentComplete(ByVal pDisp As Object, URL As Variant)
    On Error Resume Next
    If pDisp Is Web1.Object Then
        Set HTMLpage = Web1.Document
    End If
End Sub

Private Sub Form_Load()
    Web1.Navigate App.Path & "\internet_interface.htm"
End Sub


Private Sub Form_Resize()
    On Error Resume Next
    Web1.Move 0, 0, ScaleWidth, ScaleHeight
End Sub



Private Function HTMLpage_onclick() As Boolean
    ' the element may not have an id
    On Error Resume Next
    Dim CompareID As String
    Dim curElement As IHTMLElement

    Set curElement = HTMLpage.parentWindow.event.srcElement
    'If the element does not have an id use the parent's id
    If Len(curElement.Id) > 0 Then
        CompareID = curElement.Id
    Else
        CompareID = curElement.parentElement.Id
    End If
    
    Select Case CompareID
        Case "config"
            MsgBox "The configure button was Clicked"
        Case "search"
            MsgBox "The search button was Clicked"
    End Select
End Function

