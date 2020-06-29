VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmWindowsList 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Fenêtres"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   300
   ClientWidth     =   4440
   Icon            =   "WindowsList.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4440
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   300
      Left            =   2820
      Top             =   2715
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   1935
      Left            =   -15
      TabIndex        =   1
      Top             =   0
      Width           =   3765
      _ExtentX        =   6641
      _ExtentY        =   3413
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      AllowReorder    =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   0
   End
   Begin VB.PictureBox Picture1 
      Align           =   2  'Align Bottom
      BorderStyle     =   0  'None
      Height          =   360
      Left            =   0
      ScaleHeight     =   360
      ScaleWidth      =   4440
      TabIndex        =   0
      Top             =   2835
      Width           =   4440
      Begin VB.CheckBox chkAddInvisbles 
         Caption         =   "+ Invisibles"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   30
         TabIndex        =   4
         Top             =   75
         Width           =   1140
      End
      Begin VB.CommandButton cmdRefresh 
         Caption         =   "Rafraîchir"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   3270
         TabIndex        =   3
         Top             =   30
         Width           =   1155
      End
      Begin VB.CheckBox chkAddTitleless 
         Caption         =   "+ Sans titres"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   1230
         TabIndex        =   2
         Top             =   75
         Value           =   1  'Checked
         Width           =   1230
      End
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "Popup"
      Visible         =   0   'False
      Begin VB.Menu optPeepWin 
         Caption         =   "Capturer"
      End
      Begin VB.Menu optCloseWin 
         Caption         =   "Fermer"
      End
      Begin VB.Menu optFlashWindow 
         Caption         =   "Faire clignoter"
      End
      Begin VB.Menu optSeparator0 
         Caption         =   "-"
      End
      Begin VB.Menu optHoverSelection 
         Caption         =   "HoverSelection"
      End
      Begin VB.Menu optHotTracking 
         Caption         =   "HotTracking"
      End
      Begin VB.Menu optGridLines 
         Caption         =   "GridLines"
      End
      Begin VB.Menu optSeparator1 
         Caption         =   "-"
      End
      Begin VB.Menu optRefresh 
         Caption         =   "Rafraîchir"
      End
      Begin VB.Menu optRefreshWithDelay 
         Caption         =   "Rafraîchir dans 3 secondes"
      End
   End
End
Attribute VB_Name = "frmWindowsList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'  Projet XtTools par Xavier Tello   (xavier.tello@wanadoo.fr)

Option Explicit

Public CurrWindowsIndex As Long


Private Sub chkAddInvisbles_Click()
    cmdRefresh_Click
End Sub

Private Sub chkAddTitleless_Click()
    cmdRefresh_Click
End Sub

Public Sub cmdRefresh_Click()
Dim hwnd As Long
Dim Titre_Fenetre As String * 255
Dim TitreFen As String
Dim ret As Long
Dim i As Integer
Dim itmX As ListItem
Dim OldSorted As Boolean
    
    ListView1.ListItems.Clear
    
    hwnd = GetDesktopWindow()
    hwnd = GetWindow(hwnd, GW_CHILD)
    
    OldSorted = ListView1.Sorted
    ListView1.Sorted = False 'Evite des ralentissements pendant l'ajout des lignes
    Me.Caption = "Fenêtres"
    Do While (Not IsNull(hwnd)) And (hwnd <> 0)
        Titre_Fenetre = String(255, 0)
        
        ret = GetWindowText(hwnd, Titre_Fenetre, 255)
        TitreFen = Titre_Fenetre
        TitreFen = Left(TitreFen, ret)
        If TitreFen = "" Then
            If chkAddTitleless.Value = 0 Then
                GoTo NextWin
            Else
                TitreFen = "   <<  Sans titre  >>"
            End If
        End If
                    
        If (IsWindowVisible(hwnd) = 1) Then
            Set itmX = ListView1.ListItems.Add(, , TitreFen)
            itmX.SubItems(1) = IIf(HexMode, _
                String(8 - Len(Hex$(hwnd)), "0") & Hex$(hwnd), _
                Format(CStr(hwnd), "0000000000"))
        Else
            If (chkAddInvisbles.Value = 1) Then
                Set itmX = ListView1.ListItems.Add(, , TitreFen)
                itmX.SubItems(1) = IIf(HexMode, _
                    String(8 - Len(Hex$(hwnd)), "0") & Hex$(hwnd), _
                    Format(CStr(hwnd), "0000000000"))
                ListView1.ListItems(ListView1.ListItems.Count).ForeColor = RGB(128, 128, 0)
            End If
        End If
