VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmWinStyles 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Styles"
   ClientHeight    =   2775
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4470
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "WinStyles.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2775
   ScaleWidth      =   4470
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ListView ListView1 
      Height          =   2205
      Left            =   30
      TabIndex        =   0
      Top             =   540
      Width           =   2190
      _ExtentX        =   3863
      _ExtentY        =   3889
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
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
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "Refresh"
      Height          =   300
      Left            =   1868
      TabIndex        =   2
      ToolTipText     =   "Refresh"
      Top             =   30
      Width           =   735
   End
   Begin MSComctlLib.ListView ListView2 
      Height          =   2205
      Left            =   2250
      TabIndex        =   1
      Top             =   540
      Width           =   2190
      _ExtentX        =   3863
      _ExtentY        =   3889
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
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
   Begin VB.Label lblWinExStyles 
      ForeColor       =   &H00008000&
      Height          =   210
      Left            =   2280
      TabIndex        =   6
      Top             =   330
      Width           =   2070
   End
   Begin VB.Label lblWinStyles 
      ForeColor       =   &H00008000&
      Height          =   210
      Left            =   60
      TabIndex        =   5
      Top             =   330
      Width           =   2070
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Extended Styles :"
      Height          =   195
      Left            =   2775
      TabIndex        =   4
      Top             =   75
      Width           =   1275
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Window Styles :"
      Height          =   195
      Left            =   585
      TabIndex        =   3
      Top             =   75
      Width           =   1155
   End
End
Attribute VB_Name = "frmWinStyles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'  Projet XtTools par Xavier Tello   (xavier.tello@wanadoo.fr)

Option Explicit

Public Sub cmdRefresh_Click()
Dim itmX As ListItem
Dim WinStyles As Long
Dim WinExStyles As Long
Dim ret As Long
Dim WinTxt As String
Dim OldSorted As Boolean
    
    ListView1.ListItems.Clear
    ListView2.ListItems.Clear

'If frmChoosehWnd.Visible Then Exit Sub
If CurrhWnd <= 0 Then Exit Sub
If (Not Me.Visible) Then Me.Show

WinTxt = String(255, Chr(0))
ret = GetWindowText(CurrhWnd, WinTxt, 255)
Me.Caption = "Styles - " & Mid(WinTxt, 1, ret)

