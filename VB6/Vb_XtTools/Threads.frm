VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmThreads 
   Caption         =   "Xt Tools - Threads"
   ClientHeight    =   5325
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7140
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Threads.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   5325
   ScaleWidth      =   7140
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   285
      Left            =   165
      TabIndex        =   3
      Top             =   495
      Width           =   1875
      _ExtentX        =   3307
      _ExtentY        =   503
      _Version        =   393216
      Appearance      =   1
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   1
      Top             =   5070
      Width           =   7140
      _ExtentX        =   12594
      _ExtentY        =   450
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   2745
      Top             =   1245
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   3
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Threads.frx":014A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Threads.frx":02B2
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Threads.frx":040E
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TreeView trvThreads 
      Height          =   2670
      Left            =   0
      TabIndex        =   0
      Top             =   15
      Width           =   2430
      _ExtentX        =   4286
      _ExtentY        =   4710
      _Version        =   393217
      HideSelection   =   0   'False
      Indentation     =   529
      LabelEdit       =   1
      LineStyle       =   1
      Sorted          =   -1  'True
      Style           =   7
      HotTracking     =   -1  'True
      ImageList       =   "ImageList1"
      Appearance      =   1
   End
   Begin VB.TextBox txtMessage 
      Enabled         =   0   'False
      Height          =   2205
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Threads.frx":0576
      Top             =   15
      Width           =   2985
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "Popup"
      Visible         =   0   'False
      Begin VB.Menu optKill 
         Caption         =   "Tuer"
      End
      Begin VB.Menu optCaptureWindow 
         Caption         =   "Capturer"
      End
      Begin VB.Menu optProperties 
         Caption         =   "Propriétés"
      End
      Begin VB.Menu optChangeThreadPrio 
         Caption         =   "Changer la priorité du Thread"
      End
      Begin VB.Menu optRefresh 
         Caption         =   "Rafraîchir"
      End
      Begin VB.Menu optShowCapturedWindow 
         Caption         =   "Montrer la fenêtre capturée"
      End
      Begin VB.Menu optSeparator2 
         Caption         =   "-"
      End
      Begin VB.Menu optShowPID 
         Caption         =   "ID des Threads"
      End
      Begin VB.Menu optShowProcessesPriority 
         Caption         =   "Priorités des Threads"
      End
      Begin VB.Menu optShowFullPath 
         Caption         =   "Chemin complet des EXE"
      End
      Begin VB.Menu optSortList 
         Caption         =   "Trier alphanumériquement"
      End
      Begin VB.Menu optSeparator0 
         Caption         =   "-"
      End
      Begin VB.Menu optRecursiveSearch 
         Caption         =   "Recherche récursive des fenêtres"
      End
      Begin VB.Menu optShowWins 
         Caption         =   "Lister les fenêtres des Threads"
      End
      Begin VB.Menu optSeparator1 
         Caption         =   "-"
      End
      Begin VB.Menu optHotTracking 
         Caption         =   "HotTracking"
      End
      Begin VB.Menu optLegend 
         Caption         =   "Légende..."
      End
   End
End
Attribute VB_Name = "frmThreads"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'  Projet XtTools par Xavier Tello   (xavier.tello@wanadoo.fr)

Option Explicit

Private Type TPIDsLIST
    dwPID As Long
    strExeFullPath As String * 300
End Type

Private Type TTIDsLIST
    dwTID As Long
    dwOwnerPID As Long
    dwPriority As Long
End Type

Private Type TWinsLIST
    dwhWnd As Long
    dwOwnerTID As Long
    strWinClass As String * 128
    strWinCaption As String * 255
End Type

Private ShowPID As Boolean
Private ShowProcessesPriority As Boolean
Private ShowFullPath As Boolean
Private ShowWins As Boolean
Private RecursiveSearch As Boolean
Private UseHotTracking As Boolean
Private SortList As Boolean
Private NbThreads As Long
Private NbWins As Long
Private WinsList() As TWinsLIST
Private PIDsList() As TPIDsLIST
Private dwDummy As Long
Private Working As Boolean

