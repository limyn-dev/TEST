VERSION 5.00
Begin VB.Form frmSearchWindow 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Chercher une fenêtre"
   ClientHeight    =   2175
   ClientLeft      =   45
   ClientTop       =   330
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
   Icon            =   "SearchWindow.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   2175
   ScaleWidth      =   5220
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture3 
      BackColor       =   &H00FFFFFF&
      Height          =   345
      Left            =   750
      ScaleHeight     =   285
      ScaleWidth      =   2250
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   1695
      Width           =   2310
      Begin VB.PictureBox picWindows 
         AutoSize        =   -1  'True
         BackColor       =   &H8000000D&
         BorderStyle     =   0  'None
         Height          =   240
         Left            =   1725
         Picture         =   "SearchWindow.frx":014A
         ScaleHeight     =   240
         ScaleWidth      =   240
         TabIndex        =   18
         Top             =   15
         Width           =   240
      End
      Begin VB.PictureBox picThreads 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         Height          =   240
         Left            =   960
         Picture         =   "SearchWindow.frx":0294
         ScaleHeight     =   240
         ScaleWidth      =   240
         TabIndex        =   17
         Top             =   15
         Width           =   240
      End
      Begin VB.PictureBox picProcesses 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         Height          =   240
         Left            =   225
         Picture         =   "SearchWindow.frx":03DE
         ScaleHeight     =   240
         ScaleWidth      =   240
         TabIndex        =   16
         Top             =   15
         Width           =   240
      End
   End
   Begin VB.CommandButton cmdPrevious 
      Caption         =   "<<"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   3315
      TabIndex        =   5
      ToolTipText     =   "Fenêtre trouvée précédente"
      Top             =   1170
      Width           =   855
   End
   Begin VB.CommandButton cmdNext 
      Caption         =   ">>"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   4170
      TabIndex        =   6
      ToolTipText     =   "Fenêtre trouvée suivante"
      Top             =   1170
      Width           =   855
   End
   Begin VB.TextBox txtTitle 
      Height          =   345
      Left            =   750
      TabIndex        =   1
      Top             =   660
      Width           =   2310
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   360
      Left            =   3315
      TabIndex        =   4
      Top             =   660
      Width           =   1710
   End
   Begin VB.TextBox txtClass 
      Height          =   345
      Left            =   750
      TabIndex        =   2
      Top             =   1170
      Width           =   2310
   End
   Begin VB.TextBox txthWnd 
      Height          =   345
      Left            =   750
      TabIndex        =   0
      Top             =   135
      Width           =   2310
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   360
      Left            =   3315
      TabIndex        =   3
      Top             =   135
      Width           =   1710
   End
   Begin VB.Label lblError 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   165
      Left            =   3090
      TabIndex        =   20
      Top             =   1905
      Width           =   2100
   End
   Begin VB.Label lblCurrFoundWindow 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   165
      Left            =   3090
      TabIndex        =   19
      Top             =   1740
      Width           =   2100
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Dans :"
      Height          =   195
      Index           =   3
      Left            =   165
      TabIndex        =   14
      Top             =   1740
      Width           =   465
   End
   Begin VB.Label lblNbFoundWindows 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   165
      Left            =   3090
      TabIndex        =   13
      Top             =   1560
      Width           =   2100
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "(Entrez une étoile ""*"" pour ignorer)."
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   165
      Index           =   2
      Left            =   765
      TabIndex        =   12
      Top             =   1005
      Width           =   2205
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "(Entrez une étoile ""*"" pour ignorer)."
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   165
      Index           =   1
      Left            =   765
      TabIndex        =   11
      Top             =   1530
      Width           =   2205
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "(Utilisez le préfixe ""&&H"" pour l'hexa)."
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   165
      Index           =   0
      Left            =   765
      TabIndex        =   10
      Top             =   480
      Width           =   2235
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "hWnd :"
      Height          =   195
      Index           =   2
      Left            =   105
      TabIndex        =   9
      Top             =   180
      Width           =   525
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Titre :"
      Height          =   195
      Index           =   1
      Left            =   195
      TabIndex        =   8
      Top             =   705
      Width           =   435
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Classe :"
      Height          =   195
      Index           =   0
      Left            =   60
      TabIndex        =   7
      Top             =   1215
      Width           =   570
   End