WinStyles = GetWindowLong(CurrhWnd, GWL_STYLE)
WinExStyles = GetWindowLong(CurrhWnd, GWL_EXSTYLE)
lblWinStyles.Caption = "(" & IIf(HexMode, Hex(WinStyles), WinStyles) & ")"
lblWinExStyles.Caption = "(" & IIf(HexMode, Hex(WinExStyles), WinExStyles) & ")"
    
    OldSorted = ListView1.Sorted
    ListView1.Sorted = False 'Evite des ralentissements pendant l'ajout des lignes
    
    Set itmX = ListView1.ListItems.Add(, , "BORDER")
        itmX.SubItems(1) = IIf((WinStyles And WS_BORDER) = WS_BORDER, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "CAPTION")
        itmX.SubItems(1) = IIf((WinStyles And WS_CAPTION) = WS_CAPTION, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "CHILD")
        itmX.SubItems(1) = IIf((WinStyles And WS_CHILD) = WS_CHILD, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "CLIPCHILDREN")
        itmX.SubItems(1) = IIf((WinStyles And WS_CLIPCHILDREN) = WS_CLIPCHILDREN, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "CLIPSIBLINGS")
        itmX.SubItems(1) = IIf((WinStyles And WS_CLIPSIBLINGS) = WS_CLIPSIBLINGS, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "DISABLED")
        itmX.SubItems(1) = IIf((WinStyles And WS_DISABLED) = WS_DISABLED, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "DLGFRAME")
        itmX.SubItems(1) = IIf((WinStyles And WS_DLGFRAME) = WS_DLGFRAME, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "GROUP")
        itmX.SubItems(1) = IIf((WinStyles And WS_GROUP) = WS_GROUP, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "HSCROLL")
        itmX.SubItems(1) = IIf((WinStyles And WS_HSCROLL) = WS_HSCROLL, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "VSCROLL")
        itmX.SubItems(1) = IIf((WinStyles And WS_VSCROLL) = WS_VSCROLL, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "MINIMIZE")
        itmX.SubItems(1) = IIf((WinStyles And WS_MINIMIZE) = WS_MINIMIZE, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "MAXIMIZE")
        itmX.SubItems(1) = IIf((WinStyles And WS_MAXIMIZE) = WS_MAXIMIZE, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "MAXIMIZEBOX")
        itmX.SubItems(1) = IIf((WinStyles And WS_MAXIMIZEBOX) = WS_MAXIMIZEBOX, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "MINIMIZEBOX")
        itmX.SubItems(1) = IIf((WinStyles And WS_MINIMIZEBOX) = WS_MINIMIZEBOX, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "OVERLAPPED")
        itmX.SubItems(1) = IIf((WinStyles And WS_OVERLAPPED) = WS_OVERLAPPED, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "POPUP")
        itmX.SubItems(1) = IIf((WinStyles And WS_POPUP) = WS_POPUP, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "SYSMENU")
        itmX.SubItems(1) = IIf((WinStyles And WS_SYSMENU) = WS_SYSMENU, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "TABSTOP")
        itmX.SubItems(1) = IIf((WinStyles And WS_TABSTOP) = WS_TABSTOP, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "THICKFRAME")
        itmX.SubItems(1) = IIf((WinStyles And WS_THICKFRAME) = WS_THICKFRAME, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "VISIBLE")
        itmX.SubItems(1) = IIf((WinStyles And WS_VISIBLE) = WS_VISIBLE, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "CHILDWINDOW")
        itmX.SubItems(1) = IIf((WinStyles And WS_CHILDWINDOW) = WS_CHILDWINDOW, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "ICONIC")
        itmX.SubItems(1) = IIf((WinStyles And WS_ICONIC) = WS_ICONIC, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "OVERLAPPEDWINDOW")
        itmX.SubItems(1) = IIf((WinStyles And WS_OVERLAPPEDWINDOW) = WS_OVERLAPPEDWINDOW, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "POPUPWINDOW")
        itmX.SubItems(1) = IIf((WinStyles And WS_POPUPWINDOW) = WS_POPUPWINDOW, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "SIZEBOX")
        itmX.SubItems(1) = IIf((WinStyles And WS_SIZEBOX) = WS_SIZEBOX, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "TILED")
        itmX.SubItems(1) = IIf((WinStyles And WS_TILED) = WS_TILED, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView1.ListItems.Add(, , "TILEDWINDOW")
        itmX.SubItems(1) = IIf((WinStyles And WS_TILEDWINDOW) = WS_TILEDWINDOW, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight

    Set itmX = ListView2.ListItems.Add(, , "ACCEPTFILES")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_ACCEPTFILES) = WS_EX_ACCEPTFILES, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "DLGMODALFRAME")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_DLGMODALFRAME) = WS_EX_DLGMODALFRAME, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "NOPARENTNOTIFY")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_NOPARENTNOTIFY) = WS_EX_NOPARENTNOTIFY, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "TOPMOST")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_TOPMOST) = WS_EX_TOPMOST, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "TRANSPARENT")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_TRANSPARENT) = WS_EX_TRANSPARENT, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "MDICHILD")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_MDICHILD) = WS_EX_MDICHILD, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "TOOLWINDOW")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_TOOLWINDOW) = WS_EX_TOOLWINDOW, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "WINDOWEDGE")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_WINDOWEDGE) = WS_EX_WINDOWEDGE, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "CLIENTEDGE")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_CLIENTEDGE) = WS_EX_CLIENTEDGE, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "CONTEXTHELP")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_CONTEXTHELP) = WS_EX_CONTEXTHELP, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "RIGHT")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_RIGHT) = WS_EX_RIGHT, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "LEFT")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_LEFT) = WS_EX_LEFT, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "RTLREADING")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_RTLREADING) = WS_EX_RTLREADING, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "LTRREADING")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_LTRREADING) = WS_EX_LTRREADING, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "LEFTSCROLLBAR")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_LEFTSCROLLBAR) = WS_EX_LEFTSCROLLBAR, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "RIGHTSCROLLBAR")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_RIGHTSCROLLBAR) = WS_EX_RIGHTSCROLLBAR, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "CONTROLPARENT")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_CONTROLPARENT) = WS_EX_CONTROLPARENT, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "STATICEDGE")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_STATICEDGE) = WS_EX_STATICEDGE, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "APPWINDOW")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_APPWINDOW) = WS_EX_APPWINDOW, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "OVERLAPPEDWINDOW")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_OVERLAPPEDWINDOW) = WS_EX_OVERLAPPEDWINDOW, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight
    Set itmX = ListView2.ListItems.Add(, , "PALETTEWINDOW")
        itmX.SubItems(1) = IIf((WinExStyles And WS_EX_PALETTEWINDOW) = WS_EX_PALETTEWINDOW, "1", "0")
        If itmX.SubItems(1) = "1" Then itmX.ForeColor = vbHighlight

    If Me.Visible Then
        On Error Resume Next
        ListView1.SetFocus
        ListView1.Sorted = OldSorted
        ListView1.Refresh
    End If

