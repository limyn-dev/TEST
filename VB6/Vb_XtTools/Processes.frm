VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmProcesses 
   Caption         =   "Xt Tools - Process"
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
   Icon            =   "Processes.frx":0000
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
   Begin MSComctlLib.TreeView trvProcesses 
      Height          =   2670
      Left            =   0
      TabIndex        =   0
      Top             =   15
      Width           =   2460
      _ExtentX        =   4339
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
      Text            =   "Processes.frx":014A
      Top             =   15
      Width           =   2985
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
      Left            =   3105
      Top             =   1455
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   4
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Processes.frx":0167
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Processes.frx":02CF
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Processes.frx":0437
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Processes.frx":0593
            Key             =   ""
         EndProperty
      EndProperty
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
      Begin VB.Menu optChangeProcessPrio 
         Caption         =   "Changer la priorité du Process"
         Begin VB.Menu optPrioIDLE 
            Caption         =   "IDLE"
         End
         Begin VB.Menu optPrioNORMAL 
            Caption         =   "NORMAL"
         End
         Begin VB.Menu optPrioHIGH 
            Caption         =   "HIGH"
         End
         Begin VB.Menu optPrioREALTIME 
            Caption         =   "REALTIME"
         End
      End
      Begin VB.Menu optChangeThreadPrio 
         Caption         =   "Changer la priorité du Thread"
         Begin VB.Menu optThreadPrioIDLE 
            Caption         =   "IDLE"
         End
         Begin VB.Menu optThreadPrioLOWEST 
            Caption         =   "LOWEST"
         End
         Begin VB.Menu optThreadPrioBELOWNORMAL 
            Caption         =   "BELOW NORMAL"
         End
         Begin VB.Menu optThreadPrioNORMAL 
            Caption         =   "NORMAL"
         End
         Begin VB.Menu optThreadPrioABOVENORMAL 
            Caption         =   "ABOVE NORMAL"
         End
         Begin VB.Menu optThreadPrioHIGHEST 
            Caption         =   "HIGHEST"
         End
         Begin VB.Menu optThreadPrioTIMECRITICAL 
            Caption         =   "TIME CRITICAL"
         End
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
         Caption         =   "ID des Process && Threads"
      End
      Begin VB.Menu optShowProcessesPriority 
         Caption         =   "Priorités des Process && Threads"
      End
      Begin VB.Menu optShowNbOpenedThreads 
         Caption         =   "Nombre de Threads ouverts"
      End
      Begin VB.Menu optShowFullPath 
         Caption         =   "Chemin complet des EXE"
      End
      Begin VB.Menu optShowCreator 
         Caption         =   "Créateur des Process && Threads"
      End
      Begin VB.Menu optSeparator0 
         Caption         =   "-"
      End
      Begin VB.Menu optShowWins 
         Caption         =   "Lister les fenêtres des Threads"
      End
      Begin VB.Menu optRecursiveSearch 
         Caption         =   "Recherche récursive des fenêtres"
      End
      Begin VB.Menu optSortList 
         Caption         =   "Trier alphanumériquement"
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
Attribute VB_Name = "frmProcesses"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'  Projet XtTools par Xavier Tello   (xavier.tello@wanadoo.fr)

Option Explicit

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
Private ShowNbOpenedThreads As Boolean
Private ShowFullPath As Boolean
Private ShowWins As Boolean
Private ShowCreator As Boolean
Private RecursiveSearch As Boolean
Private UseHotTracking As Boolean
Private SortList As Boolean
Private NbThreads As Long
Private NbProcesses As Long
Private NbWins As Long
Private WinsList() As TWinsLIST
Private dwDummy As Long
Private Working As Boolean