End
Attribute VB_Name = "frmSearchWindow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'  Projet XtTools par Xavier Tello   (xavier.tello@wanadoo.fr)

Option Explicit

Private SearchedhWnd  As Long
Private SearchedTitle As String
Private SearchedClass As String
Private FoundWindows() As Long
Private NbFoundWindows As Long
Private CurrFoundWindow As Long
Private SearchIn As String * 1  ' P => Processes  ;  T => Threads  ;  W => Windows
Private MustRefresh As Boolean
Private TreeViewUsed As TreeView
Private FormUsed As Form
Private Const White = &HFFFFFF
Private Working As Boolean

Private Sub cmdOK_Click()
Dim FoundWinNode As Node
Dim cpt As Long
Dim NewCursorX As Long, NewCursorY As Long
Dim DeltaX As Long, DeltaY As Long
Dim DeltaX_pix As Long, DeltaY_pix As Long
Dim NbSteps As Long
Dim CursorPos As POINTAPI
Dim ClipRect As RECT

    If UCase(cmdOK.Caption) <> "OK" Then
        txthWnd.Enabled = True
        txtTitle.Enabled = True
        txtClass.Enabled = True
        Picture3.Enabled = True
        If SearchIn = "P" Then picProcesses.BackColor = vbHighlight
        If SearchIn = "T" Then picThreads.BackColor = vbHighlight
        If SearchIn = "W" Then picWindows.BackColor = vbHighlight
        cmdNext.Enabled = False
        cmdPrevious.Enabled = False
        lblNbFoundWindows.Caption = "": lblCurrFoundWindow.Caption = "": lblError.Caption = ""
        cmdOK.Caption = "OK"
        On Error Resume Next
        TreeViewUsed.Nodes("Win" & Hex$(FoundWindows(CurrFoundWindow))).Bold = False
        Erase FoundWindows()
        MustRefresh = True
        Exit Sub
    End If
    
    If (txthWnd.Text <> "") Then
        If IsNumeric(txthWnd.Text) Then
            If Val(txthWnd.Text) <= 0 Then
                MsgBox "Veuillez entrer ici un entier positif." _
                    & vbCrLf & "Utilisez le préfixe ""&H"" pour entrer un nombre hexadécimal.", vbInformation
                txthWnd.SetFocus
                Exit Sub
            Else
                SearchedhWnd = Val(txthWnd.Text)
            End If
        Else
            MsgBox "Veuillez entrer ici un entier positif." _
                & vbCrLf & "Utilisez le préfixe ""&H"" pour entrer un nombre hexadécimal.", vbInformation
            txthWnd.SetFocus
            Exit Sub
        End If
    Else    '  =>  txthWnd.Text = ""
        SearchedhWnd = 0&
    End If
    
    txthWnd.Enabled = False
    txtTitle.Enabled = False
    txtClass.Enabled = False
    Picture3.Enabled = False
    If SearchIn = "P" Then picProcesses.BackColor = vbGrayText
    If SearchIn = "T" Then picThreads.BackColor = vbGrayText
    If SearchIn = "W" Then picWindows.BackColor = vbGrayText
    cmdOK.Caption = "Nouvelle recherche"
    
    SearchedTitle = UCase(txtTitle.Text)
    SearchedClass = UCase(txtClass.Text)
    
    NbFoundWindows = 0&
    
    '  Teste la fenêtre Desktop SSI on n'utilise pas la feuille "Fenêtres"
    If (SearchIn <> "W") Then CheckIfDesktopWindowMatchesSearch
    
    ' Lance la recherche récursive avec comme premier parent le bureau
    SearchWindows GetDesktopWindow()
            
    If (Me.Left <> 0) Or (Me.Top <> 0) Then
        NbSteps = 20&
        DeltaX = Me.Left \ NbSteps:    DeltaY = Me.Top \ NbSteps
        DeltaX_pix = (Me.Left \ Tppx) \ NbSteps:    DeltaY_pix = (Me.Top \ Tppy) \ NbSteps
        GetCursorPos CursorPos
        NewCursorX = CursorPos.X - (Me.Left \ Tppx)
        NewCursorY = CursorPos.Y - (Me.Top \ Tppy)
        For cpt = 1 To NbSteps
            Me.Left = Me.Left - DeltaX
            Me.Top = Me.Top - DeltaY
            GetCursorPos CursorPos
            ClipRect.Left = CursorPos.X - DeltaX_pix: ClipRect.Right = ClipRect.Left
            ClipRect.Top = CursorPos.Y - DeltaY_pix: ClipRect.Bottom = ClipRect.Top
            SetCursorPos ClipRect.Left, ClipRect.Top
            ClipCursor ClipRect
            DoEvents
        Next cpt
        Me.Move 0, 0
        ClipRect.Left = 0&: ClipRect.Top = 0&:
        ClipRect.Right = (Screen.Width \ Tppx): ClipRect.Bottom = (Screen.Height \ Tppy)
        ClipCursor ClipRect
        SetCursorPos NewCursorX, NewCursorY
        Me.Refresh
    End If
        
    If NbFoundWindows = 0 Then
        MsgBox "Aucune fenêtre correspond à ces critères.", vbInformation + vbOKOnly
        txthWnd.Enabled = True
        txtTitle.Enabled = True
        txtClass.Enabled = True
        Picture3.Enabled = True
        If SearchIn = "P" Then picProcesses.BackColor = vbHighlight
        If SearchIn = "T" Then picThreads.BackColor = vbHighlight
        If SearchIn = "W" Then picWindows.BackColor = vbHighlight
        cmdOK.Caption = "OK"
        Exit Sub
    End If
    
    CurrFoundWindow = 1
    lblNbFoundWindows.Caption = "Trouvée(s) : " & NbFoundWindows
    lblCurrFoundWindow.Caption = "(" & CurrFoundWindow & " sur " & NbFoundWindows & ")"
    If NbFoundWindows > 1 Then cmdNext.Enabled = True
    cmdOK.Enabled = True
    
    Select Case SearchIn
        Case "P"
            Set TreeViewUsed = frmProcesses.trvProcesses
            Set FormUsed = frmProcesses
        Case "T"
            Set TreeViewUsed = frmThreads.trvThreads
            Set FormUsed = frmThreads
        Case "W"
            Set TreeViewUsed = frmWindows.trvWindows
            Set FormUsed = frmWindows
    End Select
        
    DoEvents
    Comm1 = 40
    If Not FormUsed.Visible Then
        Comm1 = 40   ' tell to TreeView that he MUST use recursive search
        FormUsed.Show
        Comm1 = 0
    Else
        If SearchIn <> "W" Then
            ' Use Recursive refresh for process & thread display
            If Not FormUsed.optRecursiveSearch.Checked Then FormUsed.optRecursiveSearch_Click
        Else
            FormUsed.optRefresh_Click
        End If
    End If
    
    FormUsed.Move Me.Width, 0, Screen.Width - Me.Width

    On Error Resume Next
    Set FoundWinNode = TreeViewUsed.Nodes("Win" & Hex$(FoundWindows(CurrFoundWindow)))
    If (FoundWinNode Is Nothing) Or (Err.Number <> 0) Then
        lblError.Caption = "ERROR : " & "Win" & Hex$(FoundWindows(CurrFoundWindow)) & " not found"
        Exit Sub
    End If
    FoundWinNode.EnsureVisible
    FoundWinNode.Selected = True
    FoundWinNode.Bold = True
    FormUsed.SetFocus
    DoEvents
    Me.SetFocus
