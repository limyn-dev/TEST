VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmWindows 
   Caption         =   "Xt Tools - Fenêtres"
   ClientHeight    =   4215
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5220
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Windows.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   4215
   ScaleWidth      =   5220
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   285
      Left            =   165
      TabIndex        =   2
      Top             =   495
      Width           =   1875
      _ExtentX        =   3307
      _ExtentY        =   503
      _Version        =   393216
      Appearance      =   1
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   2925
      Top             =   1155
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Windows.frx":014A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Windows.frx":02A6
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TreeView trvWindows 
      Height          =   2490
      Left            =   0
      TabIndex        =   0
      Top             =   15
      Width           =   2400
      _ExtentX        =   4233
      _ExtentY        =   4392
      _Version        =   393217
      Indentation     =   529
      LabelEdit       =   1
      LineStyle       =   1
      Style           =   7
      ImageList       =   "ImageList1"
      Appearance      =   1
   End
   Begin VB.TextBox txtMessage 
      Enabled         =   0   'False
      Height          =   2205
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Windows.frx":0402
      Top             =   15
      Width           =   2985
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "Popup"
      Visible         =   0   'False
      Begin VB.Menu optClose 
         Caption         =   "Fermer"
      End
      Begin VB.Menu optCapture 
         Caption         =   "Capturer"
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
      Begin VB.Menu optShowhWnd 
         Caption         =   "Afficher le hWnd"
      End
      Begin VB.Menu optShowTitle 
         Caption         =   "Afficher le titre"
      End
      Begin VB.Menu optShowClassName 
         Caption         =   "Afficher le nom de la classe"
      End
      Begin VB.Menu optShowNbChilds 
         Caption         =   "Afficher le nombre d'enfants"
      End
      Begin VB.Menu optRecursiveSearch 
         Caption         =   "Arborescence récursive"
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
Attribute VB_Name = "frmWindows"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'  Projet XtTools par Xavier Tello   (xavier.tello@wanadoo.fr)

Option Explicit

Private ShowhWnd As Boolean
Private ShowClassName As Boolean
Private ShowTitle As Boolean
Private ShowNbChilds As Boolean
Private RecursiveSearch As Boolean
Private SortList As Boolean
Private UseHotTracking As Boolean
Private Working As Boolean
Private NbWindows As Long
Private NbFoundWindows As Long
Private temp As Long

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyF5 Then RefreshWinsList
End Sub

Private Sub Form_Load()
    ShowhWnd = True
    ShowClassName = True
    ShowTitle = True
    ShowNbChilds = True
    RecursiveSearch = True
    SortList = True
    UseHotTracking = True
    
    If (Comm1 = 40) Then Me.Move frmSearchWindow.Width, 0, Screen.Width - frmSearchWindow.Width
        
    optShowhWnd.Checked = ShowhWnd
    optShowClassName.Checked = ShowClassName
    optShowTitle.Checked = ShowTitle
    optShowNbChilds.Checked = ShowNbChilds
    optRecursiveSearch.Checked = RecursiveSearch
    optSortList.Checked = SortList
    optHotTracking.Checked = UseHotTracking
    
    trvWindows.HotTracking = UseHotTracking
    
    SetWindowPos frmWindows.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
    RefreshWinsList
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    ShowWindows = False
End Sub

Private Sub Form_Resize()
    trvWindows.Width = Me.ScaleWidth
    trvWindows.Height = Me.ScaleHeight
    txtMessage.Width = trvWindows.Width
    txtMessage.Height = trvWindows.Height
    ShowWindows = True
End Sub

