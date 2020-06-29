Attribute VB_Name = "Module1"
'  Projet XtTools par Xavier Tello   (xavier.tello@wanadoo.fr)


' Unités de mesures (Unit):
'   =0      =>  Pixel
'   =1      =>  Twip


'My Public Variables
Public CurrhWnd As Long
Public Comm1 As Byte
Public Unit As Byte
Public UnitScale As Single
Public SysColor_Back As Long
Public Tppx As Integer, Tppy As Integer
Public HexMode As Boolean
Public ShowWinInfos As Boolean
Public ShowProcesses As Boolean
Public ShowThreads As Boolean
Public ShowWindows As Boolean
Public ShowProcessInfos As Boolean
Public ShowThreadInfos As Boolean

'===========================================================================
'=======================    Api  Section   :   Types Definitions     ===========================
'===========================================================================

Public Type PROCESSENTRY32
    dwSize As Long
    cntUsage As Long
    th32ProcessID As Long
    th32DefaultHeapID As Long
    th32ModuleID As Long
    cntThreads As Long
    th32ParentProcessID As Long
    pcPriClassBase As Long
    dwFlags As Long
    szExeFile As String * 260  'DO NOT CHANGE THIS STRING LENGTH !!
End Type

Public Type THREADENTRY32
    dwSize As Long
    cntUsage As Long
    th32ThreadID As Long
    th32OwnerProcessID As Long
    tpBasePri As Long
    tpDeltaPri As Long
    dwFlags As Long
End Type

Public Type HEAPENTRY32
    dwSize As Long
    hHandle As Long
    dwAddress As Long
    dwBlockSize As Long
    dwFlags As Long
    dwLockCount As Long
    dwResvd As Long
    th32ProcessID As Long
    th32HeapID As Long
End Type

Public Type MODULEENTRY32
    dwSize As Long
    th32ModuleID As Long
    th32ProcessID As Long
    GlblcntUsage As Long
    ProccntUsage As Long
    modBaseAddr As Long
    modBaseSize As Long
    hModule As Long
    szModule As String * 256       'DO NOT CHANGE THIS STRING LENGTH !!
    szExePath As String * 260      'DO NOT CHANGE THIS STRING LENGTH !!
End Type

Public Type POINTAPI
    X As Long
    Y As Long
End Type

Public Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type


'===========================================================================
'=================    Api  Section   :   Constants Definitions     =======================
'===========================================================================


' GetClassLong Constants
Public Const GCL_HICON = (-14)
Public Const GCL_HICONSM = (-34)

' GetWindow Constants
Public Const GW_CHILD = 5
Public Const GW_HWNDFIRST = 0
Public Const GW_HWNDLAST = 1
Public Const GW_HWNDNEXT = 2
Public Const GW_HWNDPREV = 3
Public Const GW_OWNER = 4

' Menus Constants
Public Const MF_BYCOMMAND = &H0
Public Const MF_STRING = &H0&
Public Const MF_ENABLED = &H0&
Public Const MF_BITMAP = &H4&
Public Const MF_APPEND = &H100&
Public Const SC_CLOSE = &HF060

' BitBlt Constants
Public Const SRCCOPY = &HCC0020
Public Const SRCAND = &H8800C6
Public Const SRCERASE = &H440328
Public Const SRCINVERT = &H660046

' MessageBox Constants
Public Const MB_ICONINFORMATION = &H40&
Public Const MB_ICONEXCLAMATION = &H30&
Public Const MB_ICONQUESTION = &H20&
Public Const MB_ICONSTOP = &H10&
Public Const MB_YESNOCANCEL = &H3&
Public Const MB_YESNO = &H4&
Public Const MB_OKCANCEL = &H1&
Public Const MB_OK = &H0&

' MessageBox return Constants
Public Const IDABORT = 3
Public Const IDCANCEL = 2
Public Const IDOK = 1
Public Const IDYES = 6
Public Const IDNO = 7

' GetSystemMetrics Constant
Public Const SM_CXVSCROLL = 2
Public Const SM_CYCAPTION = 4