End Sub

Private Sub Form_Load()
    frmMain.Toolbar1.Buttons(17).Value = tbrPressed
    SetWindowPos Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
    
    ListView1.ColumnHeaders.Add , , "Style  (WS_*)", ListView1.Width - (Tppx * (GetSystemMetrics(SM_CXVSCROLL) + 6 + 18))
    ListView1.ColumnHeaders.Add , , "", 18 * Tppx, lvwColumnCenter
    ListView1.View = lvwReport
    
    ListView2.ColumnHeaders.Add , , "Style  (WS_EX_*)", ListView1.Width - (Tppx * (GetSystemMetrics(SM_CXVSCROLL) + 6 + 18))
    ListView2.ColumnHeaders.Add , , "", 18 * Tppx, lvwColumnCenter
    ListView2.View = lvwReport

    cmdRefresh_Click
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    frmMain.Toolbar1.Buttons(17).Value = tbrUnpressed
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
        cmdRefresh_Click
    Else
        ListView1.SortOrder = lvwDescending
    End If
End Sub

Private Sub ListView2_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
    ListView2.SortKey = ColumnHeader.Index - 1
    If Not ListView2.Sorted Then
        ListView2.SortOrder = lvwAscending
        ListView2.Sorted = True
        Exit Sub
    End If
    If ListView2.SortOrder = lvwDescending Then
        ListView2.Sorted = False: DoEvents
        cmdRefresh_Click
    Else
        ListView2.SortOrder = lvwDescending
    End If
End Sub