NextWin:
        hwnd = GetWindow(hwnd, GW_HWNDNEXT)
    Loop

ListView1.Sorted = OldSorted
ListView1.Refresh
Me.Caption = "Fenêtres (" & ListView1.ListItems.Count & " fenêtres)"


If CurrhWnd <> -1 Then
    'Remet en gras la fenêtre capturée
    For ret = 1 To ListView1.ListItems.Count
        If CLng(IIf(HexMode, "&H", "") _
         & ListView1.ListItems(ret).SubItems(1)) = CurrhWnd Then
            ListView1.ListItems(ret).Bold = True
        Else
            ListView1.ListItems(ret).Bold = False
        End If
    Next ret
End If

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyF5 Then cmdRefresh_Click
End Sub

Private Sub Form_Load()
    frmMain.Toolbar1.Buttons(16).Value = tbrPressed
    ListView1.ColumnHeaders.Add , , "Titre", _
        Abs(ListView1.Width - (Tppx * (GetSystemMetrics(SM_CXVSCROLL) + 6 + 74)))
    ListView1.ColumnHeaders.Add , , "hWnd", 74 * Tppx, lvwColumnCenter
    optHotTracking.Checked = ListView1.HotTracking
    optHoverSelection.Checked = ListView1.HoverSelection
    optGridLines.Checked = ListView1.GridLines
    ListView1.View = lvwReport
    CurrWindowsIndex = -1
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    frmMain.Toolbar1.Buttons(16).Value = tbrUnpressed
End Sub

Private Sub Form_Resize()
    If Me.WindowState = 0 Then
        ListView1.Width = Picture1.Width
        ListView1.Height = Abs(Picture1.Top)
        cmdRefresh.Left = Picture1.Width - cmdRefresh.Width - 2 * Tppx
        Timer1.Enabled = True
    End If
End Sub

Private Sub ListView1_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
    ListView1.SortKey = ColumnHeader.Index - 1
    If Not ListView1.Sorted Then
        ListView1.SortOrder = lvwAscending
        ListView1.Sorted = True
        Exit Sub
    End If
    If ListView1.SortOrder = lvwDescending Then
        ListView1.Sorted = False: DoEvents
    Else
        ListView1.SortOrder = lvwDescending
    End If
    cmdRefresh_Click
End Sub

Private Sub ListView1_DblClick()
Dim HICON As Long
Dim ret As Long
        If CurrWindowsIndex <> -1 Then
            For ret = 1 To ListView1.ListItems.Count
                ListView1.ListItems(ret).Bold = False
            Next ret
        End If
        CurrWindowsIndex = ListView1.SelectedItem.Index
        ListView1.ListItems(CurrWindowsIndex).Bold = True
        CurrhWnd = CLng(IIf(HexMode, "&H" & ListView1.SelectedItem.SubItems(1), ListView1.SelectedItem.SubItems(1)))
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
End Sub

Private Sub ListView1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button <> 2 Then Exit Sub
    PopupMenu mnuPopup, 2, X, Y + (10 * Tppy), optPeepWin
End Sub

Private Sub optCloseWin_Click()
Dim ret As Long
Dim Handle As Long
Dim StopTime As Date

Handle = CLng(IIf(HexMode, "&H" & ListView1.SelectedItem.SubItems(1), ListView1.SelectedItem.SubItems(1)))
ret = PostMessage(Handle, WM_CANCELMODE, 0, 0&)
ret = PostMessage(Handle, WM_CLOSE, 0, 0&)
DoEvents