' Process & Threads  Constants
Public Const TH32CS_SNAPPROCESS = &H2
Public Const TH32CS_SNAPTHREAD = &H4
Public Const TH32CS_SNAPMODULE = &H8
Public Const PROCESS_QUERY_INFORMATION = &H400
Public Const THREAD_BASE_PRIORITY_IDLE = -15
Public Const THREAD_BASE_PRIORITY_LOWRT = 15
Public Const THREAD_BASE_PRIORITY_MAX = 2
Public Const THREAD_BASE_PRIORITY_MIN = -2
Public Const THREAD_PRIORITY_ERROR_RETURN = 32000
Public Const THREAD_PRIORITY_IDLE = THREAD_BASE_PRIORITY_IDLE
Public Const THREAD_PRIORITY_LOWEST = THREAD_BASE_PRIORITY_MIN
Public Const THREAD_PRIORITY_BELOW_NORMAL = (THREAD_PRIORITY_LOWEST + 1)
Public Const THREAD_PRIORITY_NORMAL = 0
Public Const THREAD_PRIORITY_HIGHEST = THREAD_BASE_PRIORITY_MAX
Public Const THREAD_PRIORITY_ABOVE_NORMAL = (THREAD_PRIORITY_HIGHEST - 1)
Public Const THREAD_PRIORITY_TIME_CRITICAL = THREAD_BASE_PRIORITY_LOWRT
Public Const NORMAL_PRIORITY_CLASS = &H20
Public Const IDLE_PRIORITY_CLASS = &H40
Public Const HIGH_PRIORITY_CLASS = &H80
Public Const REALTIME_PRIORITY_CLASS = &H100

' RedrawWindow Flags
Public Const RDW_VALIDATE = &H8
Public Const RDW_UPDATENOW = &H100
Public Const RDW_INVALIDATE = &H1

' SetWindowPos Flags
Public Const SWP_NOSIZE = &H1
Public Const SWP_NOMOVE = &H2
Public Const SWP_NOZORDER = &H4
Public Const SWP_NOREDRAW = &H8
Public Const SWP_NOACTIVATE = &H10
Public Const SWP_DRAWFRAME = &H20
Public Const SWP_SHOWWINDOW = &H40
Public Const SWP_HIDEWINDOW = &H80
Public Const SWP_NOCOPYBITS = &H100
Public Const SWP_NOREPOSITION = &H200

' SetWindowPos Constants
Public Const HWND_TOP = 0
Public Const HWND_BOTTOM = 1
Public Const HWND_TOPMOST = -1
Public Const HWND_NOTOPMOST = -2

' Windows Messages
Public Const WM_PAINT = 15
Public Const WM_CLOSE = 16
Public Const WM_MDIRESTORE = 547
Public Const WM_CANCELMODE = &H1F
Public Const WM_KEYDOWN = &H100
Public Const WM_CHAR = &H102

' ShowWindow Constants
Public Const SW_HIDE = 0
Public Const SW_SHOWNORMAL = 1
Public Const SW_NORMAL = 1
Public Const SW_SHOWMINIMIZED = 2
Public Const SW_SHOWMAXIMIZED = 3
Public Const SW_MAXIMIZE = 3
Public Const SW_SHOWNOACTIVATE = 4
Public Const SW_SHOW = 5
Public Const SW_MINIMIZE = 6
Public Const SW_SHOWMINNOACTIVE = 7
Public Const SW_SHOWNA = 8
Public Const SW_RESTORE = 9

' GetWindowLong Constants
Public Const GWL_EXSTYLE = (-20)
Public Const GWL_STYLE = (-16)
Public Const GWL_HINSTANCE = (-6)
Public Const GWL_HWNDPARENT = (-8)