Private Sub ListView1_DblClick()
Dim Title As String
    
    Title = frmMain.Caption
    Select Case ListView1.SelectedItem
        Case "BORDER"
            MessageBox Me.hwnd, "WS_BORDER : Creates a window that has a border.", Title, MB_ICONINFORMATION
        Case "CAPTION"
            MessageBox Me.hwnd, "WS_CAPTION : Creates a window that has a title bar (implies the WS_BORDER style). Cannot be used with the WS_DLGFRAME style.", Title, MB_ICONINFORMATION
        Case "CHILD"
            MessageBox Me.hwnd, "WS_CHILD : Creates a child window. Cannot be used with the WS_POPUP style.", Title, MB_ICONINFORMATION
        Case "CLIPCHILDREN"
            MessageBox Me.hwnd, "WS_CLIPCHILDREN : Excludes the area occupied by child windows when you draw within the parent window. Used when you create the parent window.", Title, MB_ICONINFORMATION
        Case "CLIPSIBLINGS"
            MessageBox Me.hwnd, "WS_CLIPSIBLINGS : Clips child windows relative to each other; that is, when a particular child window receives a paint message, the WS_CLIPSIBLINGS style clips all other overlapped child windows out of the region of the child window to be updated. (If WS_CLIPSIBLINGS is not given and child windows overlap, when you draw within the client area of a child window, it is possible to draw within the client area of a neighboring child window.) For use with the WS_CHILD style only.", Title, MB_ICONINFORMATION
        Case "DISABLED"
            MessageBox Me.hwnd, "WS_DISABLED : Creates a window that is initially disabled.", Title, MB_ICONINFORMATION
        Case "DLGFRAME"
            MessageBox Me.hwnd, "WS_DLGFRAME : Creates a window with a double border but no title.", Title, MB_ICONINFORMATION
        Case "GROUP"
            MessageBox Me.hwnd, "WS_GROUP : Specifies the first control of a group of controls in which the user can move from one control to the next with the arrow keys. All controls defined with the WS_GROUP style FALSE after the first control belong to the same group. The next control with the WS_GROUP style starts the next group (that is, one group ends where the next begins).", Title, MB_ICONINFORMATION
        Case "HSCROLL"
            MessageBox Me.hwnd, "WS_HSCROLL : Creates a window that has a horizontal scroll bar.", Title, MB_ICONINFORMATION
        Case "MAXIMIZE"
            MessageBox Me.hwnd, "WS_MAXIMIZE : Creates a window of maximum size.", Title, MB_ICONINFORMATION
        Case "MAXIMIZEBOX"
            MessageBox Me.hwnd, "WS_MAXIMIZEBOX : Creates a window that has a Maximize button.", Title, MB_ICONINFORMATION
        Case "MINIMIZE"
            MessageBox Me.hwnd, "WS_MINIMIZE : Creates a window that is initially minimized. For use with the WS_OVERLAPPED style only.", Title, MB_ICONINFORMATION
        Case "MINIMIZEBOX"
            MessageBox Me.hwnd, "WS_MINIMIZEBOX : Creates a window that has a Minimize button.", Title, MB_ICONINFORMATION
        Case "OVERLAPPED"
            MessageBox Me.hwnd, "WS_OVERLAPPED : Creates an overlapped window. An overlapped window usually has a caption and a border.", Title, MB_ICONINFORMATION
        Case "OVERLAPPEDWINDOW"
            MessageBox Me.hwnd, "WS_OVERLAPPEDWINDOW : Creates an overlapped window with the WS_OVERLAPPED, WS_CAPTION, WS_SYSMENU, WS_THICKFRAME, WS_MINIMIZEBOX, and WS_MAXIMIZEBOX styles.", Title, MB_ICONINFORMATION
        Case "POPUP"
            MessageBox Me.hwnd, "WS_POPUP : Creates a pop-up window. Cannot be used with the WS_CHILD style.", Title, MB_ICONINFORMATION
        Case "POPUPWINDOW"
            MessageBox Me.hwnd, "WS_POPUPWINDOW : Creates a pop-up window with the WS_BORDER, WS_POPUP, and WS_SYSMENU styles. The WS_CAPTION style must be combined with the WS_POPUPWINDOW style to make the Control menu visible.", Title, MB_ICONINFORMATION
        Case "SYSMENU"
            MessageBox Me.hwnd, "WS_SYSMENU : Creates a window that has a Control-menu box in its title bar. Used only for windows with title bars.", Title, MB_ICONINFORMATION
        Case "TABSTOP"
            MessageBox Me.hwnd, "WS_TABSTOP : Specifies one of any number of controls through which the user can move by using the TAB key. The TAB key moves the user to the next control specified by the WS_TABSTOP style.", Title, MB_ICONINFORMATION
        Case "THICKFRAME"
            MessageBox Me.hwnd, "WS_THICKFRAME : Creates a window with a thick frame that can be used to size the window.", Title, MB_ICONINFORMATION
        Case "VISIBLE"
            MessageBox Me.hwnd, "WS_VISIBLE : Creates a window that is initially visible.", Title, MB_ICONINFORMATION
        Case "VSCROLL"
            MessageBox Me.hwnd, "WS_VSCROLL : Creates a window that has a vertical scroll bar.", Title, MB_ICONINFORMATION
    End Select
End Sub

