VERSION 5.00
Begin VB.Form frmWinInfos 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Infos fenêtre"
   ClientHeight    =   2295
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5835
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "WinInfos.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   2295
   ScaleWidth      =   5835
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame2 
      Caption         =   "Informations sur la fenêtre"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1605
      Left            =   105
      TabIndex        =   2
      Top             =   90
      Width           =   5625
      Begin VB.Label lblOwner 
         AutoSize        =   -1  'True
         Caption         =   "Label1"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   4515
         MouseIcon       =   "WinInfos.frx":000C
         MousePointer    =   99  'Custom
         TabIndex        =   18
         Tag             =   "2"
         ToolTipText     =   "Cliquez pour capturer cette fenêtre"
         Top             =   945
         Width           =   465
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Fenêtre créatrice :"
         Height          =   195
         Index           =   9
         Left            =   3075
         TabIndex        =   17
         Tag             =   "0"
         Top             =   945
         Width           =   1350
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "ID Thread créateur :"
         Height          =   195
         Index           =   6
         Left            =   2940
         TabIndex        =   16
         Tag             =   "0"
         Top             =   630
         Width           =   1485
      End
      Begin VB.Label lblThread 
         AutoSize        =   -1  'True
         Caption         =   "Label1"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   4515
         MouseIcon       =   "WinInfos.frx":015E
         MousePointer    =   99  'Custom
         TabIndex        =   15
         Tag             =   "2"
         ToolTipText     =   "Cliquez pour afficher les propriétés du thread"
         Top             =   630
         Width           =   465
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "ID Process créateur :"
         Height          =   195
         Index           =   5
         Left            =   2895
         TabIndex        =   14
         Tag             =   "0"
         Top             =   330
         Width           =   1530
      End
      Begin VB.Label lblProcess 
         AutoSize        =   -1  'True
         Caption         =   "Label1"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   4515
         MouseIcon       =   "WinInfos.frx":02B0
         MousePointer    =   99  'Custom
         TabIndex        =   13
         Tag             =   "2"
         ToolTipText     =   "Cliquez pour afficher les propriétés du process"
         Top             =   330
         Width           =   465
      End
      Begin VB.Label lblParentWindow 
         AutoSize        =   -1  'True
         Caption         =   "Label1"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   4515
         MouseIcon       =   "WinInfos.frx":0402
         MousePointer    =   99  'Custom
         TabIndex        =   12
         Tag             =   "1"
         ToolTipText     =   "Cliquez pour capturer cette fenêtre"
         Top             =   1245
         Width           =   465
      End
      Begin VB.Label lblChildWindow 
         AutoSize        =   -1  'True
         Caption         =   "Label1"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   1935
         MouseIcon       =   "WinInfos.frx":0554
         MousePointer    =   99  'Custom
         TabIndex        =   11
         Tag             =   "1"
         ToolTipText     =   "Cliquez pour capturer cette fenêtre"
         Top             =   1245
         Width           =   465
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Fenêtre parent :"
         Height          =   195
         Index           =   3
         Left            =   3225
         TabIndex        =   10
         Tag             =   "0"
         Top             =   1245
         Width           =   1200
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Fenêtre premier enfant :"
         Height          =   195
         Index           =   4
         Left            =   60
         TabIndex        =   9
         Tag             =   "0"
         Top             =   1245
         Width           =   1785
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Fenêtre suivante :"
         Height          =   195
         Index           =   1
         Left            =   510
         TabIndex        =   8
         Tag             =   "0"
         Top             =   630
         Width           =   1335
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Fenêtre précédente :"
         Height          =   195
         Index           =   2
         Left            =   300
         TabIndex        =   7
         Tag             =   "0"
         Top             =   945
         Width           =   1545
      End
      Begin VB.Label lblNextWindow 
         AutoSize        =   -1  'True
         Caption         =   "Label1"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   1935
         MouseIcon       =   "WinInfos.frx":06A6
         MousePointer    =   99  'Custom
         TabIndex        =   6
         Tag             =   "1"
         ToolTipText     =   "Cliquez pour capturer cette fenêtre"
         Top             =   630
         Width           =   465
      End
      Begin VB.Label lblPrevWindow 
         AutoSize        =   -1  'True
         Caption         =   "Label1"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   1935
         MouseIcon       =   "WinInfos.frx":07F8
         MousePointer    =   99  'Custom
         TabIndex        =   5
         Tag             =   "1"
         ToolTipText     =   "Cliquez pour capturer cette fenêtre"
         Top             =   945
         Width           =   465
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Fenêtre :"
         Height          =   195
         Index           =   0
         Left            =   1170
         TabIndex        =   4
         Tag             =   "0"
         Top             =   330
         Width           =   675
      End
      Begin VB.Label lblWindow 
         AutoSize        =   -1  'True
         Caption         =   "Label1"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   1935
         MouseIcon       =   "WinInfos.frx":094A
         MousePointer    =   99  'Custom
         TabIndex        =   3
         Tag             =   "2"
         ToolTipText     =   "Cliquez pour capturer cette fenêtre"
         Top             =   330
         Width           =   465
      End
   End
   Begin VB.CommandButton cmdClose 
      Cancel          =   -1  'True
      Caption         =   "Fermer"
      Default         =   -1  'True
      Height          =   390
      Left            =   3105
      TabIndex        =   1
      Top             =   1770
      Width           =   1110
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "Rafraîchir"
      Height          =   390
      Left            =   1545
      TabIndex        =   0
      Top             =   1770
      Width           =   1110
   End
