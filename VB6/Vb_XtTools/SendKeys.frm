VERSION 5.00
Begin VB.Form frmSendKeys 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Envoi de touches"
   ClientHeight    =   840
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   1890
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "SendKeys.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   840
   ScaleWidth      =   1890
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   900
      Left            =   1485
      Top             =   540
   End
   Begin VB.Label lblQuit 
      AutoSize        =   -1  'True
      Caption         =   "<Q>"
      Height          =   195
      Left            =   1530
      TabIndex        =   6
      Top             =   -30
      Width           =   360
   End
   Begin VB.Label lblMasks 
      AutoSize        =   -1  'True
      ForeColor       =   &H8000000D&
      Height          =   195
      Left            =   1050
      TabIndex        =   5
      Top             =   570
      Width           =   45
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Masque(s) :"
      Height          =   195
      Left            =   45
      TabIndex        =   4
      Top             =   570
      Width           =   855
   End
   Begin VB.Label lblChar 
      AutoSize        =   -1  'True
      ForeColor       =   &H8000000D&
      Height          =   195
      Left            =   1050
      TabIndex        =   3
      Top             =   315
      Width           =   45
   End
   Begin VB.Label lblAnsiCode 
      AutoSize        =   -1  'True
      ForeColor       =   &H8000000D&
      Height          =   195
      Left            =   1050
      TabIndex        =   2
      Top             =   45
      Width           =   45
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Caractère :"
      Height          =   195
      Left            =   45
      TabIndex        =   1
      Top             =   315
      Width           =   825
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Code ANSI :"
      Height          =   195
      Left            =   45
      TabIndex        =   0
      Top             =   45
      Width           =   885
   End
End
Attribute VB_Name = "frmSendKeys"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'  Projet XtTools par Xavier Tello   (xavier.tello@wanadoo.fr)

Option Explicit

Private KeyCodes(0 To 255, 0 To 2) As String
Private Const KC_SHIFT As Integer = 1
Private Const KC_ALTGR As Integer = 2

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Dim AsciiCode As Long
    frmMain.Timer1.Enabled = False
    Timer1.Enabled = False
    lblAnsiCode.Caption = KeyCode
    lblMasks.Caption = IIf((Shift And 1) > 0, " shift", "") _
                        & IIf((Shift And 2) > 0, " ctrl", "") _
                        & IIf((Shift And 4) > 0, " alt", "")
    If Shift = 6 Then Shift = 2   'Simulate the "AltGr" mask
    If (Shift > 4) Or (Shift = 3) Then Shift = 0 'Case Shift+Ctr+Alt
    lblChar.Caption = KeyCodes(KeyCode, IIf(Shift > 2, 0, Shift))
    If lblChar.Caption <> "" Then AsciiCode = Asc(lblChar.Caption)
    If (Len(lblChar.Caption) = 1) And (AsciiCode >= 32) And (AsciiCode <= 126) Then
        SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H100001
        SendMessage CurrhWnd, WM_CHAR, AsciiCode, &H100001
    ElseIf lblChar.Caption = "é" Then
        SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H30001
        SendMessage CurrhWnd, WM_CHAR, AsciiCode, &H30001
    ElseIf lblChar.Caption = "è" Then
        SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H80001
        SendMessage CurrhWnd, WM_CHAR, AsciiCode, &H80001
    ElseIf lblChar.Caption = "ç" Then
        SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &HA0001
        SendMessage CurrhWnd, WM_CHAR, AsciiCode, &HA0001
    ElseIf lblChar.Caption = "à" Then
        SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &HB0001
        SendMessage CurrhWnd, WM_CHAR, AsciiCode, &HB0001
    ElseIf lblChar.Caption = "ù" Then
        SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H280001
        SendMessage CurrhWnd, WM_CHAR, AsciiCode, &H280001
    ElseIf lblChar.Caption = "²" Then
        SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H290001
        SendMessage CurrhWnd, WM_CHAR, AsciiCode, &H290001
    ElseIf lblChar.Caption = "&&" Then
        SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H200001
        SendMessage CurrhWnd, WM_CHAR, AsciiCode, &H200001
    Else
        If KeyCode = 8 Then  ' BACKSPACE
            SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &HE0001
            SendMessage CurrhWnd, WM_CHAR, KeyCode, &HE0001
        ElseIf KeyCode = 13 Then  ' ENTER
            SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H1C0001
            SendMessage CurrhWnd, WM_CHAR, KeyCode, &HE0001
        ElseIf KeyCode = 37 Then ' LEFT
            SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H14B0001
        ElseIf KeyCode = 38 Then  ' UP
            SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H1480001
        ElseIf KeyCode = 39 Then ' RIGHT
            SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H14D0001
        ElseIf KeyCode = 40 Then ' DOWN
            SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H15D0001
        ElseIf KeyCode = 45 Then ' INSERT
            SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H1520001
        ElseIf KeyCode = 46 Then  ' DELETE
            SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H1530001
        ElseIf KeyCode = 33 Then ' PAGE UP
            SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H1490001
        ElseIf KeyCode = 34 Then ' PAGE DOWN
            SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H1510001
        ElseIf KeyCode = 35 Then ' END
            SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H14F0001
        ElseIf KeyCode = 36 Then ' HOME
            SendMessage CurrhWnd, WM_KEYDOWN, KeyCode, &H1470001
        Else
            
            MsgBox "Désolé, mais cette touche n'est pas encore prise en compte dans cette version " & App.Major & "." & App.Minor & "." & App.Revision & "...", vbInformation
        End If
        GoTo Cassos
        If KeyCodes(KeyCode, 0) = "" Then GoTo Cassos
        SetWindowPos CurrhWnd, HWND_TOP, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
        DoEvents
        SendKeys IIf((Shift And 1) > 0, "+", "") _
                            & IIf((Shift And 2) > 0, "^", "") _
                            & IIf((Shift And 4) > 0, "%", "") _
                            & "{" & KeyCodes(KeyCode, 0) & "}", True
        Me.SetFocus
    End If