Private Sub ListView2_DblClick()
Dim Title As String
    
    Title = frmMain.Caption
    Select Case ListView2.SelectedItem
        Case "ACCEPTFILES"
            MessageBox Me.hwnd, "WS_EX_ACCEPTFILES : Specifies that a window created with this style accepts drag-and-drop files.", Title, MB_ICONINFORMATION
        Case "CLIENTEDGE"
            MessageBox Me.hwnd, "WS_EX_CLIENTEDGE : Specifies that a window has a 3D look — that is, a border with a sunken edge.", Title, MB_ICONINFORMATION
        Case "CONTEXTHELP"
            MessageBox Me.hwnd, "WS_EX_CONTEXTHELP : Includes a question mark in the title bar of the window. When the user clicks the question mark, the cursor changes to a question mark with a pointer. If the user then clicks a child window, the child receives a WM_HELP message.", Title, MB_ICONINFORMATION
        Case "CONTROLPARENT"
            MessageBox Me.hwnd, "WS_EX_CONTROLPARENT : Allows the user to navigate among the child windows of the window by using the TAB key.", Title, MB_ICONINFORMATION
        Case "DLGMODALFRAME"
            MessageBox Me.hwnd, "WS_EX_DLGMODALFRAME : Designates a window with a double border that may (optionally) be created with a title bar when you specify the WS_CAPTION style flag in the dwStyle parameter.", Title, MB_ICONINFORMATION
        Case "LEFT"
            MessageBox Me.hwnd, "WS_EX_LEFT : Gives window generic left-aligned properties. This is the default.", Title, MB_ICONINFORMATION
        Case "LEFTSCROLLBAR"
            MessageBox Me.hwnd, "WS_EX_LEFTSCROLLBAR : Places a  vertical scroll bar to the left of the client area.", Title, MB_ICONINFORMATION
        Case "LTRREADING"
            MessageBox Me.hwnd, "WS_EX_LTRREADING : Displays the window text using left-to-right reading order properties. This is the default.", Title, MB_ICONINFORMATION
        Case "MDICHILD"
            MessageBox Me.hwnd, "WS_EX_MDICHILD : Creates an MDI child window.", Title, MB_ICONINFORMATION
        Case "NOPARENTNOTIFY"
            MessageBox Me.hwnd, "WS_EX_NOPARENTNOTIFY : Specifies that a child window created with this style will not send the WM_PARENTNOTIFY message to its parent window when the child window is created or destroyed.", Title, MB_ICONINFORMATION
        Case "OVERLAPPEDWINDOW"
            MessageBox Me.hwnd, "WS_EX_OVERLAPPEDWINDOW : Combines the WS_EX_CLIENTEDGE and WS_EX_WINDOWEDGE styles.", Title, MB_ICONINFORMATION
        Case "PALETTEWINDOW"
            MessageBox Me.hwnd, "WS_EX_PALETTEWINDOW : Combines the WS_EX_WINDOWEDGE and WS_EX_TOPMOST styles.", Title, MB_ICONINFORMATION
        Case "RIGHT"
            MessageBox Me.hwnd, "WS_EX_RIGHT : Gives a window generic right-aligned properties. This depends on the window class.", Title, MB_ICONINFORMATION
        Case "RIGHTSCROLLBAR"
            MessageBox Me.hwnd, "WS_EX_RIGHTSCROLLBAR : Places a vertical scroll bar (if present) to the right of the client area. This is the default.", Title, MB_ICONINFORMATION
        Case "RTLREADING"
            MessageBox Me.hwnd, "WS_EX_RTLREADING : Displays the window text using right-to-left reading order properties.", Title, MB_ICONINFORMATION
        Case "STATICEDGE"
            MessageBox Me.hwnd, "WS_EX_STATICEDGE : Creates a window with a three-dimensional border style intended to be used for items that do not accept user input.", Title, MB_ICONINFORMATION
        Case "TOOLWINDOW"
            MessageBox Me.hwnd, "WS_EX_TOOLWINDOW : Creates a tool window, which is a window intended to be used as a floating toolbar. A tool window has a title bar that is shorter than a normal title bar, and the window title is drawn using a smaller font. A tool window does not appear in the task bar or in the window that appears when the user presses ALT+TAB.", Title, MB_ICONINFORMATION
        Case "TOPMOST"
            MessageBox Me.hwnd, "WS_EX_TOPMOST : Specifies that a window created with this style should be placed above all nontopmost windows and stay above them even when the window is deactivated. An application can use the SetWindowPos member function to add or remove this attribute.", Title, MB_ICONINFORMATION
        Case "TRANSPARENT"
            MessageBox Me.hwnd, "WS_EX_TRANSPARENT : Specifies that a window created with this style is to be transparent. That is, any windows that are beneath the window are not obscured by the window. A window created with this style receives WM_PAINT messages only after all sibling windows beneath it have been updated.", Title, MB_ICONINFORMATION
        Case "WINDOWEDGE"
            MessageBox Me.hwnd, "WS_EX_WINDOWEDGE : Specifies that a window has a border with a raised edge.", Title, MB_ICONINFORMATION
    End Select
End Sub

Public Sub ClearStyles()
    Me.Caption = "Styles"
    ListView1.ListItems.Clear
    ListView2.ListItems.Clear
    lblWinStyles.Caption = ""
    lblWinExStyles.Caption = ""
End Sub
