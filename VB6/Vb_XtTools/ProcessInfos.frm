VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmProcessInfos 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Infos sur le Process"
   ClientHeight    =   5115
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   7050
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5115
   ScaleWidth      =   7050
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "Rafraîchir"
      Default         =   -1  'True
      Height          =   390
      Left            =   2205
      TabIndex        =   24
      Top             =   4620
      Width           =   1110
   End
   Begin VB.CommandButton cmdClose 
      Cancel          =   -1  'True
      Caption         =   "Fermer"
      Height          =   390
      Left            =   3765
      TabIndex        =   23
      Top             =   4620
      Width           =   1110
   End
   Begin MSComctlLib.ImageList ImageList2 
      Left            =   6000
      Top             =   3690
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   1
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ProcessInfos.frx":0000
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Timer Timer1 
      Interval        =   20
      Left            =   5085
      Top             =   4575
   End
   Begin VB.Frame Frame1 
      Caption         =   "Informations sur le Processus"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4500
      Left            =   75
      TabIndex        =   0
      Top             =   30
      Width           =   6885
      Begin MSComctlLib.ImageList ImageList1 
         Left            =   6255
         Top             =   1800
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483633
         ImageWidth      =   32
         ImageHeight     =   32
         MaskColor       =   16777215
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   3
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ProcessInfos.frx":015C
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ProcessInfos.frx":0A38
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "ProcessInfos.frx":1314
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ListView ListView1 
         Height          =   1620
         Left            =   135
         TabIndex        =   19
         Top             =   2730
         Width           =   4500
         _ExtentX        =   7938
         _ExtentY        =   2858
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin VB.TextBox txtModuleFullPath 
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         ForeColor       =   &H8000000D&
         Height          =   225
         Left            =   135
         Locked          =   -1  'True
         TabIndex        =   2
         Tag             =   "0"
         Text            =   "Text1"
         Top             =   2100
         Width           =   3900
      End
      Begin MSComctlLib.Slider sldPriority 
         Height          =   1530
         Left            =   4080
         TabIndex        =   1
         Top             =   240
         Width           =   240
         _ExtentX        =   423
         _ExtentY        =   2699
         _Version        =   393216
         Orientation     =   1
         Min             =   1
         Max             =   4
         SelStart        =   1
         Value           =   1
      End
      Begin MSComctlLib.Toolbar Toolbar1 
         Height          =   780
         Left            =   6120
         TabIndex        =   3
         Top             =   120
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   1376
         ButtonWidth     =   1244
         ButtonHeight    =   1376
         AllowCustomize  =   0   'False
         Appearance      =   1
         Style           =   1
         ImageList       =   "ImageList1"
         HotImageList    =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   3
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Explorer"
               Object.ToolTipText     =   "Explorer le dossier de l'EXE"
               ImageIndex      =   1
            EndProperty
            BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Ouvrir"
               Object.ToolTipText     =   "Ouvrir le dossier de l'EXE"
               ImageIndex      =   2
            EndProperty
            BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "Tuer !"
               Object.ToolTipText     =   "Tuer le process"
               ImageIndex      =   3
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ListView ListView2 
         Height          =   1605
         Left            =   4995
         TabIndex        =   20
         ToolTipText     =   "Cliquez sur un thread pour afficher ces propriétés"
         Top             =   2730
         Width           =   1635
         _ExtentX        =   2884
         _ExtentY        =   2831
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         _Version        =   393217
         Icons           =   "ImageList2"
         SmallIcons      =   "ImageList2"
         ForeColor       =   16711680
         BackColor       =   -2147483628
         BorderStyle     =   1
         Appearance      =   1
         MouseIcon       =   "ProcessInfos.frx":1BF0
         NumItems        =   0
      End
      Begin VB.Label lblCreator 
         AutoSize        =   -1  'True
         Caption         =   "Label1"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   4125
         MouseIcon       =   "ProcessInfos.frx":1D52
         MousePointer    =   99  'Custom
         TabIndex        =   22
         Tag             =   "0"
         Top             =   2100
         Width           =   465
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Créateur :"
         Height          =   195
         Index           =   2
         Left            =   4110
         TabIndex        =   21
         Tag             =   "0"
         Top             =   1860
         Width           =   750
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Threads crées : "
         Height          =   195
         Index           =   1
         Left            =   5040
         TabIndex        =   18
         Tag             =   "0"
         Top             =   2475
         Width           =   1170
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Modules chargés :"
         Height          =   195
         Index           =   0
         Left            =   150
         TabIndex        =   17
         Tag             =   "0"
         Top             =   2475
         Width           =   1305
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Priorité :"
         Height          =   195
         Index           =   8
         Left            =   1875
         TabIndex        =   16
         Tag             =   "0"
         Top             =   315
         Width           =   615
      End
      Begin VB.Label lblPriority 
         Caption         =   "Label1"
         ForeColor       =   &H8000000D&
         Height          =   180
         Left            =   1875
         TabIndex        =   15
         Tag             =   "0"
         Top             =   555
         Width           =   1515
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "PID :"
         Height          =   195
         Index           =   7
         Left            =   135
         TabIndex        =   14
         Tag             =   "0"
         Top             =   315
         Width           =   360
      End
      Begin VB.Label lblID 
         AutoSize        =   -1  'True
         Caption         =   "Label1"
         ForeColor       =   &H8000000D&
         Height          =   195
         Left            =   135
         TabIndex        =   13
         Tag             =   "0"
         Top             =   555
         Width           =   465
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Module :"
         Height          =   195
         Index           =   10
         Left            =   135
         TabIndex        =   12
         Tag             =   "0"
         Top             =   1125
         Width           =   615
      End
      Begin VB.Label lblModuleName 
         Caption         =   "Label1"
         ForeColor       =   &H8000000D&
         Height          =   195
         Left            =   135
         TabIndex        =   11
         Tag             =   "0"
         Top             =   1365
         Width           =   1665
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Chemin complet :"
         Height          =   195
         Index           =   11
         Left            =   135
         TabIndex        =   10
         Tag             =   "0"
         Top             =   1860
         Width           =   1230
      End
      Begin VB.Label lblNbOfThreads 
         AutoSize        =   -1  'True
         Caption         =   "Label1"
         ForeColor       =   &H8000000D&
         Height          =   195
         Left            =   1860
         TabIndex        =   9
         Top             =   1365
         Width           =   465
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Nombre de Threads :"
         Height          =   195
         Index           =   12
         Left            =   1860
         TabIndex        =   8
         Tag             =   "0"
         Top             =   1125
         Width           =   1515
      End
      Begin VB.Label lblPrio 
         AutoSize        =   -1  'True
         Caption         =   "Prio"
         Height          =   195
         Index           =   0
         Left            =   4440
         TabIndex        =   7
         Top             =   240
         Width           =   270
      End
      Begin VB.Label lblPrio 
         AutoSize        =   -1  'True
         Caption         =   "Prio"
         Height          =   195
         Index           =   2
         Left            =   4440
         TabIndex        =   6
         Top             =   675
         Width           =   270
      End
      Begin VB.Label lblPrio 
         AutoSize        =   -1  'True
         Caption         =   "Prio"
         Height          =   195
         Index           =   4
         Left            =   4440
         TabIndex        =   5
         Top             =   1110
         Width           =   270
      End
      Begin VB.Label lblPrio 
         AutoSize        =   -1  'True
         Caption         =   "Prio"
         Height          =   195
         Index           =   6
         Left            =   4440
         TabIndex        =   4
         Top             =   1545
         Width           =   270
      End
   End