End Sub

Private Sub Form_Load()
    SearchIn = "W"
    MustRefresh = False
    SetWindowPos frmSearchWindow.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    If UCase(cmdOK.Caption) <> "OK" Then cmdOK_Click
End Sub

Private Sub Form_Resize()
    txthWnd.SetFocus
End Sub

Private Sub SearchWindows(ParenthWnd As Long)
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
                                
        If SearchedhWnd <> 0 Then
            MatchSearch = (SearchedhWnd = hWnd2)
            If Not MatchSearch Then GoTo NextWin
        End If
        
        MatchSearch = True
        
        buf2 = String(255, 0)
        ret = GetWindowText(hWnd2, buf2, 255)
        buf = UCase(Mid(buf2, 1, ret))
        If SearchedTitle <> "*" Then
            If buf = "" Then
                MatchSearch = (SearchedTitle = "")
            ElseIf SearchedTitle = "" Then
                MatchSearch = (buf = "")
            Else
                MatchSearch = (InStr(1, SearchedTitle, buf) <> 0) _
                                  Or (InStr(1, buf, SearchedTitle) <> 0)
            End If
            If Not MatchSearch Then GoTo NextWin
        End If
        
        buf2 = String(255, 0)
        ret = GetClassName(hWnd2, buf2, 255)
        buf = UCase(Mid(buf2, 1, ret))
        If SearchedClass <> "*" Then
            If buf = "" Then
                MatchSearch = (SearchedClass = "")
            ElseIf SearchedClass = "" Then
                MatchSearch = (buf = "")
            Else
                MatchSearch = (InStr(1, SearchedClass, buf) <> 0) _
                                  Or (InStr(1, buf, SearchedClass) <> 0)
            End If
            If Not MatchSearch Then GoTo NextWin
        End If

        '  Ici, on sait que la fenêtre correspond aux critères :
        '  on l'ajoute à la liste des trouvées
        NbFoundWindows = NbFoundWindows + 1
        ReDim Preserve FoundWindows(1 To NbFoundWindows)
        FoundWindows(NbFoundWindows) = hWnd2