Public Sub RefreshWinsList()
Dim DesktopWindow As Long
Dim buf As String
Dim buf2 As String * 255
Dim ret As Long
Dim temp As Long
    
    If Working Then Exit Sub
    
    Working = True

    DesktopWindow = GetDesktopWindow()
    
    NbWindows = 1
    CountChildsOfWindow DesktopWindow

    trvWindows.Visible = False
    txtMessage.ZOrder 0
    ProgressBar1.ZOrder 0
    ProgressBar1.Value = 0
    Me.Refresh
    DoEvents
    
    If trvWindows.Nodes.Count <> 0 Then trvWindows.Nodes.Remove "DesktopWindow"
        
    trvWindows.Sorted = SortList
            
    'Créer et affiche la racine : la "DesktopWindow"
    buf = IIf(HexMode, String(8 - Len(Hex$(DesktopWindow)), "0") & Hex$(DesktopWindow), Format(CStr(DesktopWindow), "0000000000")) & "   "
    If Not ShowhWnd Then buf = ""
    
    buf2 = String(255, 0)
    ret = GetWindowText(DesktopWindow, buf2, 255)
    If ShowTitle Then buf = buf & """" & Mid(buf2, 1, ret) & """  "
            
    buf2 = String(255, 0)
    ret = GetClassName(DesktopWindow, buf2, 255)
    If ShowClassName Then buf = buf & Mid(buf2, 1, ret) & "  "
    
    buf = buf & "    {""Bureau""  dans " & UCase("é") & "cran}"
    
    trvWindows.Nodes.Add , , "DesktopWindow", buf, 1
    
    NbFoundWindows = 1
    AddChildsOfWindow GetDesktopWindow(), "DesktopWindow"
    
    ' Développe l'arborescence crée
    trvWindows.Nodes("DesktopWindow").Expanded = True
    
    trvWindows.Visible = True
    trvWindows.ZOrder 0
    Working = False
    
    frmWindows.Caption = "Xt Tools - Fenêtres  (" & trvWindows.Nodes.Count & " fenêtres crées)"
    
End Sub

Private Sub optCapture_Click()
Dim HICON As Long
Dim ret As Long
    
    If IsNumeric("&H" & Mid(trvWindows.SelectedItem.Key, 4)) Then
        CurrhWnd = CLng("&H" & Mid(trvWindows.SelectedItem.Key, 4))
    Else
        CurrhWnd = GetDesktopWindow()  ' Key is "DesktopWindow"
    End If
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

Private Sub optClose_Click()
Dim CurrKey As String
Dim hWnd2 As Long
Dim ret As Long
Dim StopTime As Date
    
    CurrKey = trvWindows.SelectedItem.Key
    
    If UCase(Left(CurrKey, 3)) = "WIN" Then
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
            trvWindows.Nodes.Remove CurrKey
            frmWindows.Caption = "Xt Tools - Fenêtres  (" & trvWindows.Nodes.Count & " fenêtres crées)"
        End If
    Else
        Exit Sub
    End If
End Sub

Private Sub optLegend_Click()
    frmLegend.Show
End Sub

Private Sub optRecursiveSearch_Click()
    optRecursiveSearch.Checked = Not optRecursiveSearch.Checked
    RecursiveSearch = optRecursiveSearch.Checked
    RefreshWinsList
End Sub

Public Sub optRefresh_Click()
    RefreshWinsList
End Sub

Private Sub optShowClassName_Click()
    optShowClassName.Checked = Not optShowClassName.Checked
    ShowClassName = optShowClassName.Checked
    RefreshWinsList
End Sub

Private Sub optShowhWnd_Click()
    optShowhWnd.Checked = Not optShowhWnd.Checked
    ShowhWnd = optShowhWnd.Checked
    RefreshWinsList
End Sub

Private Sub optShowNbChilds_Click()
    optShowNbChilds.Checked = Not optShowNbChilds.Checked
    ShowNbChilds = optShowNbChilds.Checked
    RefreshWinsList
End Sub

Private Sub optShowTitle_Click()
    optShowTitle.Checked = Not optShowTitle.Checked
    ShowTitle = optShowTitle.Checked
    RefreshWinsList
End Sub

Private Sub optSortList_Click()
    optSortList.Checked = Not optSortList.Checked
    SortList = optSortList.Checked
    RefreshWinsList
End Sub

Private Sub optShowCapturedWindow_Click()
Dim ans As Long

If CurrhWnd <= 0 Then
    MessageBox Me.hwnd, "Aucune fenêtre n'est capturée !", frmMain.Caption, MB_ICONINFORMATION + MB_OK
    Exit Sub
