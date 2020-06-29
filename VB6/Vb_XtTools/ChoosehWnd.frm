VERSION 5.00
Begin VB.Form frmChoosehWnd 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Saisir un hWnd"
   ClientHeight    =   2325
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4650
   ControlBox      =   0   'False
   Icon            =   "ChoosehWnd.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2325
   ScaleWidth      =   4650
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.OptionButton optDec 
      Caption         =   "Décimal"
      Height          =   330
      Left            =   1785
      TabIndex        =   2
      Top             =   1305
      Width           =   885
   End
   Begin VB.OptionButton optHex 
      Caption         =   "Hexadécimal"
      Height          =   330
      Left            =   165
      TabIndex        =   1
      Top             =   1305
      Value           =   -1  'True
      Width           =   1335
   End
   Begin VB.TextBox txtNewhWnd 
      Height          =   330
      Left            =   810
      TabIndex        =   0
      Top             =   870
      Width           =   1875
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   360
      Left            =   2085
      TabIndex        =   3
      Top             =   1830
      Width           =   1095
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   360
      Left            =   3420
      TabIndex        =   4
      Top             =   1830
      Width           =   1095
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "hWnd :"
      Height          =   195
      Left            =   150
      TabIndex        =   6
      Top             =   915
      Width           =   525
   End
   Begin VB.Label Label1 
      Caption         =   $"ChoosehWnd.frx":000C
      Height          =   615
      Left            =   75
      TabIndex        =   5
      Top             =   90
      Width           =   4455
   End
End
Attribute VB_Name = "frmChoosehWnd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'  Projet XtTools par Xavier Tello   (xavier.tello@wanadoo.fr)

Option Explicit


Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOK_Click()
Dim NewhWnd As Long
Dim ret As Long
Dim TxtLength As Integer
Dim TitleText As String
Dim HICON As Long
    
    If optDec.Value Then
        If Not IsNumeric(txtNewhWnd.Text) Then
            MsgBox "Valeur incorrecte.", vbInformation
            Exit Sub
        End If
    Else
        If Not IsNumeric("&H" & txtNewhWnd.Text) Then
            MsgBox "Valeur incorrecte.", vbInformation
            Exit Sub
        End If
    End If
    NewhWnd = CLng(IIf(optDec.Value, txtNewhWnd.Text, "&H" & txtNewhWnd.Text))
    
    TxtLength = 255
    TitleText = String(255, Chr(0))
    ret = GetClassName(NewhWnd, TitleText, TxtLength)
    If Asc(Mid(TitleText, 1, 1)) = 0 Then
        MsgBox "La fenêtre est introuvable !", vbExclamation
        Exit Sub
    End If

    CurrhWnd = NewhWnd
    frmMain.SelectWin_Mode = False
    frmMain.Timer1.Enabled = True
    frmMain.EnableXtTools
    
    frmMain.picFormIconSmall.Cls
        HICON = GetClassLong(CurrhWnd, GCL_HICONSM)
        ret = DrawIconEx(frmMain.picFormIconSmall.hdc, 0, 0, HICON, 16, 16, 0, 0, 3)
    frmMain.picFormIconSmall.Refresh
    If ret = 0 Then DrawNoIconSmall
    
    frmMain.picFormIcon.Cls
        HICON = GetClassLong(CurrhWnd, GCL_HICON)
        ret = DrawIcon(frmMain.picFormIcon.hdc, 0, 0, HICON)
    frmMain.picFormIcon.Refresh
    If ret = 0 Then DrawNoIcon

    If frmMain.Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.cmdRefresh_Click
    If ShowWinInfos Then frmWinInfos.cmdRefresh_Click

    Unload Me
End Sub

Private Sub Form_Load()
    SetWindowPos Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
    optHex.Value = HexMode
    optDec.Value = Not HexMode
End Sub
Private Sub Form_Resize()
    txtNewhWnd.SetFocus
End Sub
Private Sub optDec_Click()
    If Me.Visible Then txtNewhWnd.SetFocus
End Sub
Private Sub optHex_Click()
    If Me.Visible Then txtNewhWnd.SetFocus
End Sub