End
Attribute VB_Name = "frmProcessInfos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'  Projet XtTools par Xavier Tello   (xavier.tello@wanadoo.fr)

Option Explicit

Public PID As Long
Private PrioritiesStrings(1 To 8) As String * 20
Private Working As Boolean

Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub cmdRefresh_Click()
    RefreshProcessInfo
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyF5 Then cmdRefresh_Click
End Sub

Private Sub lblCreator_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Me.PID = lblCreator.Tag
    RefreshProcessInfo
End Sub

Private Sub ListView1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If (ListView1.Width <> (447 * Tppx)) Then
        ListView1.ZOrder 0
        ListView1.Width = 447 * Tppx
    End If
End Sub

Private Sub Form_Load()
    SetWindowPos Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
    PrioritiesStrings(1) = "Normale"
    PrioritiesStrings(2) = "Inferieure"
    PrioritiesStrings(4) = "Haute"
    PrioritiesStrings(8) = "Temps réel"
    ListView1.ColumnHeaders.Add , , "Nom", 100 * Tppx
    ListView1.ColumnHeaders.Add , , "Taille", 52 * Tppx, lvwColumnRight
    ListView1.ColumnHeaders.Add , , "GlobalCntUsage", 30 * Tppx
    ListView1.ColumnHeaders.Add , , "ProcessCntUsage", 30 * Tppx
    ListView1.ColumnHeaders.Add , , "Chemin", (230 - GetSystemMetrics(SM_CXVSCROLL) - 5) * Tppx
    ListView1.View = lvwReport
    ListView2.View = lvwList
