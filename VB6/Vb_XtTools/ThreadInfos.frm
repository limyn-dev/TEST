VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmThreadInfos 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Infos sur le Thread"
   ClientHeight    =   2595
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5880
   Icon            =   "ThreadInfos.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2595
   ScaleWidth      =   5880
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdClose 
      Cancel          =   -1  'True
      Caption         =   "Fermer"
      Height          =   390
      Left            =   3210
      TabIndex        =   17
      Top             =   2100
      Width           =   1110
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "Rafraîchir"
      Default         =   -1  'True
      Height          =   390
      Left            =   1650
      TabIndex        =   16
      Top             =   2100
      Width           =   1110
   End
   Begin VB.Frame Frame1 
      Caption         =   "Informations sur le Thread"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1980
      Left            =   75
      TabIndex        =   0
      Top             =   30
      Width           =   5625
      Begin MSComctlLib.Slider sldPriority 
         Height          =   1530
         Left            =   3345
         TabIndex        =   1
         Top             =   240
         Width           =   240
         _ExtentX        =   423
         _ExtentY        =   2699
         _Version        =   393216
         Orientation     =   1
         Min             =   1
         Max             =   7
         SelStart        =   1
         Value           =   1
      End
      Begin MSComctlLib.Toolbar Toolbar1 
         Height          =   780
         Left            =   4935
         TabIndex        =   2
         Top             =   120
         Width           =   660
         _ExtentX        =   1164
         _ExtentY        =   1376
         ButtonWidth     =   1032
         ButtonHeight    =   1376
         AllowCustomize  =   0   'False
         Appearance      =   1
         Style           =   1
         ImageList       =   "ImageList1"
         HotImageList    =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Tuer !"
               Object.ToolTipText     =   "Tuer le thread"
               ImageIndex      =   1
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList ImageList1 
         Left            =   4965
         Top             =   1350
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483633
         ImageWidth      =   32
         ImageHeight     =   32
         MaskColor       =   16777215
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   1
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ThreadInfos.frx":000C
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin VB.Label lblParentProcess 
         AutoSize        =   -1  'True
         Caption         =   "Label1"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   1830
         MouseIcon       =   "ThreadInfos.frx":08E8
         MousePointer    =   99  'Custom
         TabIndex        =   15
         Tag             =   "2"
         Top             =   1560
         Width           =   465
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Process créateur :"
         Height          =   195
         Index           =   5
         Left            =   210
         TabIndex        =   14
         Tag             =   "0"
         Top             =   1560
         Width           =   1290
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Priorité :"
         Height          =   195
         Index           =   8
         Left            =   1605
         TabIndex        =   13
         Tag             =   "0"
         Top             =   315
         Width           =   615
      End
      Begin VB.Label lblPriority 
         Caption         =   "Label1"
         ForeColor       =   &H8000000D&
         Height          =   180
         Left            =   1605
         TabIndex        =   12
         Tag             =   "0"
         Top             =   555
         Width           =   1515
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "TID : "
         Height          =   195
         Index           =   7
         Left            =   135
         TabIndex        =   11
         Tag             =   "0"
         Top             =   315
         Width           =   405
      End
      Begin VB.Label lblID 
         AutoSize        =   -1  'True
         Caption         =   "Label1"
         ForeColor       =   &H8000000D&
         Height          =   195
         Left            =   135
         TabIndex        =   10
         Tag             =   "0"
         Top             =   555
         Width           =   465
      End
      Begin VB.Label lblPrio 
         AutoSize        =   -1  'True
         Caption         =   "Prio"
         Height          =   195
         Index           =   0
         Left            =   3705
         TabIndex        =   9
         Top             =   240
         Width           =   270
      End
      Begin VB.Label lblPrio 
         AutoSize        =   -1  'True
         Caption         =   "Prio"
         Height          =   195
         Index           =   1
         Left            =   3705
         TabIndex        =   8
         Top             =   465
         Width           =   270
      End
      Begin VB.Label lblPrio 
         AutoSize        =   -1  'True
         Caption         =   "Prio"
         Height          =   195
         Index           =   2
         Left            =   3705
         TabIndex        =   7
         Top             =   675
         Width           =   270
      End
      Begin VB.Label lblPrio 
         AutoSize        =   -1  'True
         Caption         =   "Prio"
         Height          =   195
         Index           =   3
         Left            =   3705
         TabIndex        =   6
         Top             =   900
         Width           =   270
      End
      Begin VB.Label lblPrio 
         AutoSize        =   -1  'True
         Caption         =   "Prio"
         Height          =   195
         Index           =   4
         Left            =   3705
         TabIndex        =   5
         Top             =   1110
         Width           =   270
      End
      Begin VB.Label lblPrio 
         AutoSize        =   -1  'True
         Caption         =   "Prio"
         Height          =   195
         Index           =   5
         Left            =   3705
         TabIndex        =   4
         Top             =   1335
         Width           =   270
      End
      Begin VB.Label lblPrio 
         AutoSize        =   -1  'True
         Caption         =   "Prio"
         Height          =   195
         Index           =   6
         Left            =   3705
         TabIndex        =   3
         Top             =   1545
         Width           =   270
      End
   End