End
Attribute VB_Name = "frmWinInfos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'  Projet XtTools par Xavier Tello   (xavier.tello@wanadoo.fr)

Option Explicit

Private PID As Long
Private TID As Long
Private Working As Boolean

Private Sub cmdClose_Click()
    Unload Me
End Sub

Public Sub cmdRefresh_Click()
Dim LabelCtrl As Control

    If CurrhWnd < 0 Then
        lblWindow.Caption = ""
        lblPrevWindow.Caption = ""
        lblPrevWindow.Tag = ""
        lblNextWindow.Caption = ""
        lblNextWindow.Tag = ""
        lblParentWindow.Caption = ""
        lblParentWindow.Tag = ""
        lblChildWindow.Caption = ""
        lblChildWindow.Tag = ""
        lblProcess.Caption = ""
        lblThread.Caption = ""
        Exit Sub
    End If
    
    lblWindow.Caption = FormatHWND(CurrhWnd)
    lblPrevWindow.Caption = FormatHWND(GetWindow(CurrhWnd, GW_HWNDPREV))
    lblPrevWindow.Tag = IIf(lblPrevWindow.Caption = "(Aucune)", 1, 2)
    lblNextWindow.Caption = FormatHWND(GetWindow(CurrhWnd, GW_HWNDNEXT))
    lblNextWindow.Tag = IIf(lblNextWindow.Caption = "(Aucune)", 1, 2)
    lblParentWindow.Caption = FormatHWND(GetParent(CurrhWnd))
    lblParentWindow.Tag = IIf(lblParentWindow.Caption = "(Aucune)", 1, 2)
    lblChildWindow.Caption = FormatHWND(GetWindow(CurrhWnd, GW_CHILD))
    lblChildWindow.Tag = IIf(lblChildWindow.Caption = "(Aucune)", 1, 2)
    lblOwner.Caption = FormatHWND(GetWindow(CurrhWnd, GW_OWNER))
    lblOwner.Tag = IIf(lblOwner.Caption = "(Aucune)", 1, 2)
        TID = GetWindowThreadProcessId(CurrhWnd, PID)
    lblProcess.Caption = FormatHWND(PID)
    lblThread.Caption = FormatHWND(TID)
    
    For Each LabelCtrl In frmWinInfos
        If TypeOf LabelCtrl Is Label Then
            Select Case LabelCtrl.Tag
                Case Is < 1
                    GoTo Suivant
                Case 1
                    LabelCtrl.ForeColor = vbWindowText
                    LabelCtrl.FontUnderline = False
                    LabelCtrl.MousePointer = 0
                Case 2
                    LabelCtrl.ForeColor = &HFF0000
                    LabelCtrl.FontUnderline = True
                    LabelCtrl.MousePointer = 99
            End Select
        End If