' Window Styles Constants
Public Const WS_BORDER = &H800000
Public Const WS_CAPTION = &HC00000
Public Const WS_CHILD = &H40000000
Public Const WS_CLIPCHILDREN = &H2000000
Public Const WS_CLIPSIBLINGS = &H4000000
Public Const WS_DISABLED = &H8000000
Public Const WS_DLGFRAME = &H400000
Public Const WS_GROUP = &H20000
Public Const WS_HSCROLL = &H100000
Public Const WS_MINIMIZE = &H20000000
Public Const WS_MAXIMIZE = &H1000000
Public Const WS_MAXIMIZEBOX = &H10000
Public Const WS_MINIMIZEBOX = &H20000
Public Const WS_OVERLAPPED = &H0&
Public Const WS_POPUP = &H80000000
Public Const WS_SYSMENU = &H80000
Public Const WS_TABSTOP = &H10000
Public Const WS_THICKFRAME = &H40000
Public Const WS_VISIBLE = &H10000000
Public Const WS_VSCROLL = &H200000
Public Const WS_CHILDWINDOW = (WS_CHILD)
Public Const WS_ICONIC = WS_MINIMIZE
Public Const WS_OVERLAPPEDWINDOW = (WS_OVERLAPPED Or WS_CAPTION Or WS_SYSMENU Or WS_THICKFRAME Or WS_MINIMIZEBOX Or WS_MAXIMIZEBOX)
Public Const WS_POPUPWINDOW = (WS_POPUP Or WS_BORDER Or WS_SYSMENU)
Public Const WS_SIZEBOX = WS_THICKFRAME
Public Const WS_TILED = WS_OVERLAPPED
Public Const WS_TILEDWINDOW = WS_OVERLAPPEDWINDOW

Public Const WS_EX_ACCEPTFILES = &H10&
Public Const WS_EX_DLGMODALFRAME = &H1&
Public Const WS_EX_NOPARENTNOTIFY = &H4&
Public Const WS_EX_TOPMOST = &H8&
Public Const WS_EX_TRANSPARENT = &H20&
Public Const WS_EX_MDICHILD = &H40&
Public Const WS_EX_TOOLWINDOW = &H80&
Public Const WS_EX_WINDOWEDGE = &H100&
Public Const WS_EX_CLIENTEDGE = &H200&
Public Const WS_EX_CONTEXTHELP = &H400
Public Const WS_EX_RIGHT = &H1000
Public Const WS_EX_LEFT = &H0
Public Const WS_EX_RTLREADING = &H2000
Public Const WS_EX_LTRREADING = &H0
Public Const WS_EX_LEFTSCROLLBAR = &H4000
Public Const WS_EX_RIGHTSCROLLBAR = &H0
Public Const WS_EX_CONTROLPARENT = &H10000
Public Const WS_EX_STATICEDGE = &H20000
Public Const WS_EX_APPWINDOW = &H40000
Public Const WS_EX_OVERLAPPEDWINDOW = (WS_EX_WINDOWEDGE Or WS_EX_CLIENTEDGE)
Public Const WS_EX_PALETTEWINDOW = (WS_EX_WINDOWEDGE Or WS_EX_TOOLWINDOW Or WS_EX_TOPMOST)

'  Regisrty Constants
Private Const READ_CONTROL = &H20000
Private Const KEY_QUERY_VALUE = &H1
Private Const KEY_SET_VALUE = &H2
Private Const KEY_CREATE_SUB_KEY = &H4
Private Const KEY_ENUMERATE_SUB_KEYS = &H8
Private Const KEY_NOTIFY = &H10
Private Const KEY_CREATE_LINK = &H20
Private Const KEY_ALL_ACCESS = KEY_QUERY_VALUE + KEY_SET_VALUE + _
                       KEY_CREATE_SUB_KEY + KEY_ENUMERATE_SUB_KEYS + _
                       KEY_NOTIFY + KEY_CREATE_LINK + READ_CONTROL
Private Const ERROR_SUCCESS = 0
Private Const REG_SZ = 1                         ' Chaîne terminée par un caractère nul Unicode.
Private Const REG_DWORD = 4                  ' Nombre 32 bits.
Public Const HKEY_LOCAL_MACHINE = &H80000002
Public Const HKEY_CURRENT_USER = &H80000001
Public Const GETDESKTOPFULLPATH_LOC = "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
Public Const GETDESKTOPFULLPATH = "Desktop"

' Others Constants  (to move legend window)
Public Const WM_NCLBUTTONDOWN = &HA1
Public Const HTCAPTION = 2


'===========================================================================
'==============    Api  Section   :    Public Sub & Functions Definitions     ==========================
'===========================================================================