Cassos:
    Timer1.Enabled = True
    frmMain.Timer1.Enabled = True
End Sub

Private Sub Form_Load()
Dim cpt As Long
    SetWindowPos Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
    
    'Chars "a" to "z"
    For cpt = 65 To 90
        KeyCodes(cpt, 0) = Chr$(cpt + 32)
    Next cpt

    'Chars "A" to "Z"
    For cpt = 65 To 90
        KeyCodes(cpt, KC_SHIFT) = Chr$(cpt)
    Next cpt

    'Chars "0" to "9" (NumPad)
    For cpt = 96 To 105
        KeyCodes(cpt, 0) = Chr$(cpt - 48)
    Next cpt

    'Chars "0" to "9" (NOT from NumPad)
    For cpt = 48 To 57
        KeyCodes(cpt, KC_SHIFT) = Chr$(cpt)
    Next cpt

    'Keys F1 to F9
    For cpt = 112 To 120
        KeyCodes(cpt, 0) = "F" & Chr$(cpt - 63)
    Next cpt
    
    'Keys F10 to F12
    KeyCodes(121, 0) = "F10"
    KeyCodes(122, 0) = "F11"
    KeyCodes(123, 0) = "F12"
    
    'Other chars.
    KeyCodes(32, 0) = " "
    KeyCodes(27, 0) = "ESC"
    KeyCodes(13, 0) = "ENTER"
    KeyCodes(8, 0) = "BACKSPACE"
    KeyCodes(9, 0) = "TAB"
    KeyCodes(45, 0) = "INSERT"
    KeyCodes(46, 0) = "DEL"
    KeyCodes(33, 0) = "PAGEUP"
    KeyCodes(34, 0) = "PAGEDOWN"
    KeyCodes(35, 0) = "END"
    KeyCodes(36, 0) = "HOME"
    KeyCodes(188, 0) = ","
    KeyCodes(188, KC_SHIFT) = "?"
    KeyCodes(190, 0) = ";"
    KeyCodes(190, KC_SHIFT) = "."
    KeyCodes(191, 0) = ":"
    KeyCodes(191, KC_SHIFT) = "/"
    KeyCodes(223, 0) = "!"
    KeyCodes(223, KC_SHIFT) = "§"
    KeyCodes(226, 0) = "<"
    KeyCodes(226, KC_SHIFT) = ">"
    KeyCodes(222, 0) = "²"
    KeyCodes(219, 0) = ")"
    KeyCodes(219, KC_SHIFT) = "°"
    KeyCodes(219, KC_ALTGR) = "]"
    KeyCodes(187, 0) = "="
    KeyCodes(187, KC_SHIFT) = "+"
    KeyCodes(187, KC_ALTGR) = "}"
    KeyCodes(221, 0) = "^"
    KeyCodes(221, KC_SHIFT) = "¨"
    KeyCodes(186, 0) = "$"
    KeyCodes(186, KC_SHIFT) = "£"
    KeyCodes(186, KC_ALTGR) = "¤"
    KeyCodes(192, 0) = "ù"
    KeyCodes(192, KC_SHIFT) = "%"
    KeyCodes(220, 0) = "*"
    KeyCodes(220, KC_SHIFT) = "µ"
    KeyCodes(37, 0) = "LEFT"
    KeyCodes(38, 0) = "UP"
    KeyCodes(39, 0) = "RIGHT"
    KeyCodes(40, 0) = "DOWN"
    KeyCodes(48, 0) = "à"
    KeyCodes(48, KC_ALTGR) = "@"
    KeyCodes(49, 0) = "&&"   'Two times to prevent underline
    KeyCodes(50, 0) = "é"
    KeyCodes(50, KC_ALTGR) = "~"
    KeyCodes(51, 0) = """"
    KeyCodes(51, KC_ALTGR) = "#"
    KeyCodes(52, 0) = "'"
    KeyCodes(52, KC_ALTGR) = "{"
    KeyCodes(53, 0) = "("
    KeyCodes(53, KC_ALTGR) = "["
    KeyCodes(54, 0) = "-"
    KeyCodes(54, KC_ALTGR) = "|"
    KeyCodes(55, 0) = "è"
    KeyCodes(55, KC_ALTGR) = "`"
    KeyCodes(56, 0) = "_"
    KeyCodes(56, KC_ALTGR) = "\"
    KeyCodes(57, 0) = "ç"
    KeyCodes(57, KC_ALTGR) = "^"
    KeyCodes(111, 0) = "/"
    KeyCodes(106, 0) = "*"
    KeyCodes(109, 0) = "-"
    KeyCodes(107, 0) = "+"
    KeyCodes(110, 0) = "."
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    'Quit only if it's invoqued from code
    If UnloadMode <> 1 Then Cancel = 1
End Sub

Private Sub lblQuit_Click()
    Unload Me
End Sub

Private Sub Timer1_Timer()
    Timer1.Enabled = False
    lblAnsiCode.Caption = ""
    lblChar.Caption = ""
    lblMasks.Caption = ""
End Sub