NextWin:
        SearchWindows hWnd2

        hWnd2 = GetWindow(hWnd2, GW_HWNDNEXT)
        cpt = cpt + 1
    Wend

End Sub

Private Sub cmdPrevious_Click()
Dim WinNode As Node
    
If Working Then Exit Sub
    
    Working = True
    On Error Resume Next
    
    If Not FormUsed.Visible Then FormUsed.Move Me.Width, 0, Screen.Width - Me.Width:     FormUsed.Show
    
    '  UnSelect the previous Window
    Set WinNode = TreeViewUsed.Nodes("Win" & Hex$(FoundWindows(CurrFoundWindow)))
    If (WinNode Is Nothing) Or (Err.Number <> 0) Then
    Else
        WinNode.Selected = False
        WinNode.Bold = False
    End If
    
    '  Select the new Window
    CurrFoundWindow = CurrFoundWindow - 1
    Set WinNode = TreeViewUsed.Nodes("Win" & Hex$(FoundWindows(CurrFoundWindow)))
    If (WinNode Is Nothing) Or (Err.Number <> 0) Then
        lblError.Caption = "ERROR : " & "Win" & Hex$(FoundWindows(CurrFoundWindow)) & " not found"
    Else
        WinNode.EnsureVisible
        WinNode.Selected = True
        WinNode.Bold = True
        lblError.Caption = ""
    End If
    If CurrFoundWindow = 1 Then cmdPrevious.Enabled = False
    If CurrFoundWindow < NbFoundWindows Then cmdNext.Enabled = True
    lblCurrFoundWindow.Caption = "(" & CurrFoundWindow & " sur " & NbFoundWindows & ")"
    
    Working = False
End Sub

Private Sub cmdNext_Click()
Dim WinNode As Node
    