'Windows API's Functions
Public Declare Function LockWindowUpdate Lib "User32" (ByVal hwndLock As Long) As Long
Public Declare Sub SetWindowText Lib "User32" Alias "SetWindowTextA" (ByVal hwnd&, ByVal lpString As String)
Public Declare Function GetWindowText& Lib "User32" Alias "GetWindowTextA" (ByVal hwnd&, ByVal lpString As String, ByVal aint&)
Public Declare Function GetClassName& Lib "User32" Alias "GetClassNameA" (ByVal hwnd&, ByVal lpClassName As String, ByVal nMaxCount&)
Public Declare Function GetForegroundWindow Lib "User32" () As Long
Public Declare Function GetDesktopWindow Lib "User32" () As Long
Public Declare Function GetWindow Lib "User32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Public Declare Function FindWindow Lib "User32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Sub GetWindowRect Lib "User32" (ByVal hwnd&, lpRect As RECT)
Public Declare Function FlashWindow Lib "User32" (ByVal hwnd As Long, ByVal bInvert As Long) As Long
Public Declare Function GetWindowLong Lib "User32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Public Declare Function SetWindowLong Lib "User32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Declare Function ShowWindow& Lib "User32" (ByVal hwnd&, ByVal nCmdShow&)
Public Declare Sub SetWindowPos Lib "User32" (ByVal hwnd&, ByVal hWndInsertAfter&, ByVal X&, ByVal Y&, ByVal cx&, ByVal cy&, ByVal wFlags&)
Public Declare Function IsWindow Lib "User32" (ByVal hwnd As Long) As Long
Public Declare Function IsWindowEnabled& Lib "User32" (ByVal hwnd&)
Public Declare Function IsWindowVisible& Lib "User32" (ByVal hwnd As Long)
Public Declare Function EnableWindow& Lib "User32" (ByVal hwnd&, ByVal aBOOL&)
Public Declare Function WindowFromPoint Lib "User32" (ByVal xPoint As Long, ByVal yPoint As Long) As Long
Public Declare Function XtChildWindowFromPoint Lib "XtTools.dll" (ByVal dwParenthWnd As Long, ByRef pnt As POINTAPI) As Long
Public Declare Function GetWindowDC Lib "User32" (ByVal hwnd As Long) As Long
Public Declare Function SetParent Lib "User32" (ByVal hWndChild As Long, ByVal hWndNewParent As Long) As Long
Public Declare Function SendMessage Lib "User32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function GetParent Lib "User32" (ByVal hwnd As Long) As Long


'Processes & Threads  API's Functions
Public Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Public Declare Function GetWindowThreadProcessId Lib "User32" (ByVal hwnd As Long, lpdwProcessId As Long) As Long
Public Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Public Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Public Declare Function TerminateThread Lib "kernel32" (ByVal hThread As Long, ByVal dwExitCode As Long) As Long
Public Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Public Declare Function SetPriorityClass Lib "kernel32" (ByVal hProcess As Long, ByVal dwPriorityClass As Long) As Long
Public Declare Function GetPriorityClass Lib "kernel32" (ByVal hProcess As Long) As Long
Public Declare Function GetThreadPriority Lib "kernel32" (ByVal hThread As Long) As Long
Public Declare Function Process32First Lib "kernel32" _
  (ByVal hSnapshot As Long, ByRef ProcessEntry As PROCESSENTRY32) As Long
Public Declare Function Process32Next Lib "kernel32" _
  (ByVal hSnapshot As Long, ByRef ProcessEntry As PROCESSENTRY32) As Long
Public Declare Function Thread32First Lib "kernel32" _
  (ByVal hSnapshot As Long, ByRef ThreadEntry As THREADENTRY32) As Long
Public Declare Function Thread32Next Lib "kernel32" _
  (ByVal hSnapshot As Long, ByRef ThreadEntry As THREADENTRY32) As Long
Public Declare Function CreateToolhelp32Snapshot Lib _
  "kernel32" (ByVal dwFlags As Long, ByVal dwPID As Long) As Long
Public Declare Function Heap32First Lib "kernel32" _
  (ByRef HeapEntry As HEAPENTRY32, ByVal idProc As Long, ByVal idHeap As Long) As Long
Public Declare Function Heap32Next Lib "kernel32" _
  (ByRef HeapEntry As HEAPENTRY32) As Long
Public Declare Function Module32First Lib "kernel32" _
  (ByVal hSnapshot As Long, ByRef lpme As MODULEENTRY32) As Long
Public Declare Function Module32Next Lib "kernel32" _
  (ByVal hSnapshot As Long, ByRef lpme As MODULEENTRY32) As Long
 