Private Sub Form_Load()
    ShowFullPath = True
    ShowNbOpenedThreads = True
    ShowPID = True
    ShowProcessesPriority = True
    ShowWins = True
    ShowCreator = True
    SortList = True
    RecursiveSearch = (Comm1 = 40)   ' This form is used for searching a window (in frmSearchWindow) : use recursive search
    UseHotTracking = True
        
    optShowFullPath.Checked = ShowFullPath
    optShowNbOpenedThreads.Checked = ShowNbOpenedThreads
    optShowPID.Checked = ShowPID
    optShowProcessesPriority.Checked = ShowProcessesPriority
    optShowWins.Checked = ShowWins
    optShowCreator.Checked = ShowCreator
    optRecursiveSearch.Checked = RecursiveSearch
    optSortList.Checked = SortList

    optHotTracking.Checked = UseHotTracking
    
    trvProcesses.HotTracking = UseHotTracking
        
    '  Add to the TreeView the root "MyComputer"
    trvProcesses.Nodes.Add , tvwFirst, "Root", "Mon Ordinateur", 4
    trvProcesses.Nodes("Root").Expanded = True
    
    SetWindowPos frmProcesses.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
    RefreshPIDsList
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    ShowProcesses = False
End Sub

Private Sub Form_Resize()
    trvProcesses.Width = Me.ScaleWidth
    trvProcesses.Height = Abs(Me.ScaleHeight - StatusBar1.Height)
    txtMessage.Width = trvProcesses.Width
    txtMessage.Height = trvProcesses.Height
    ShowProcesses = True
End Sub