End Sub

Public Sub RefreshProcessInfo()
Dim hProcess As Long, a As Long, b As Long
Dim ret As Long
Dim CurrProcess As PROCESSENTRY32
Dim CurrHeap As HEAPENTRY32
Dim hSnapModules As Long
Dim Module2 As MODULEENTRY32
Dim Ok As Long
Dim cpt As Long
Dim ItemX As ListItem
Dim hSnapThreads As Long
Dim Thread As THREADENTRY32
Dim tempBuf As String
    
    lblID.Caption = Hex$(PID)
    Toolbar1.Buttons(3).ToolTipText = "Tuer le process"
    lblPrio(0).Caption = "Real time"
    lblPrio(2).Caption = "High"
    lblPrio(4).Caption = "Normal"
    lblPrio(6).Caption = "Idle"
    
    If Toolbar1.Buttons(3).Enabled Then
        Toolbar1.Buttons(1).Enabled = True
        Toolbar1.Buttons(1).MixedState = False
        Toolbar1.Buttons(2).Enabled = True
        Toolbar1.Buttons(2).MixedState = False
    End If
    
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION Or &H10, False, PID)
    Toolbar1.Buttons(1).Enabled = (hProcess <> 0)
    Toolbar1.Buttons(1).MixedState = (hProcess = 0)
    Toolbar1.Buttons(2).Enabled = (hProcess <> 0)
    Toolbar1.Buttons(2).MixedState = (hProcess = 0)
    Toolbar1.Buttons(3).Enabled = (hProcess <> 0)
    Toolbar1.Buttons(3).MixedState = (hProcess = 0)
    sldPriority.Enabled = (hProcess <> 0)
    
    If hProcess = 0 Then
        lblPriority.Caption = "???"
        txtModuleFullPath.Text = "???"
        lblModuleName.Caption = "???"
        lblNbOfThreads.Caption = "???"
        ListView1.ListItems.Clear
        ListView1.ListItems.Add , , "???"
        ListView2.ListItems.Clear
        ListView2.ListItems.Add , , "???"
        lbl1(0).Caption = "Modules chargés :"
        lbl1(1).Caption = "Threads crées :"
        Exit Sub
    End If
    
    ret = GetPriorityClass(hProcess)
    lblPriority.Caption = PriorityID(ret) & _
           " (" & Trim(PrioritiesStrings(ret \ 32)) & ")"
    DrawNoPrio
    Select Case ret
        Case REALTIME_PRIORITY_CLASS
            sldPriority.Value = 1
            lblPrio(0).ForeColor = &HFF
        Case HIGH_PRIORITY_CLASS
            sldPriority.Value = 2
            lblPrio(2).ForeColor = RGB(&HFF, 80, 0)
        Case NORMAL_PRIORITY_CLASS
            sldPriority.Value = 3
            lblPrio(4).ForeColor = RGB(&HFF, 166, 0)
        Case IDLE_PRIORITY_CLASS
            sldPriority.Value = 4
            lblPrio(6).ForeColor = RGB(&HFF, &HFF, 0)
    End Select
    
    CurrProcess = GetProcessInfos(PID)

    txtModuleFullPath.Text = Trim(CurrProcess.szExeFile)  'ExePathFromProcID(PID)
    ret = InStrRev(txtModuleFullPath.Text, "\") + 1
    lblModuleName.Caption = Mid(txtModuleFullPath.Text, ret, Len(txtModuleFullPath.Text) - ret + 1)
    lblNbOfThreads.Caption = CurrProcess.cntThreads
    
    ret = CloseHandle(hProcess)
    
    ListView1.ListItems.Clear
    hSnapModules = CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, PID)
    Module2.dwSize = Len(Module2)
    Ok = Module32First(hSnapModules, Module2)
    While (Ok <> 0)
        cpt = cpt + 1
        Set ItemX = ListView1.ListItems.Add(, , VbString(Module2.szModule))
        ItemX.SubItems(1) = Module2.modBaseSize / 1024 & " Ko"
        ItemX.SubItems(2) = Module2.GlblcntUsage
        ItemX.SubItems(3) = Module2.ProccntUsage
        ItemX.SubItems(4) = GetPathOfFile(VbString(Module2.szExePath))
        Module2.szExePath = String(260, 0)
        Module2.szModule = String(256, 0)
        Ok = Module32Next(hSnapModules, Module2)
    Wend
    lbl1(0).Caption = cpt & " modules chargés :"
    
    CloseHandle hSnapModules

    ListView2.ListItems.Clear
    hSnapThreads = CreateToolhelp32Snapshot(TH32CS_SNAPTHREAD, 0&)
    If hSnapThreads = vbNull Then
        MsgBox "Impossible de parcourir les threads.", vbCritical + vbOKOnly
        Exit Sub
    End If

    Thread.dwSize = Len(Thread)
    Ok = Thread32First(hSnapThreads, Thread)
    cpt = 0
    While (Ok <> 0)
        If Thread.th32OwnerProcessID = PID Then
            cpt = cpt + 1
            ListView2.ListItems.Add , , Hex$(Thread.th32ThreadID), , 1
        End If
        Ok = Thread32Next(hSnapThreads, Thread)
    Wend
    ListView2.Arrange = lvwAutoLeft
    lbl1(1).Caption = cpt & IIf(cpt > 1, " threads crées :", " thread créé :")
    
    CloseHandle hSnapThreads

    tempBuf = GetNameOfFile(ExePathFromProcID(CurrProcess.th32ParentProcessID))
    If Trim(tempBuf) = "" Then tempBuf = "? (PID=" & Hex$(CurrProcess.th32ParentProcessID) & ")"
    lblCreator.Caption = tempBuf
    lblCreator.Tag = CurrProcess.th32ParentProcessID