Suivant:
    Next LabelCtrl

End Sub

Private Sub Form_Activate()
    cmdRefresh_Click
End Sub

Private Sub Form_Load()
    SetWindowPos Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
    cmdRefresh_Click
End Sub

Public Function FormatHWND(Nb As Long) As String
    If Nb = 0 Then
        FormatHWND = "(Aucune)"
        Exit Function
    End If
    If HexMode Then
        FormatHWND = String(8 - Len(Hex$(Nb)), "0") & Hex$(Nb)
    Else
        FormatHWND = Format(CStr(Nb), "0000000000")
    End If
End Function

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    ShowWinInfos = False
End Sub

Private Sub Form_Resize()
    ShowWinInfos = True
End Sub

Private Sub lblChildWindow_Click()
    If lblChildWindow.ForeColor = vbWindowText Then Exit Sub
    CaptureWin CLng(IIf(HexMode, "&H", "") & lblChildWindow.Caption)
End Sub
Private Sub lblNextWindow_Click()
    If lblNextWindow.ForeColor = vbWindowText Then Exit Sub
    CaptureWin CLng(IIf(HexMode, "&H", "") & lblNextWindow.Caption)
End Sub
Private Sub lblOwner_Click()
    If lblOwner.ForeColor = vbWindowText Then Exit Sub
    CaptureWin CLng(IIf(HexMode, "&H", "") & lblOwner.Caption)
End Sub
Private Sub lblParentWindow_Click()
    If lblParentWindow.ForeColor = vbWindowText Then Exit Sub
    CaptureWin CLng(IIf(HexMode, "&H", "") & lblParentWindow.Caption)
End Sub
Private Sub lblPrevWindow_Click()
    If lblPrevWindow.ForeColor = vbWindowText Then Exit Sub
    CaptureWin CLng(IIf(HexMode, "&H", "") & lblPrevWindow.Caption)
End Sub

Private Sub lblProcess_Click()
    frmProcessInfos.PID = PID
    frmProcessInfos.RefreshProcessInfo
    frmProcessInfos.Visible = True
End Sub

Private Sub lblThread_Click()
    frmThreadInfos.TID = TID
    frmThreadInfos.RefreshThreadInfo
    frmThreadInfos.Visible = True
End Sub

Private Sub CaptureWin(ByVal hWnd2 As Long)
Dim HICON As Long
Dim ret As Long
    
    CurrhWnd = hWnd2
    frmMain.SelectWin_Mode = False
    frmMain.Timer1.Enabled = True
    frmMain.EnableXtTools
    
    frmMain.picFormIconSmall.Cls
        HICON = GetClassLong(CurrhWnd, GCL_HICONSM)
        ret = DrawIconEx(frmMain.picFormIconSmall.HDC, 0, 0, HICON, 16, 16, 0, 0, 3)
    frmMain.picFormIconSmall.Refresh
    If ret = 0 Then DrawNoIconSmall
    
    frmMain.picFormIcon.Cls
        HICON = GetClassLong(CurrhWnd, GCL_HICON)
        ret = DrawIcon(frmMain.picFormIcon.HDC, 0, 0, HICON)
    frmMain.picFormIcon.Refresh
    If ret = 0 Then DrawNoIcon

    If frmMain.Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.cmdRefresh_Click
    cmdRefresh_Click
End Sub