If Working Then Exit Sub
    
    Working = True
    On Error Resume Next
        
    If Not FormUsed.Visible Then FormUsed.Move Me.Width, 0, Screen.Width - Me.Width:     FormUsed.Show
        
    '  UnSelect the previous Window
    Set WinNode = TreeViewUsed.Nodes("Win" & Hex$(FoundWindows(CurrFoundWindow)))
    If (WinNode Is Nothing) Or (Err.Number <> 0) Then
    Else
        WinNode.Selected = False
        WinNode.Bold = False
    End If
    
    '  Select the new Window
    CurrFoundWindow = CurrFoundWindow + 1
    Set WinNode = TreeViewUsed.Nodes("Win" & Hex$(FoundWindows(CurrFoundWindow)))
    If (WinNode Is Nothing) Or (Err.Number <> 0) Then
        lblError.Caption = "ERROR : " & "Win" & Hex$(FoundWindows(CurrFoundWindow)) & " not found"
    Else
        WinNode.EnsureVisible
        WinNode.Selected = True
        WinNode.Bold = True
        lblError.Caption = ""
    End If
    If CurrFoundWindow = NbFoundWindows Then cmdNext.Enabled = False
    If CurrFoundWindow > 1 Then cmdPrevious.Enabled = True
    lblCurrFoundWindow.Caption = "(" & CurrFoundWindow & " sur " & NbFoundWindows & ")"
    
    Working = False
End Sub


Private Sub picProcesses_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    picThreads.BackColor = White
    picWindows.BackColor = White
    picProcesses.BackColor = vbHighlight
    SearchIn = "P"
End Sub
Private Sub picThreads_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    picWindows.BackColor = White
    picProcesses.BackColor = White
    picThreads.BackColor = vbHighlight
    SearchIn = "T"
End Sub
Private Sub picWindows_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    picThreads.BackColor = White
    picProcesses.BackColor = White
    picWindows.BackColor = vbHighlight
    SearchIn = "W"
End Sub

Private Sub txthWnd_Change()
    cmdOK.Enabled = (txthWnd.Text <> "") Or (txtTitle.Text <> "") Or (txtClass.Text <> "")
End Sub
Private Sub txtTitle_Change()
    cmdOK.Enabled = (txthWnd.Text <> "") Or (txtTitle.Text <> "") Or (txtClass.Text <> "")
End Sub
Private Sub txtClass_Change()
    cmdOK.Enabled = (txthWnd.Text <> "") Or (txtTitle.Text <> "") Or (txtClass.Text <> "")
End Sub

Private Sub CheckIfDesktopWindowMatchesSearch()
Dim hWnd2 As Long
Dim ret As Long
Dim buf As String, buf2 As String
Dim MatchSearch As Boolean
            
        hWnd2 = GetDesktopWindow()
    
        If SearchedhWnd <> 0 Then
            MatchSearch = (SearchedhWnd = hWnd2)
            If Not MatchSearch Then Exit Sub
        End If
        
        MatchSearch = True
        
        buf2 = String(255, 0)
        ret = GetWindowText(hWnd2, buf2, 255)
        buf = UCase(Mid(buf2, 1, ret))
        If SearchedTitle <> "*" Then
            If buf = "" Then
                MatchSearch = (SearchedTitle = "")
            ElseIf SearchedTitle = "" Then
                MatchSearch = (buf = "")
            Else
                MatchSearch = (InStr(1, SearchedTitle, buf) <> 0) _
                                  Or (InStr(1, buf, SearchedTitle) <> 0)
            End If
            If Not MatchSearch Then Exit Sub
        End If
        
        buf2 = String(255, 0)
        ret = GetClassName(hWnd2, buf2, 255)
        buf = UCase(Mid(buf2, 1, ret))
        If SearchedClass <> "*" Then
            If buf = "" Then
                MatchSearch = (SearchedClass = "")
            ElseIf SearchedClass = "" Then
                MatchSearch = (buf = "")
            Else
                MatchSearch = (InStr(1, SearchedClass, buf) <> 0) _
                                  Or (InStr(1, buf, SearchedClass) <> 0)
            End If
            If Not MatchSearch Then Exit Sub
        End If

    '  Yes, the Desktop window matches this search :
    NbFoundWindows = 1&
    ReDim FoundWindows(1 To NbFoundWindows)
    FoundWindows(1) = GetDesktopWindow()
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