'Graphics Api's
Public Declare Function CreateRectRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Public Declare Function GetDC& Lib "User32" (ByVal hwnd&)
Public Declare Function GetSysColor& Lib "User32" (ByVal nIndex&)
Public Declare Function DrawIcon& Lib "User32" (ByVal HDC&, ByVal X&, ByVal Y&, ByVal HICON&)
Public Declare Function DrawIconEx Lib "User32" (ByVal HDC As Long, ByVal xLeft As Long, ByVal yTop As Long, ByVal HICON As Long, ByVal cxWidth As Long, ByVal cyWidth As Long, ByVal istepIfAniCur As Long, ByVal hbrFlickerFreeDraw As Long, ByVal diFlags As Long) As Boolean
Public Declare Function InvertRect Lib "User32" (ByVal HDC As Long, lpRect As RECT) As Long

'Registry Api's
Private Declare Function RegOpenKeyEx Lib "advapi32" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, ByRef phkResult As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByVal lpData As String, ByRef lpcbData As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32" (ByVal hKey As Long) As Long

'Other API's Functions
Public Declare Function SetWindowRgn Lib "User32" (ByVal hwnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Public Declare Function GetSystemMetrics Lib "User32" (ByVal nIndex As Long) As Long
Public Declare Function PostMessage Lib "User32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function SetCapture Lib "User32" (ByVal hwnd As Long) As Long
Public Declare Function GetCapture Lib "User32" () As Long
Public Declare Sub ClientToScreen Lib "User32" (ByVal hwnd As Long, lpPoint As POINTAPI)
Public Declare Function ScreenToClient Lib "User32" (ByVal hwnd As Long, lpPoint As POINTAPI) As Long
Public Declare Function GetClientRect Lib "User32" (ByVal hwnd As Long, lpRect As RECT) As Long
Public Declare Function GetClassLong Lib "User32" Alias "GetClassLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Public Declare Function InvalidateRect Lib "User32" (ByVal hwnd As Long, lpRect As Any, ByVal bErase As Long) As Long
Public Declare Function UpdateWindow Lib "User32" (ByVal hwnd As Long) As Long
Public Declare Function RedrawWindow Lib "User32" (ByVal hwnd As Long, lprcUpdate As RECT, ByVal hrgnUpdate As Long, ByVal fuRedraw As Long) As Long
Public Declare Function SetCursorPos Lib "User32" (ByVal X As Long, ByVal Y As Long) As Long
Public Declare Function GetCursorPos Lib "User32" (lpPoint As POINTAPI) As Long
Public Declare Function ClipCursor Lib "User32" (lpRect As Any) As Long
Public Declare Function GetSystemMenu& Lib "User32" (ByVal hwnd&, ByVal bRevert&)
Public Declare Function DeleteMenu& Lib "User32" (ByVal hMenu&, ByVal nPosition&, ByVal wFlags&)
Public Declare Sub DrawMenuBar Lib "User32" (ByVal hwnd&)
Public Declare Function SetMenu Lib "User32" (ByVal hwnd&, ByVal hMenu&) As Long
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize&) As Long
Public Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Public Declare Function MessageBox Lib "User32" Alias "MessageBoxA" (ByVal hwnd As Long, ByVal lpText As String, ByVal lpCaption As String, ByVal wType As Long) As Long
Public Declare Sub ReleaseCapture Lib "User32" ()




Public Function FileExist(strFile As String) As Boolean
On Error Resume Next
    FileExist = (Dir(strFile) <> "")
End Function

Public Function WinIsTopMost(Handle As Long) As Boolean
Dim WinExStyles As Long

WinExStyles = GetWindowLong(Handle, GWL_EXSTYLE)
WinIsTopMost = CBool((WS_EX_TOPMOST) And (WinExStyles))

End Function

Public Sub DrawNoIcon()
    frmMain.picFormIcon.Cls
    frmMain.picFormIcon.Line (0, 0)-(frmMain.picFormIcon.Width, frmMain.picFormIcon.Height)
    frmMain.picFormIcon.Line (-Tppx, frmMain.picFormIcon.Height - Tppy)-(frmMain.picFormIcon.Width, -Tppy)
    frmMain.picFormIcon.PSet (frmMain.picFormIcon.Width - Tppx, 0), 0