Private Sub Form_Load()
    ShowFullPath = True
    ShowPID = True
    ShowProcessesPriority = True
    ShowWins = True
    SortList = True
    RecursiveSearch = (Comm1 = 40)   ' This form is used for searching a window (in frmSearchWindow) : use recursive search
    UseHotTracking = True
    
    optShowFullPath.Checked = ShowFullPath
    optShowPID.Checked = ShowPID
    optShowProcessesPriority.Checked = ShowProcessesPriority
    optShowWins.Checked = ShowWins
    optRecursiveSearch.Checked = RecursiveSearch
    optSortList.Checked = SortList

    optHotTracking.Checked = UseHotTracking
    
    trvThreads.HotTracking = UseHotTracking
    
    '  Add to the TreeView the root "MyComputer"
    trvThreads.Nodes.Add , tvwFirst, "Root", "Mon Ordinateur", 3
    trvThreads.Nodes("Root").Expanded = True
        
    SetWindowPos frmThreads.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
    RefreshTIDsList
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    ShowThreads = False
End Sub

Private Sub Form_Resize()
    trvThreads.Width = Me.ScaleWidth
    trvThreads.Height = Abs(Me.ScaleHeight - StatusBar1.Height)
    txtMessage.Width = trvThreads.Width
    txtMessage.Height = trvThreads.Height
    ShowThreads = True
End Sub

Public Sub RefreshTIDsList()
Dim hSnapProcesses As Long
Dim Process As PROCESSENTRY32
Dim hSnapThreads As Long
Dim Thread As THREADENTRY32
Dim Ok As Long
Dim cpt As Long, cpt2 As Long, cpt3 As Long
Dim TIDsList() As TTIDsLIST
Dim ThreadNode As Node, ProcessNode As Node, WinNode As Node
Dim ExeName As String
Dim buf As String, ret As Long
Dim NbFoundThreads As Long
Dim NbFoundProcesses As Long
Dim hWnd2 As Long
Dim buf2 As String * 255
Dim temp As Long
    
    If Working Then Exit Sub
    
    Working = True
    
    ' Lecture de la liste des process
    hSnapProcesses = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0&)
    If hSnapProcesses = vbNull Then
        MsgBox "Impossible de parcourir les processes.", vbCritical + vbOKOnly
        Exit Sub
    End If
    
    NbFoundProcesses = 0&
    Process.dwSize = Len(Process)
    Ok = Process32First(hSnapProcesses, Process)
    While (Ok <> 0)
        NbFoundProcesses = NbFoundProcesses + 1
        ReDim Preserve PIDsList(1 To NbFoundProcesses)
        PIDsList(NbFoundProcesses).dwPID = Process.th32ProcessID
        PIDsList(NbFoundProcesses).strExeFullPath = Process.szExeFile
        Ok = Process32Next(hSnapProcesses, Process)
    Wend
            
    CloseHandle hSnapProcesses
    
        
    
    ' Lecture & Enregistrement des fenêtres
    If Not ShowWins Then GoTo ListThreads
        
        NbWins = 1    ' Add the first window (desktop window) to the list
        ReDim WinsList(1 To NbWins)
        hWnd2 = GetDesktopWindow()
            
        WinsList(NbWins).dwhWnd = hWnd2
        
        buf2 = String(255, 0)
        ret = GetWindowText(hWnd2, buf2, 255)
        buf = Mid(buf2, 1, ret)
        WinsList(NbWins).strWinCaption = buf
            
        buf2 = String(255, 0)
        ret = GetClassName(hWnd2, buf2, 255)
        buf = Mid(buf2, 1, ret)
        WinsList(NbWins).strWinClass = buf

        WinsList(NbWins).dwOwnerTID = GetWindowThreadProcessId(hWnd2, dwDummy)
    
    If RecursiveSearch Then
        RecursiveWindowsListing GetDesktopWindow()
        GoTo ListThreads
    End If

    hWnd2 = GetWindow(hWnd2, GW_CHILD)
    cpt = 1
    While (Not IsNull(hWnd2)) And (hWnd2 <> 0)
        ReDim Preserve WinsList(1 To cpt)
        buf2 = String(255, 0)
        ret = GetWindowText(hWnd2, buf2, 255)
                
        WinsList(cpt).dwhWnd = hWnd2
        WinsList(cpt).strWinCaption = Left(buf2, ret)
        WinsList(cpt).dwOwnerTID = GetWindowThreadProcessId(hWnd2, dwDummy)
                
        buf2 = String(255, 0)
        ret = GetClassName(hWnd2, buf2, 255)
        WinsList(cpt).strWinClass = Mid(buf2, 1, ret)
                
        hWnd2 = GetWindow(hWnd2, GW_HWNDNEXT)
        cpt = cpt + 1
    Wend
    