End Sub


Public Function PriorityID(PriorityClass As Long)
    Select Case PriorityClass
        Case IDLE_PRIORITY_CLASS
            PriorityID = 4
        Case NORMAL_PRIORITY_CLASS
            PriorityID = 8
        Case HIGH_PRIORITY_CLASS
            PriorityID = 13
        Case REALTIME_PRIORITY_CLASS
            PriorityID = 24
    End Select
End Function

Private Sub ListView2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If (ListView2.HitTest(X, Y) Is Nothing) Then
        ListView2.MousePointer = ccDefault
    Else
        ListView2.MousePointer = ccCustom
    End If
End Sub

Private Sub ListView2_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If (Button <> 1) Or (ListView2.HitTest(X, Y) Is Nothing) Then Exit Sub
    If InStr(1, ListView2.HitTest(X, Y).Text, "?") <> 0 Then Exit Sub
    frmThreadInfos.TID = CLng("&H" & ListView2.HitTest(X, Y).Text)
    frmThreadInfos.RefreshThreadInfo
    frmThreadInfos.Visible = True
    frmThreadInfos.SetFocus
End Sub

Private Sub sldPriority_Change()
Dim hProcess As Long
Dim ret As Long

    If Working Then Exit Sub
    DrawNoPrio
    Working = True
    
        hProcess = OpenProcess(PROCESS_QUERY_INFORMATION Or &H10, False, PID)
        Select Case sldPriority.Value
            Case 4
                SetPriorityClass hProcess, IDLE_PRIORITY_CLASS
                lblPrio(6).ForeColor = RGB(&HFF, &HFF, 0)
            Case 3
                SetPriorityClass hProcess, NORMAL_PRIORITY_CLASS
                lblPrio(4).ForeColor = RGB(&HFF, 166, 0)
            Case 2
                SetPriorityClass hProcess, HIGH_PRIORITY_CLASS
                lblPrio(2).ForeColor = RGB(&HFF, 80, 0)
            Case 1
                SetPriorityClass hProcess, REALTIME_PRIORITY_CLASS
                lblPrio(0).ForeColor = &HFF
        End Select
        DoEvents
        ret = GetPriorityClass(hProcess)
        lblPriority.Caption = PriorityID(ret) & _
               " (" & Trim(PrioritiesStrings(ret \ 32)) & ")"
    
    Working = False