End Sub
Public Sub DrawNoIconSmall()
    frmMain.picFormIconSmall.Cls
    frmMain.picFormIconSmall.Line (0, 0)-(frmMain.picFormIconSmall.Width, frmMain.picFormIconSmall.Height)
    frmMain.picFormIconSmall.Line (-Tppx, frmMain.picFormIconSmall.Height - Tppy)-(frmMain.picFormIconSmall.Width, -Tppy)
    frmMain.picFormIconSmall.PSet (frmMain.picFormIconSmall.Width - Tppx, 0), 0
End Sub

Public Function ExePathFromProcID(idProc As Long) As String
    Dim Process As PROCESSENTRY32, hSnap As Long, f As Long
    hSnap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0)
        If hSnap = hNull Then Exit Function
        Process.dwSize = Len(Process)
        f = Process32First(hSnap, Process)
        Do While f <> 0
            If Process.th32ProcessID = idProc Then
                ExePathFromProcID = Process.szExeFile
                ExePathFromProcID = Mid(ExePathFromProcID, 1, Abs( _
                  InStr(1, ExePathFromProcID, Chr(0)) - 1))
                Exit Function
            End If
            f = Process32Next(hSnap, Process)
        Loop
    CloseHandle hSnap
End Function

Public Function GetProcessInfos(PID As Long) As PROCESSENTRY32
    Dim hSnap As Long, f As Long
    hSnap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0)
        If hSnap = hNull Then Exit Function
        GetProcessInfos.dwSize = Len(GetProcessInfos)
        f = Process32First(hSnap, GetProcessInfos)
        Do While f <> 0
            If GetProcessInfos.th32ProcessID = PID Then
                Exit Function
            End If
            f = Process32Next(hSnap, GetProcessInfos)
        Loop
    CloseHandle hSnap
End Function