NbWins = cpt - 1
ListThreads:
    
    ' Lecture & Enregistrement de la liste des Threads
    NbThreads = 0
    ReDim TIDsList(1 To 1)
    
    hSnapThreads = CreateToolhelp32Snapshot(TH32CS_SNAPTHREAD, 0&)
    If hSnapThreads = vbNull Then
        MsgBox "Impossible de parcourir les threads.", vbCritical + vbOKOnly
        Working = False
        Exit Sub
    End If
    
    Thread.dwSize = Len(Thread)
    Ok = Thread32First(hSnapThreads, Thread)
    cpt = 0
    While (Ok <> 0)
        cpt = cpt + 1
        ReDim Preserve TIDsList(1 To cpt)
        TIDsList(cpt).dwTID = Thread.th32ThreadID
        TIDsList(cpt).dwOwnerPID = Thread.th32OwnerProcessID
        TIDsList(cpt).dwPriority = Thread.tpDeltaPri
        Ok = Thread32Next(hSnapThreads, Thread)
    Wend
    NbThreads = cpt
    
    CloseHandle hSnapThreads
    
    trvThreads.Visible = False
    txtMessage.ZOrder 0
    ProgressBar1.ZOrder 0
    ProgressBar1.Value = 0
    Me.Refresh
    DoEvents
    
    If trvThreads.Nodes.Count > 1 Then
        trvThreads.Nodes.Remove "Root"
        trvThreads.Nodes.Add , tvwFirst, "Root", "Mon Ordinateur", 3
        trvThreads.Nodes("Root").Expanded = True
    End If
    
    For cpt2 = 1 To NbThreads
        For cpt = 1 To NbFoundProcesses
            If TIDsList(cpt2).dwOwnerPID = PIDsList(cpt).dwPID Then ExeName = UCase(Trim(PIDsList(cpt).strExeFullPath))
        Next cpt
        buf = IIf(ShowPID, Hex$(TIDsList(cpt2).dwTID) & "    ", "")
        buf = buf & IIf(ShowProcessesPriority, "@" & TIDsList(cpt2).dwPriority & "*     ", "")
        buf = buf & IIf(ShowFullPath, ExeName, Mid(ExeName, InStrRev(ExeName, "\") + 1))
        Set ThreadNode = trvThreads.Nodes.Add("Root", tvwChild, "Thread" & Hex$(TIDsList(cpt2).dwTID), buf, 1)
        If SortList Then ThreadNode.Sorted = True
        If ShowWins Then
            For cpt3 = 1 To NbWins
                If WinsList(cpt3).dwOwnerTID = TIDsList(cpt2).dwTID Then
                    buf = IIf(HexMode, String(8 - Len(Hex$(WinsList(cpt3).dwhWnd)), "0") & Hex$(WinsList(cpt3).dwhWnd), Format(CStr(WinsList(cpt3).dwhWnd), "0000000000"))
                    buf = buf & "  """ & Trim(WinsList(cpt3).strWinCaption) & """"
                    buf = buf & "  " & Trim(WinsList(cpt3).strWinClass)
                    Set WinNode = trvThreads.Nodes.Add(ThreadNode.Key, tvwChild, "Win" & Hex$(WinsList(cpt3).dwhWnd), buf, 2)
                    If SortList Then WinNode.Sorted = True
                End If
            Next cpt3
        End If
        temp = Int((cpt2 / NbThreads) * 100)
        ProgressBar1.Value = IIf(temp > 100, 100, temp)
    Next cpt2
    
    trvThreads.Visible = True
    trvThreads.ZOrder 0
    Working = False
    
    Me.Caption = "Xt Tools - Threads  (" & NbThreads & " threads ouverts)"
    StatusBar1.SimpleText = NbThreads & " Threads" & IIf(ShowWins, " ; " & NbWins & " Fenêtres.", ".")
    
End Sub

Private Sub optCaptureWindow_Click()
Dim HICON As Long
Dim ret As Long
    
    CurrhWnd = CLng("&H" & Mid(trvThreads.SelectedItem.Key, 4))
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
    If ShowWinInfos Then frmWinInfos.cmdRefresh_Click
    frmMain.SelectWinInList
End Sub

Private Sub optHotTracking_Click()
    optHotTracking.Checked = Not optHotTracking.Checked
    UseHotTracking = optHotTracking.Checked
    trvThreads.HotTracking = UseHotTracking
End Sub

Private Sub optKill_Click()
Dim hProcess As Long
Dim CurrKey As String
Dim TID As Long
Dim hWnd2 As Long
Dim ret As Long
Dim StopTime As Date

    CurrKey = trvThreads.SelectedItem.Key
    
    If UCase(Left(CurrKey, 6)) = "THREAD" Then
        If MsgBox(UCase("ê") & "tes-vous sûr(e) de vouloir tuer maintenant ce thread ?" _
            & vbCrLf & "Si vous le tuais de cette manière, il ne libèrera pas toute la mémoire qu'il a aloué.", _
            vbYesNoCancel + vbExclamation) <> vbYes Then Exit Sub
        TID = CLng("&H" & Mid(CurrKey, 7))
        hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, False, TID)
        If TerminateThread(hProcess, 0) = 0 Then MsgBox "Impossible de tuer ce thread !", vbExclamation
    ElseIf UCase(Left(CurrKey, 3)) = "WIN" Then
        hWnd2 = CLng("&H" & Mid(CurrKey, 4))

        ret = PostMessage(hWnd2, WM_CANCELMODE, 0, 0&)
        ret = PostMessage(hWnd2, WM_CLOSE, 0, 0&)
        DoEvents
        
        'Attendre une seconde avant de faire le test
        StopTime = DateAdd("s", 1, Now)
        Do:  DoEvents: Loop While Now <= StopTime
        
        'Teste si la fermeture a bien eu lieu (perte de connexion avec CurrhWnd)
        ret = IsWindow(hWnd2)
        
        If (ret <> 0) Then
            MsgBox "Impossible de fermer cette fenêtre !", vbExclamation
        Else
            trvThreads.Nodes.Remove CurrKey
            NbWins = NbWins - 1
            StatusBar1.SimpleText = NbThreads & " Threads" & IIf(ShowWins, " ; " & NbWins & " Fenêtres.", ".")
        End If
    Else
        Exit Sub
    End If
End Sub

Private Sub optLegend_Click()
    frmLegend.Show
End Sub

Private Sub optProperties_Click()
Dim CurrKey As String
Dim TID As Long
Dim hWnd2 As Long

    CurrKey = trvThreads.SelectedItem.Key
    
    If UCase(Left(CurrKey, 6)) = "THREAD" Then
        TID = CLng("&H" & Mid(CurrKey, 7))
        frmThreadInfos.TID = TID
        frmThreadInfos.RefreshThreadInfo
        frmThreadInfos.Visible = True
        frmThreadInfos.SetFocus
    ElseIf UCase(Left(CurrKey, 3)) = "WIN" Then
        hWnd2 = CLng("&H" & Mid(CurrKey, 4))
    End If

End Sub

Public Sub optRecursiveSearch_Click()
    optRecursiveSearch.Checked = Not optRecursiveSearch.Checked
    RecursiveSearch = optRecursiveSearch.Checked
    RefreshTIDsList
End Sub

Public Sub optRefresh_Click()
    RefreshTIDsList
End Sub

Private Sub optShowFullPath_Click()
    optShowFullPath.Checked = Not optShowFullPath.Checked
    ShowFullPath = optShowFullPath.Checked
    RefreshTIDsList
End Sub
Private Sub optShowPID_Click()
    optShowPID.Checked = Not optShowPID.Checked
    ShowPID = optShowPID.Checked
    RefreshTIDsList
End Sub
Private Sub optShowProcessesPriority_Click()
    optShowProcessesPriority.Checked = Not optShowProcessesPriority.Checked
    ShowProcessesPriority = optShowProcessesPriority.Checked
    RefreshTIDsList
End Sub
Private Sub optShowWins_Click()
    optShowWins.Checked = Not optShowWins.Checked
    ShowWins = optShowWins.Checked
    RefreshTIDsList
End Sub

Private Sub optSortList_Click()
    optSortList.Checked = Not optSortList.Checked
    SortList = optSortList.Checked
    RefreshTIDsList
End Sub

Private Sub optShowCapturedWindow_Click()
Dim ans As Long
On Error GoTo Cassos
    trvThreads.Nodes("Win" & Hex$(CurrhWnd)).EnsureVisible
    trvThreads.Nodes("Win" & Hex$(CurrhWnd)).Selected = True
Exit Sub
Cassos:
ans = MessageBox(Me.hwnd, "Impossible de trouver la fenêtre dans cette liste." & vbCrLf _
                 & "Voulez vous afficher toutes les fenêtres dans la liste pour trouver la fenêtre capturée ?", _
                 frmMain.Caption, MB_ICONQUESTION + MB_YESNO)
If ans = IDYES Then
    optRecursiveSearch_Click
    DoEvents
    optShowCapturedWindow_Click
End If
End Sub

Private Sub trvThreads_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim ClickedNode As Node
Dim CurrKey As String

    If (Button <> 2) Or (trvThreads.HitTest(X, Y) Is Nothing) Then Exit Sub
    Set ClickedNode = trvThreads.HitTest(X, Y)
    ClickedNode.Selected = True
    CurrKey = trvThreads.SelectedItem.Key

    If CurrKey = "Root" Then
        optKill.Enabled = False
        optCaptureWindow.Enabled = False
        optChangeThreadPrio.Enabled = False
        optProperties.Enabled = False
        PopupMenu mnuPopup, 2
        Exit Sub
    End If
    
    optKill.Enabled = True
    optProperties.Enabled = True
    optCaptureWindow.Enabled = (UCase(Left(ClickedNode.Key, 3)) = "WIN")
    optChangeThreadPrio.Enabled = (UCase(Left(ClickedNode.Key, 6)) = "THREAD")
    If optChangeThreadPrio.Enabled Then
    
    
    End If
    
    
    PopupMenu mnuPopup, 2
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyF5 Then RefreshTIDsList
End Sub

Private Sub RecursiveWindowsListing(ParenthWnd As Long)
Dim hWnd2 As Long
Dim cpt As Long, ret As Long
Dim buf As String, buf2 As String
Dim MatchSearch As Boolean
    
    hWnd2 = GetWindow(ParenthWnd, GW_CHILD)   '1er enfant
    If (hWnd2 = 0) Then Exit Sub
    cpt = 1
    ReDim ChildsOfWindow(1 To cpt)
    ChildsOfWindow(cpt) = hWnd2
    
    While (Not IsNull(hWnd2)) And (hWnd2 <> 0)
        ReDim Preserve ChildsOfWindow(1 To cpt)
        ChildsOfWindow(cpt) = hWnd2
                        
        NbWins = NbWins + 1
        ReDim Preserve WinsList(1 To NbWins)
        
        WinsList(NbWins).dwhWnd = hWnd2
        
        buf2 = String(255, 0)
        ret = GetWindowText(hWnd2, buf2, 255)
        buf = Mid(buf2, 1, ret)
        WinsList(NbWins).strWinCaption = buf
            
        buf2 = String(255, 0)
        ret = GetClassName(hWnd2, buf2, 255)
        buf = Mid(buf2, 1, ret)
        WinsList(NbWins).strWinClass = buf

        WinsList(NbWins).dwOwnerTID = GetWindowThreadProcessId(hWnd2, dwDummy)

        RecursiveWindowsListing hWnd2

        hWnd2 = GetWindow(hWnd2, GW_HWNDNEXT)
        cpt = cpt + 1
    Wend

End Sub