'Attendre une seconde avant de faire le test
StopTime = DateAdd("s", 1, Now)
Do:  DoEvents: Loop While Now <= StopTime

'Teste si la fermeture a bien eu lieu (perte de connexion avec CurrhWnd)
ret = IsWindow(Handle)

If ret <> 0 Then
    MessageBox Me.hwnd, "Impossible de fermer cette fenêtre !", frmMain.Caption, MB_ICONEXCLAMATION
    Exit Sub
Else
    cmdRefresh_Click
    If frmWinStyles.Visible Then frmWinStyles.cmdRefresh_Click
End If

End Sub

Private Sub optFlashWindow_Click()
Dim ret As Long
Dim Handle As Long
Dim cpt As Long

Handle = CLng(IIf(HexMode, "&H" & ListView1.SelectedItem.SubItems(1), ListView1.SelectedItem.SubItems(1)))

For cpt = 0 To 5
    ret = FlashWindow(Handle, 3)
    DoEvents
    For ret = 1 To 10000: DoEvents: Next ret
Next cpt
    ret = FlashWindow(Handle, 0)

End Sub

Private Sub optGridLines_Click()
    optGridLines.Checked = Not optGridLines.Checked
    ListView1.GridLines = optGridLines.Checked
End Sub
Private Sub optHotTracking_Click()
    optHotTracking.Checked = Not optHotTracking.Checked
    ListView1.HotTracking = optHotTracking.Checked
End Sub
Private Sub optHoverSelection_Click()
    optHoverSelection.Checked = Not optHoverSelection.Checked
    ListView1.HoverSelection = optHoverSelection.Checked
End Sub

Private Sub optPeepWin_Click()
    ListView1_DblClick
End Sub

Private Sub optRefresh_Click()
    cmdRefresh_Click
End Sub

Private Sub optRefreshWithDelay_Click()
    Picture1_DblClick
End Sub

Private Sub Picture1_DblClick()
Dim StopTime As Date
Dim cpt As Long
Dim OldWinTitle As String

OldWinTitle = Me.Caption
Me.Caption = "Refreshing in 3 seconds."
DoEvents
Beep
For cpt = 3 To 1 Step -1
    Me.Caption = "Refreshing in " & cpt & " second" & IIf(cpt = 1, ".", "s.")
    DoEvents
    StopTime = DateAdd("s", 1, Now)
    Do: DoEvents: Loop While Now < StopTime
Next cpt
    Me.Caption = "Refreshing..."
Beep
cmdRefresh_Click
Me.Caption = OldWinTitle
End Sub

Private Sub Timer1_Timer()
    Timer1.Enabled = False
    DoEvents
    ListView1.Width = Picture1.Width
    ListView1.Height = Abs(Picture1.Top)
    cmdRefresh.Left = Picture1.Width - cmdRefresh.Width - 2 * Tppx
    ListView1.ColumnHeaders(1).Width = Abs(ListView1.Width - (Tppx * (GetSystemMetrics(SM_CXVSCROLL) + 6 + 74)))
    ListView1.ColumnHeaders(2).Width = 74 * Tppx
End Sub

Public Sub SetHexMode()
Dim cpt As Long
Dim h As Long
    For cpt = 1 To ListView1.ListItems.Count
        h = CLng(ListView1.ListItems(cpt).SubItems(1))
        ListView1.ListItems(cpt).SubItems(1) = _
            String(8 - Len(Hex$(h)), "0") & Hex$(h)
    Next cpt
End Sub

Public Sub SetDecMode()
Dim cpt As Long
    For cpt = 1 To ListView1.ListItems.Count
        ListView1.ListItems(cpt).SubItems(1) = _
         Format( _
         CStr(CLng("&H" & ListView1.ListItems(cpt).SubItems(1))), "0000000000")
    Next cpt
End Sub