End If

On Error GoTo Cassos
    trvWindows.Nodes("Win" & Hex$(CurrhWnd)).EnsureVisible
    trvWindows.Nodes("Win" & Hex$(CurrhWnd)).Selected = True
Exit Sub
Cassos:
ans = MessageBox(Me.hwnd, "Impossible de trouver la fenêtre dans cette liste." & vbCrLf _
                 & "Voulez vous rafraîchir la liste pour trouver la fenêtre capturée ?", _
                 frmMain.Caption, MB_ICONQUESTION + MB_YESNO)
If ans = IDYES Then
    optRefresh_Click
    DoEvents
    optShowCapturedWindow_Click
End If
End Sub

Private Sub trvWindows_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If (Button <> 2) Or (trvWindows.HitTest(X, Y) Is Nothing) Then Exit Sub
    trvWindows.HitTest(X, Y).Selected = True
    PopupMenu mnuPopup, 2
End Sub

Private Sub AddChildsOfWindow(ParenthWnd As Long, ParentKey As String)
Dim ChildsOfWindow() As Long
Dim hWnd2 As Long
Dim cpt As Long, ret As Long
Dim buf As String, buf2 As String
    
    hWnd2 = GetWindow(ParenthWnd, GW_CHILD)   '1er enfant
    cpt = 1
    ReDim ChildsOfWindow(1 To cpt)
    ChildsOfWindow(cpt) = hWnd2
    
    While (Not IsNull(hWnd2)) And (hWnd2 <> 0)
        ReDim Preserve ChildsOfWindow(1 To cpt)
        ChildsOfWindow(cpt) = hWnd2
                        
        If ShowhWnd Then _
        buf = IIf(HexMode, String(8 - Len(Hex$(hWnd2)), "0") & Hex$(hWnd2), Format(CStr(hWnd2), "0000000000")) & "  "
        
        buf2 = String(255, 0)
        ret = GetWindowText(hWnd2, buf2, 255)
        If ShowTitle Then buf = buf & """" & Mid(buf2, 1, ret) & """  "
                
        buf2 = String(255, 0)
        ret = GetClassName(hWnd2, buf2, 255)
        If ShowClassName Then buf = buf & Mid(buf2, 1, ret) & "  "
                
        ' Add the Node which represent a child
        If RecursiveSearch Then
            trvWindows.Nodes.Add ParentKey, tvwChild, "Win" & Hex$(hWnd2), buf, 2
        Else
            trvWindows.Nodes.Add "DesktopWindow", tvwChild, "Win" & Hex$(hWnd2), buf, 2
        End If
                
        NbFoundWindows = NbFoundWindows + 1
        temp = Int((NbFoundWindows / NbWindows) * 100)
        ProgressBar1.Value = IIf(temp > 100, 100, temp)

        AddChildsOfWindow hWnd2, "Win" & Hex$(hWnd2)
                
        hWnd2 = GetWindow(hWnd2, GW_HWNDNEXT)
        cpt = cpt + 1
    Wend

    If ShowNbChilds Then trvWindows.Nodes(ParentKey).Text = trvWindows.Nodes(ParentKey).Text & "  [" & (cpt - 1) & "]"
    If SortList Then trvWindows.Nodes(ParentKey).Sorted = True
End Sub

Private Sub CountChildsOfWindow(ParenthWnd As Long)
Dim hWnd2 As Long
Dim cpt As Long
    
    hWnd2 = GetWindow(ParenthWnd, GW_CHILD)   '1er enfant
    
    While (Not IsNull(hWnd2)) And (hWnd2 <> 0)
        NbWindows = NbWindows + 1
        CountChildsOfWindow hWnd2
        hWnd2 = GetWindow(hWnd2, GW_HWNDNEXT)
    Wend
End Sub

Private Sub optHotTracking_Click()
    optHotTracking.Checked = Not optHotTracking.Checked
    UseHotTracking = optHotTracking.Checked
    trvWindows.HotTracking = UseHotTracking
End Sub

