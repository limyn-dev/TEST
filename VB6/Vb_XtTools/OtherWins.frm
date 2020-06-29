VERSION 5.00
Begin VB.Form frmOtherWins 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Capturer une fenêtre système"
   ClientHeight    =   1530
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3480
   ControlBox      =   0   'False
   Icon            =   "OtherWins.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1530
   ScaleWidth      =   3480
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.OptionButton optFullScreen 
      Caption         =   "Ecran entier"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   180
      TabIndex        =   4
      Top             =   1020
      Width           =   1620
   End
   Begin VB.OptionButton optDesktop 
      Caption         =   "Bureau"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   180
      TabIndex        =   3
      Top             =   600
      Width           =   1530
   End
   Begin VB.OptionButton optTaskBar 
      Caption         =   "Barre des tâches"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   180
      TabIndex        =   2
      Top             =   180
      Width           =   1650
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   2280
      TabIndex        =   1
      Top             =   720
      Width           =   1095
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   2280
      TabIndex        =   0
      Top             =   165
      Width           =   1095
   End
End
Attribute VB_Name = "frmOtherWins"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdOK_Click()
Dim ret As Long
    If optTaskBar.Value Then
    ElseIf optDesktop.Value Then
    ElseIf optFullScreen.Value Then
    Else
        Beep
        Exit Sub
    End If
    
    CurrhWnd = ret
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
    If frmWinInfos.Visible Then frmWinInfos.cmdRefresh_Click

    Unload Me
End Sub