End Sub

Private Sub sldPriority_Scroll()
    sldPriority_Change
End Sub

Private Sub DrawNoPrio()
Dim cpt As Long
    For cpt = 0 To 3
        lblPrio(cpt * 2).ForeColor = vbWindowText
    Next cpt
End Sub


Private Sub Timer1_Timer()
Static xyCursor As POINTAPI
Static Xi, Yi As Long
    
    GetCursorPos xyCursor   ' Absolue
    ScreenToClient ListView1.hwnd, xyCursor  ' Relative

    Xi = xyCursor.X
    Yi = xyCursor.Y
    
    If Xi < 0 Or Xi >= (ListView1.Width \ Tppx) Or _
      Yi < 0 Or Yi >= (ListView1.Height \ Tppy) Then
        If (ListView1.Width <> (300 * Tppx)) Then
            ListView1.Width = 300 * Tppx
            ListView1.ZOrder 1
            Exit Sub
        End If
    End If
End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim hProcess As Long
Dim buf As String
Dim ans As Long

    Select Case Button.Index
        Case 1
            ShellExecute frmMain.hwnd, "explore", Mid(txtModuleFullPath.Text, 1, InStrRev(txtModuleFullPath.Text, "\")), "", "", SW_SHOWNORMAL
        Case 2
            ShellExecute frmMain.hwnd, "open", Mid(txtModuleFullPath.Text, 1, InStrRev(txtModuleFullPath.Text, "\")), "", "", SW_SHOWNORMAL
        Case 3
            buf = UCase("ê") & "tes-vous sûr(e) de vouloir tuer maintenant ce processus ?" _
                & vbCrLf & "Si vous le tuez de cette manière, il ne libèrera pas toute la mémoire qu'il a aloué."
            ans = MessageBox(Me.hwnd, buf, frmMain.Caption, MB_ICONEXCLAMATION Or MB_YESNOCANCEL)
            If ans <> IDYES Then Exit Sub
            hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, False, PID)
            If TerminateProcess(hProcess, 0) = 0 Then MsgBox "Impossible de tuer ce process !", vbExclamation
    End Select
End Sub


Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    ShowProcessInfos = False
End Sub
Private Sub Form_Resize()
    SetWindowPos Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
    ShowProcessInfos = True
End Sub