Public Function GetKeyValue(KeyRoot As Long, KeyName As String, SubKeyRef As String, ByRef KeyVal As String) As Boolean
    Dim i As Long                                           ' Compteur de boucle.
    Dim rc As Long                                          ' Code de retour.
    Dim hKey As Long                                        ' Descripteur d'une clé de base de registres ouverte.
    Dim hDepth As Long                                      '
    Dim KeyValType As Long                                  ' Type de données d'une clé de base de registres.
    Dim tmpVal As String                                    ' Stockage temporaire pour une valeur de clé de base de registres.
    Dim KeyValSize As Long                                  ' Taille de la variable de la clé de base de registres.
    '------------------------------------------------------------
    ' Ouvre la clé de base de registres sous la racine clé {HKEY_LOCAL_MACHINE...}.
    '------------------------------------------------------------
    rc = RegOpenKeyEx(KeyRoot, KeyName, 0, KEY_ALL_ACCESS, hKey) ' Ouvre la clé de base de registres.
    
    If (rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' Gère l'erreur...
    
    tmpVal = String$(1024, 0)                             ' Alloue de l'espace pour la variable.
    KeyValSize = 1024                                       ' Définit la taille de la variable.
    
    '------------------------------------------------------------
    ' Extrait la valeur de la clé de base de registres...
    '------------------------------------------------------------
    rc = RegQueryValueEx(hKey, SubKeyRef, 0, _
                         KeyValType, tmpVal, KeyValSize)    ' Obtient/Crée la valeur de la clé.
                        
    If (rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' Gère l'erreur.
    
    If (Asc(Mid(tmpVal, KeyValSize, 1)) = 0) Then           ' Win95 ajoute une chaîne terminée par un caractère nul...
        tmpVal = Left(tmpVal, KeyValSize - 1)               ' Caractère nul trouvé, extrait de la chaîne.
    Else                                                    ' WinNT ne termine pas la chaîne par un caractère nul...
        tmpVal = Left(tmpVal, KeyValSize)                   ' Caractère nul non trouvé, extrait la chaîne uniquement.
    End If
    '------------------------------------------------------------
    ' Détermine le type de valeur de la clé pour la conversion...
    '------------------------------------------------------------
    Select Case KeyValType                                  ' Recherche les types de données...
    Case REG_SZ                                             ' Type de données chaîne de la clé de la base de registres.
        KeyVal = tmpVal                                     ' Copie la valeur de la chaîne.
    Case REG_DWORD                                          ' Type de données double mot de la clé de base de registres.
        For i = Len(tmpVal) To 1 Step -1                    ' Convertit chaque bit.
            KeyVal = KeyVal + Hex(Asc(Mid(tmpVal, i, 1)))   ' Construit la valeur caractère par caractère.
        Next
        KeyVal = Format$("&h" + KeyVal)                     ' Convertit le mot double en chaîne.
    End Select
    
    GetKeyValue = True                                      ' Retour avec succès.
    rc = RegCloseKey(hKey)                                  ' Ferme la clé de base de registres
    Exit Function                                           ' Quitte.
    
GetKeyError:      ' Réinitialise après qu'une erreur s'est produite...
    KeyVal = ""                                             ' Affecte une chaîne vide à la valeur de retour.
    GetKeyValue = False                                     ' Retour avec échec.
    rc = RegCloseKey(hKey)                                  ' Ferme la clé de base de registres.
End Function


Public Function WindowsDirectory() As String
Dim WinPath As String
Dim temp As Long
    WinPath = String(256, Chr(0))
    temp = GetWindowsDirectory(WinPath, 256)
    WindowsDirectory = Left(WinPath, InStr(WinPath, Chr(0)) - 1)
End Function

Public Function SystemDirectory() As String
Dim temp As String * 100
    ret = GetSystemDirectory(temp, 100)
    SystemDirectory = Mid(temp, 1, InStr(temp, Chr(0)) - 1)
    If Right(SystemDirectory, 1) = "\" Then SystemDirectory = Mid(SystemDirectory, 1, Len(SystemDirectory) - 1)
End Function

Public Function GetSpecialWin_StartButton() As Long
Dim TaskBarHandle  As Long
Dim hWnd2  As Long
Dim bufWinTitle As String * 255, bufWinClass As String * 255
Dim ret1 As Long, ret2 As Long

    TaskBarHandle = FindWindow("Shell_TrayWnd", "")
    hWnd2 = GetWindow(TaskBarHandle, GW_CHILD)
    
    While (Not IsNull(hWnd2)) And (hWnd2 <> 0)
        ' We check if it's really the start button (for the differents versions of Windows)
        ret1 = GetWindowText(hWnd2, bufWinTitle, 255)
        ret2 = GetClassName(hWnd2, bufWinClass, 255)
        If (Mid(bufWinTitle, 1, ret1) = "") And (Mid(bufWinClass, 1, ret2) = "Button") Then
            GetSpecialWin_StartButton = hWnd2
            Exit Function
        End If
        hWnd2 = GetWindow(hWnd2, GW_HWNDNEXT)
    Wend
    
    GetSpecialWin_StartButton = 0
    MsgBox "Impossible de capturer le bouton Démarrer.", vbExclamation
End Function

Public Function GetSpecialWin_TaskBar() As Long
    GetSpecialWin_TaskBar = FindWindow("Shell_TrayWnd", vbNullString)
    If GetSpecialWin_TaskBar <= 0 Then MsgBox "Impossible de capturer la barre des tâches.", vbExclamation
End Function

Public Function GetSpecialWin_Screen() As Long
    GetSpecialWin_Screen = GetDesktopWindow()
End Function

Public Function GetSpecialWin_Desktop() As Long
    GetSpecialWin_Desktop = FindWindow("Progman", "Program Manager")
    If GetSpecialWin_Desktop <= 0 Then MsgBox "Impossible de capturer le bureau.", vbExclamation
End Function

Public Function GetSpecialWin_DesktopListView() As Long
    GetSpecialWin_DesktopListView = _
      GetWindow(GetWindow(FindWindow("Progman", "Program Manager"), GW_CHILD), GW_CHILD)
    If GetSpecialWin_DesktopListView <= 0 Then MsgBox "Impossible de capturer le ListView du bureau.", vbExclamation
End Function

Public Function VbString(NullTerminatedString As String) As String
    VbString = Mid(NullTerminatedString, 1, Abs(InStr(1, NullTerminatedString, Chr$(0)) - 1))
End Function

Public Function GetNameOfFile(ByVal strFile As String) As String
Dim pos As Integer
    pos = InStrRev(strFile, "\")
    GetNameOfFile = Mid(strFile, pos + 1)
End Function

Public Function GetPathOfFile(ByVal strFile As String) As String
Dim pos As Integer
    pos = InStrRev(strFile, "\")
    GetPathOfFile = Left(strFile, pos)
End Function


