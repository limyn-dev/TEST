VERSION 5.00
Begin VB.UserControl CWin32Api 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   InvisibleAtRuntime=   -1  'True
   ScaleHeight     =   3600
   ScaleWidth      =   4800
End
Attribute VB_Name = "CWin32Api"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True




'°°°°°°°°°° API °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°




Private Declare Sub Sleep Lib "Kernel32.dll" (ByVal dwMillisenconds As Long)
Private Declare Function GetActiveWindow Lib "user32" () As Long
Private Declare Function GetForegroundWindow Lib "user32" () As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal nom_classe As String, ByVal nom_fenetre As String) As Long
Private Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function GetParent Lib "user32" (ByVal hwnd As Long) As Long




'°°°°°°°°°° INTERFACE °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°



'
'______________________________________________________________________________________________________________________
Public Sub WrapSleep(ByVal nMillisenconds As Long)
   Sleep nMillisenconds
End Sub

'
'______________________________________________________________________________________________________________________
Public Function WrapGetActiveWindow() As Long
   WrapGetActiveWindow = GetActiveWindow()
End Function

'
'______________________________________________________________________________________________________________________
Public Function WrapGetForegroundWindow() As Long
   WrapGetForegroundWindow = CLng(GetForegroundWindow())
End Function

'
'______________________________________________________________________________________________________________________
Public Function WrapFindWindow(ByVal nom_classe As String, ByVal nom_fenetre As String) As Long
   WrapFindWindow = FindWindow(nom_classe, nom_fenetre)
End Function

'
'______________________________________________________________________________________________________________________
Public Function GetWindowTitle(ByVal hwnd As Long) As String
   Dim l As Long                                                                    '
   Dim s As String                                                                  '
   '                                                                                -----------------------------------
   l = GetWindowTextLength(hwnd)                                                    '
   s = Space(l + 1)                                                                 '
   GetWindowText hwnd, s, l + 1                                                     '
   '                                                                                -----------------------------------
   GetWindowTitle = Left$(s, l)                                                     '
End Function

'
'______________________________________________________________________________________________________________________
Public Function GetActiveWindowTitle() As String
   Dim h As Long
   Dim l As Long                                                                    '
   Dim s As String                                                                  '
   '                                                                                -----------------------------------
   h = GetForegroundWindow()
   l = GetWindowTextLength(h)                                                    '
   s = Space(l + 1)                                                                 '
   GetWindowText h, s, l + 1                                                     '
   '                                                                                -----------------------------------
   GetActiveWindowTitle = Left$(s, l)                                                     '
End Function



'°°°°°°°°°° PRIVATE °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°




'°°°°°°°°°° EVENTS HANDLERS °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°