Public Sub RefreshPIDsList()
    Dim hSnapProcesses As Long
    Dim hSnapThreads As Long
    Dim Process As PROCESSENTRY32
    Dim Thread As THREADENTRY32
    Dim Ok As Long
    Dim cpt As Long, cpt2 As Long, cpt3 As Long
    Dim TIDsList() As TTIDsLIST
    Dim ThreadNode As Node, ProcessNode As Node, WinNode As Node
    Dim ExeName As String
    Dim buf As String, ret As Long, tempBuf As String
    Dim NbFoundThreads As Long
    Dim TotalFoundThreads As Long
    Dim hWnd2 As Long
    Dim buf2 As String * 255
    Dim temp As Long
    
    If Working Then Exit Sub
    
    Working = True
    
    ' Lecture & Enregistrement des fenêtres  ## NON RECURSIF ##
    If Not ShowWins Then GoTo ListThreads
        
    NbWins = 1    ' Add the first windows (desktop window) to the list
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
        
    trvProcesses.Visible = False
    txtMessage.ZOrder 0
    ProgressBar1.ZOrder 0
    Me.Refresh
    DoEvents
    
    '  Vide le TreeView
    If trvProcesses.Nodes.Count > 1 Then
        trvProcesses.Nodes.Remove "Root"
        trvProcesses.Nodes.Add , tvwFirst, "Root", "Mon Ordinateur", 4
        trvProcesses.Nodes("Root").Expanded = True
    End If
    
    ' Lecture de la liste des process
    hSnapProcesses = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0&)
    If hSnapProcesses = vbNull Then
        MsgBox "Impossible de parcourir les processes.", vbCritical + vbOKOnly
        Working = False
        Exit Sub
    End If
    
    Process.dwSize = Len(Process)
    cpt = 0
    TotalFoundThreads = 0
    ProgressBar1.Value = 0
    Ok = Process32First(hSnapProcesses, Process)
    While (Ok <> 0)
        cpt = cpt + 1
        tempBuf = GetNameOfFile(ExePathFromProcID(Process.th32ParentProcessID))
        If Trim(tempBuf) = "" Then tempBuf = "? (PID=" & Hex$(Process.th32ParentProcessID) & ")"
        buf = IIf(ShowPID, Hex$(Process.th32ProcessID) & "    ", "")
        buf = buf & IIf(ShowProcessesPriority, "@" & Trim(Str(Process.pcPriClassBase)) & "    ", "")
        buf = buf & IIf(ShowNbOpenedThreads, "[" & Trim(Str(Process.cntThreads)) & "]    ", "")
        buf = buf & IIf(ShowFullPath, UCase(VbString(Process.szExeFile)), UCase(VbString(Mid(Process.szExeFile, InStrRev(Process.szExeFile, "\") + 1)))) & "    "
        buf = buf & IIf(ShowCreator, "Créateur : " & tempBuf, "")
        Set ProcessNode = trvProcesses.Nodes.Add("Root", tvwChild, "Process" & Hex$(Process.th32ProcessID), buf, 1)
        If SortList Then ProcessNode.Sorted = True
        ExeName = VbString(Mid(UCase(Process.szExeFile), 1 + InStrRev(Process.szExeFile, "\")))
        NbFoundThreads = 0
        For cpt2 = 1 To NbThreads
            If TIDsList(cpt2).dwOwnerPID = Process.th32ProcessID Then
                NbFoundThreads = NbFoundThreads + 1
                buf = IIf(ShowPID, Hex$(TIDsList(cpt2).dwTID) & "    ", "")
                buf = buf & IIf(ShowProcessesPriority, "@" & TIDsList(cpt2).dwPriority & "*   @" & Process.pcPriClassBase + TIDsList(cpt2).dwPriority & "     ", "")
                buf = buf & IIf(ShowCreator, ExeName, "")
                Set ThreadNode = trvProcesses.Nodes.Add(ProcessNode.Key, tvwChild, "Thread" & Hex$(TIDsList(cpt2).dwTID), buf, 2)
                If SortList Then ThreadNode.Sorted = True
                        If ShowWins Then
                            For cpt3 = 1 To NbWins
                                If WinsList(cpt3).dwOwnerTID = TIDsList(cpt2).dwTID Then
                                    buf = IIf(HexMode, String(8 - Len(Hex$(WinsList(cpt3).dwhWnd)), "0") & Hex$(WinsList(cpt3).dwhWnd), Format(CStr(WinsList(cpt3).dwhWnd), "0000000000"))
                                    buf = buf & "  """ & Trim(WinsList(cpt3).strWinCaption) & """"
                                    buf = buf & "  " & Trim(WinsList(cpt3).strWinClass)
                                    Set WinNode = trvProcesses.Nodes.Add(ThreadNode.Key, tvwChild, "Win" & Hex$(WinsList(cpt3).dwhWnd), buf, 3)
                                    If SortList Then WinNode.Sorted = True
                                End If
                            Next cpt3
                        End If
                TotalFoundThreads = TotalFoundThreads + 1
                temp = Int((TotalFoundThreads / NbThreads) * 100)
                ProgressBar1.Value = IIf(temp > 100, 100, temp)
                DoEvents
                If NbFoundThreads = Process.cntThreads Then Exit For
            End If
        Next cpt2
        Ok = Process32Next(hSnapProcesses, Process)
    Wend
            
    CloseHandle hSnapProcesses
    trvProcesses.Visible = True
    trvProcesses.ZOrder 0
    Working = False
            
    NbProcesses = cpt
    Me.Caption = "Xt Tools - Process  (" & cpt & " process ouverts)"
    StatusBar1.SimpleText = NbProcesses & " Process ; " & NbThreads & " Threads" & IIf(ShowWins, " ; " & NbWins & " Fenêtres.", ".")
    
End Sub

Private Sub optCaptureWindow_Click()
Dim HICON As Long
Dim ret As Long
    
    CurrhWnd = CLng("&H" & Mid(trvProcesses.SelectedItem.Key, 4))
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
    trvProcesses.HotTracking = UseHotTracking
End Sub

Private Sub optKill_Click()
Dim hProcess As Long
Dim CurrKey As String
Dim PID As Long
Dim TID As Long
Dim hWnd2 As Long
Dim ret As Long
Dim StopTime As Date

    CurrKey = trvProcesses.SelectedItem.Key
    
    If UCase(Left(CurrKey, 7)) = "PROCESS" Then
        If MsgBox(UCase("ê") & "tes-vous sûr(e) de vouloir tuer maintenant ce processus ?" _
            & vbCrLf & "Si vous le tuais de cette manière, il ne libèrera pas toute la mémoire qu'il a aloué.", _
            vbYesNoCancel + vbExclamation) <> vbYes Then Exit Sub
        PID = CLng("&H" & Mid(CurrKey, 8))
        hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, False, PID)
        If TerminateProcess(hProcess, 0) = 0 Then
            MsgBox "Impossible de tuer ce process !", vbExclamation
        Else
            trvProcesses.Nodes.Remove CurrKey
            NbProcesses = NbProcesses - 1
            Me.Caption = "Xt Tools - Process  (" & NbProcesses & " process ouverts)"
            StatusBar1.SimpleText = NbProcesses & " Process ; " & NbThreads & " Threads" & IIf(ShowWins, " ; " & NbWins & " Fenêtres.", ".")
        End If
    ElseIf UCase(Left(CurrKey, 6)) = "THREAD" Then
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
        ret = IsWindow(CurrhWnd)
        
        If (ret <> 0) Then
            MsgBox "Impossible de fermer cette fenêtre !", vbExclamation
        Else
            trvProcesses.Nodes.Remove CurrKey
            NbWins = NbWins - 1
            StatusBar1.SimpleText = NbProcesses & " Process ; " & NbThreads & " Threads" & IIf(ShowWins, " ; " & NbWins & " Fenêtres.", ".")
        End If
    Else
        Exit Sub
    End If
End Sub

Private Sub optLegend_Click()
    frmLegend.Show
End Sub

Private Sub optPrioHIGH_Click()
Dim hProcess As Long
Dim PID As Long
    
    PID = CLng("&H" & Mid(trvProcesses.SelectedItem.Key, 8))
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION Or &H10, False, PID)
    SetPriorityClass hProcess, HIGH_PRIORITY_CLASS
    DoEvents: RefreshPIDsList
End Sub
Private Sub optPrioIDLE_Click()
Dim hProcess As Long
Dim PID As Long
    
    PID = CLng("&H" & Mid(trvProcesses.SelectedItem.Key, 8))
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION Or &H10, False, PID)
    SetPriorityClass hProcess, IDLE_PRIORITY_CLASS
    DoEvents: RefreshPIDsList
End Sub
Private Sub optPrioNORMAL_Click()
Dim hProcess As Long
Dim PID As Long
    
    PID = CLng("&H" & Mid(trvProcesses.SelectedItem.Key, 8))
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION Or &H10, False, PID)
    SetPriorityClass hProcess, NORMAL_PRIORITY_CLASS
    DoEvents: RefreshPIDsList
End Sub
Private Sub optPrioREALTIME_Click()
Dim hProcess As Long
Dim PID As Long
    
    PID = CLng("&H" & Mid(trvProcesses.SelectedItem.Key, 8))
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION Or &H10, False, PID)
    SetPriorityClass hProcess, REALTIME_PRIORITY_CLASS
    DoEvents: RefreshPIDsList
End Sub

Private Sub optProperties_Click()
Dim CurrKey As String
Dim PID As Long
Dim TID As Long
Dim hWnd2 As Long

    CurrKey = trvProcesses.SelectedItem.Key
    
    If UCase(Left(CurrKey, 7)) = "PROCESS" Then
        PID = CLng("&H" & Mid(CurrKey, 8))
        frmProcessInfos.PID = PID
        frmProcessInfos.RefreshProcessInfo
        frmProcessInfos.Visible = True
        frmProcessInfos.SetFocus
    ElseIf UCase(Left(CurrKey, 6)) = "THREAD" Then
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
    RefreshPIDsList
End Sub

Public Sub optRefresh_Click()
    RefreshPIDsList
End Sub

Private Sub optShowCapturedWindow_Click()
Dim ans As Long
On Error GoTo Cassos
    trvProcesses.Nodes("Win" & Hex$(CurrhWnd)).EnsureVisible
    trvProcesses.Nodes("Win" & Hex$(CurrhWnd)).Selected = True
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

Private Sub optShowCreator_Click()
    optShowCreator.Checked = Not optShowCreator.Checked
    ShowCreator = optShowCreator.Checked
    RefreshPIDsList
End Sub
Private Sub optShowFullPath_Click()
    optShowFullPath.Checked = Not optShowFullPath.Checked
    ShowFullPath = optShowFullPath.Checked
    RefreshPIDsList
End Sub
Private Sub optShowPID_Click()
    optShowPID.Checked = Not optShowPID.Checked
    ShowPID = optShowPID.Checked
    RefreshPIDsList
End Sub
Private Sub optShowNbOpenedThreads_Click()
    optShowNbOpenedThreads.Checked = Not optShowNbOpenedThreads.Checked
    ShowNbOpenedThreads = optShowNbOpenedThreads.Checked
    RefreshPIDsList
End Sub
Private Sub optShowProcessesPriority_Click()
    optShowProcessesPriority.Checked = Not optShowProcessesPriority.Checked
    ShowProcessesPriority = optShowProcessesPriority.Checked
    RefreshPIDsList
End Sub
Private Sub optShowWins_Click()
    optShowWins.Checked = Not optShowWins.Checked
    ShowWins = optShowWins.Checked
    RefreshPIDsList
End Sub

Private Sub optSortList_Click()
    optSortList.Checked = Not optSortList.Checked
    SortList = optSortList.Checked
    RefreshPIDsList
End Sub

Private Sub trvProcesses_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim ClickedNode As Node
Dim hProcess As Long
Dim CurrKey As String
Dim PID As Long
Dim TID As Long
Dim ret As Long

    If (Button <> 2) Or (trvProcesses.HitTest(X, Y) Is Nothing) Then Exit Sub
    Set ClickedNode = trvProcesses.HitTest(X, Y)
    ClickedNode.Selected = True
    CurrKey = trvProcesses.SelectedItem.Key
        
    If CurrKey = "Root" Then
        optKill.Enabled = False
        optCaptureWindow.Enabled = False
        optChangeProcessPrio.Enabled = False
        optChangeThreadPrio.Enabled = False
        optProperties.Enabled = False
        PopupMenu mnuPopup, 2
        Exit Sub
    End If
    
    optKill.Enabled = True
    optProperties.Enabled = True
    optCaptureWindow.Enabled = (UCase(Left(ClickedNode.Key, 3)) = "WIN")
    optChangeProcessPrio.Enabled = (UCase(Left(ClickedNode.Key, 7)) = "PROCESS")
    optChangeThreadPrio.Enabled = (UCase(Left(ClickedNode.Key, 6)) = "THREAD")
    optShowCapturedWindow.Enabled = (CurrhWnd > 0)
    If optChangeProcessPrio.Enabled Then
        PID = CLng("&H" & Mid(CurrKey, 8))
        hProcess = OpenProcess(PROCESS_QUERY_INFORMATION Or &H10, False, PID)
        ret = GetPriorityClass(hProcess)
    
        optPrioREALTIME.Checked = (ret = REALTIME_PRIORITY_CLASS)
        optPrioHIGH.Checked = (ret = HIGH_PRIORITY_CLASS)
        optPrioNORMAL.Checked = (ret = NORMAL_PRIORITY_CLASS)
        optPrioIDLE.Checked = (ret = IDLE_PRIORITY_CLASS)
    ElseIf optChangeThreadPrio.Enabled Then
    
    
    End If
        
    PopupMenu mnuPopup, 2
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyF5 Then RefreshPIDsList
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