End
Attribute VB_Name = "frmThreadInfos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'  Projet XtTools par Xavier Tello   (xavier.tello@wanadoo.fr)

Option Explicit

Public TID As Long
Public Working As Boolean

Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub cmdRefresh_Click()
    RefreshThreadInfo
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyF5 Then cmdRefresh_Click
End Sub

Private Sub Form_Load()
    SetWindowPos Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
End Sub

Public Sub RefreshThreadInfo()
Dim ret As Long
Dim hSnapThreads As Long
Dim Thread As THREADENTRY32
Dim Ok As Long

    lblID.Caption = Hex$(TID)
    lblPrio(0).Caption = "Time critical"
    lblPrio(1).Caption = "Highest"
    lblPrio(2).Caption = "Above normal"
    lblPrio(3).Caption = "Normal"
    lblPrio(4).Caption = "Below normal"
    lblPrio(5).Caption = "Lowest"
    lblPrio(6).Caption = "Idle"

    hSnapThreads = CreateToolhelp32Snapshot(TH32CS_SNAPTHREAD, 0&)
    If hSnapThreads = vbNull Then
        MsgBox "Impossible de parcourir les threads.", vbCritical + vbOKOnly
        Exit Sub
    End If

    Thread.dwSize = Len(Thread)
    Ok = Thread32First(hSnapThreads, Thread)
    While (Ok <> 0)
        If Thread.th32ThreadID = TID Then GoTo Cassos
        Ok = Thread32Next(hSnapThreads, Thread)
    Wend
    
Cassos:
    
    CloseHandle hSnapThreads

    lblPriority.Caption = Thread.tpBasePri + Thread.tpDeltaPri & " (" & Thread.tpBasePri & " + " & Thread.tpDeltaPri & ")"
    DrawNoPrio
    Select Case Thread.tpDeltaPri
        Case -15
            sldPriority.Value = 7
            lblPrio(6).ForeColor = RGB(&HFF, &HFF, 0)
        Case -2
            sldPriority.Value = 6
            lblPrio(5).ForeColor = RGB(&HFF, 209, 0)
        Case -1
            sldPriority.Value = 5
            lblPrio(4).ForeColor = RGB(&HFF, 166, 0)
        Case 0
            sldPriority.Value = 4
            lblPrio(3).ForeColor = RGB(&HFF, 123, 0)
        Case 1
            sldPriority.Value = 3
            lblPrio(2).ForeColor = RGB(&HFF, 80, 0)
        Case 2
            sldPriority.Value = 2
            lblPrio(1).ForeColor = RGB(&HFF, 37, 0)
        Case 15
            sldPriority.Value = 1
            lblPrio(0).ForeColor = &HFF
    End Select

    lblParentProcess.Caption = Hex(Thread.th32OwnerProcessID)

    Toolbar1.Buttons(1).Enabled = False
    Toolbar1.Buttons(1).MixedState = True
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    ShowThreadInfos = False
End Sub

Private Sub Form_Resize()
    SetWindowPos Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
    ShowThreadInfos = True
End Sub

Private Sub lblParentProcess_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button <> 1 Then Exit Sub
    frmProcessInfos.PID = "&H" & lblParentProcess.Caption
    frmProcessInfos.RefreshProcessInfo
    frmProcessInfos.Visible = True
End Sub

Private Sub sldPriority_Change()
Dim hThreads As Long

    If Working Then Exit Sub
    DrawNoPrio
    Working = True
    
        Select Case sldPriority.Value
            Case 7
                lblPrio(6).ForeColor = RGB(&HFF, &HFF, 0)
            Case 6
                lblPrio(5).ForeColor = RGB(&HFF, 209, 0)
            Case 5
                lblPrio(4).ForeColor = RGB(&HFF, 166, 0)
            Case 4
                lblPrio(3).ForeColor = RGB(&HFF, 123, 0)
            Case 3
                lblPrio(2).ForeColor = RGB(&HFF, 80, 0)
            Case 2
                lblPrio(1).ForeColor = RGB(&HFF, 37, 0)
            Case 1
                lblPrio(0).ForeColor = &HFF
        End Select
        DoEvents
        RefreshThreadInfo
    
    Working = False
End Sub


Private Sub sldPriority_Scroll()
    sldPriority_Change
End Sub

Private Sub DrawNoPrio()
Dim cpt As Long
    For cpt = 0 To 6
        lblPrio(cpt).ForeColor = vbWindowText
    Next cpt
End Sub


Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim hProcess As Long
    
    Select Case Button.Index
        Case 1
            DoEvents: Beep:    Exit Sub
            If MsgBox(UCase("ê") & "tes-vous sûr(e) de vouloir tuer maintenant ce thread ?" _
                & vbCrLf & "Si vous le tuez de cette manière, il ne libèrera pas toute la mémoire qu'il a aloué.", _
                vbYesNoCancel + vbExclamation) <> vbYes Then Exit Sub
    End Select
End Sub


