VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CWndLocal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

'============================================================================='
'                 Objet d'une fenêtre chargé
'-----------------------------------------------------------------------------'
' Création                                                                    '
' Date         : 04.03.02                                                     '
' Hauteur      : Y.Delay                                                      '
' Documentation: http://www.vbapi.com/ref/msgc.html                           '
'-----------------------------------------------------------------------------'
'                                                                             '
'============================================================================='



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Réferances §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

' Recherche des fenêtres
Declare Function EnumWindows Lib "user32.dll" (ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Declare Function EnumChildWindows Lib "user32.dll" (ByVal hWndParent As Long, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Public Declare Function FindWindow Lib "user32.dll" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Declare Function GetWindow Lib "user32.dll" (ByVal hWnd As Long, ByVal wCmd As Long) As Long

' Recherche du texte de la fenêtre
Declare Function GetWindowTextLength Lib "user32.dll" Alias "GetWindowTextLengthA" (ByVal hWnd As Long) As Long
Declare Function GetWindowText Lib "user32.dll" Alias "GetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String, ByVal nMaxCount As Long) As Long
    
' Flash de la fenêtre
Declare Function FlashWindow Lib "user32.dll" (ByVal hWnd As Long, ByVal bInvert As Long) As Long
    
' Attente du process
Declare Sub Sleep Lib "kernel32.dll" (ByVal dwMilliseconds As Long)
    
' Envoi de messages
Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hWnd As Long, ByVal Msg As Long, wParam As Any, lParam As Any) As Long
Const HWND_BROADCAST = &HFFFF

Public Declare Function GetWindowLong Lib "user32.dll" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long




'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Messages §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'==============================================================================
' WM_CLOSE: naturally enough, instructs it to close. Some windows will prompt
'           the user with a confirmation dialog box before it closes, while others
'           will close immediately. Exactly what happens depends on the program.
'           Just keep in mind that sending WM_CLOSE merely asks the window to
'           close -- there's no guarantee that will actually happen.
' Param   : wParam -> Not used -- set to zero.
'           lParam -> Not used -- set to zero.
' Return  : Always return zero.
'------------------------------------------------------------------------------
' WM_GETTEXT: Retrieve that window's text. For regular windows, this text is the
'             text displayed in the title bar caption area. The target window's
'             text is copied to a text buffer supplied in the message parameters.
'             The message is handled by the target window's default window procedure.
'             When using SendMessage to send the WM_GETTEXT message, the ByVal
'             keyword must be used in front of both the wParam and lParam parameters.
' Param     : wParam -> The number of characters to copy from the target window's
'                       text, including the necessary terminating null character.
'             lParam -> The string which receives the first wParam characters (
'                       minus one for the null) of the target window's text.
' Return    : The message returns the number of characters retrieved, not counting
'             the terminating null character.
'------------------------------------------------------------------------------
' WM_GETTEXTLENGTH: discover the number of characters in that window's text. This
'                   character count does not include the terminating null character.
'                   In some cases, this message will report a larger number of
'                   characters than what actually exists; however, the count
'                   obtained by this message will always be no less than the actual
'                   number of characters. The WM_GETTEXTLENGTH message is handled
'                   by the target window's default window procedure.
'                   When using SendMessage to send the WM_GETTEXTLENGTH message,
'                   both the wParam and lParam parameters must be set using the
'                   expression ByVal CLng(0).
' Param           : wParam -> Not used -- set to 0.
'                   lParam -> Not used -- set to 0.
' Return          : The message returns the number of characters in the target
'                   window's text, not including the terminating null.
'------------------------------------------------------------------------------
' WM_HELP: Instructs a window to display context-sensitive help. This help could
'          refer to the window itself, one of the controls on it, or a child
'          window or dialog it created. The message includes a structure identifying
'          the object which generated the message. While a window does not
'          necessarily have to respond to the WM_HELP message by opening a WinHelp
'          document, it ought to display help information of some kind.
' Param  : wParam -> Not used -- set to 0.
'          lParam -> A pointer to a HELPINFO structure identifying the control
'                    or other window which originated the message.
' Return : Always return a non-zero value.
'------------------------------------------------------------------------------
' WM_SETTEXT : sets that window's text. For ordinary windows, the text is the
'              text that appears in the title bar. The message is handled by the
'              target window's default window procedure.
'              When sending the WM_SETTEXT message, the expression ByVal CLng(0)
'              must be used for the wParam parameter. Additionally, the ByVal
'              keyword must also preceed the string passed as the lParam parameter.
' Param      : wParam -> Not used -- set to 0.
'              lParam -> The string to set as the window text.
' Return     : If the message returns 0, an error occured. If the message returns
'              a non-zero value, the window text was successfully set.
'==============================================================================
Const WM_CLOSE = &H10
Const WM_GETTEXT = &HD
Const WM_GETTEXTLENGTH = &HE
Const WM_HELP = &H53
Const WM_SETTEXT = &HC



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Déclarations §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

' Propriétés d'une fenêtre
Const GWL_EXSTYLE = -20
Const GWL_HINSTANCE = -6
Const GWL_HWNDPARENT = -8
Const GWL_ID = -12
Const GWL_STYLE = -16
Const GWL_USERDATA = -21
Const GWL_WNDPROC = -4
Const DWL_DLGPROC = 4
Const DWL_MSGRESULT = 0
Const DWL_USER = 8
Const WS_MAXIMIZEBOX = &H10000



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Membres §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
    
' Liste des fenêtres au top
Private myHdl() As Long     ' Handel de la fenêtre
Private ImSet As Boolean    ' Flag d'etat de la class


'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Construction §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Création suppression de l'instance
'==============================================================================
Private Sub Class_Initialize()

    ' Initialisation du handel de la fenêtre
    myHdl = 0
    
    ' Initialisation de l'etat de l'instance
    ImSet = False
    
End Sub
'------------------------------------------------------------------------------
Private Sub Class_Terminate()

End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Propriétés §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Handel de la fenêtre
'==============================================================================
Public Property Get Handel() As Long
    If ImSet Then
        Handel = myHdl
    Else
        Handel = 0
End Property
'------------------------------------------------------------------------------
Public Property Let Handel(ByVal value As Long)
    Dim oldHdl As Long
    
    oldHdl = myHdl
    myHdl = Handel
    
    If fndMyTxt() = "" Then
        myHdl = oldHdl
    Else
        ImSet = True
    End If
    
End Sub

'------------------------------------------------------------------------------
' Titre de la fenêtre
'==============================================================================
Public Property Get Texte() As Variant
    If ImSet Then
        Titre = fndMyTxt()
    Else
        Titre = "PAS DE FENETRE"
    End If
End Property
'------------------------------------------------------------------------------
Public Property Let Texte(ByVal txt As String)
    If ImSet Then
        SetMyTxt txt
    Else
        fndMyHdl txt
    End If
End Property



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Methodes §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Flash une fenêtre en fontion de son hWnd
'==============================================================================
Sub Flash(speed As Integer)
    Dim c As Integer
    Dim retval As Integer

    For c = 1 To 10  ' flash on five times, off five times
        retval = FlashWindow(hndWnd, 1)  ' toggle the look of the window
        Sleep speed  ' halt execution for 500 milliseconds (1/2 minute)
    Next c

    retval = FlashWindow(hndWnd, 0)  ' make sure the window looks normal

End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Outils §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§


'------------------------------------------------------------------------------
' Recherche du handel de la fenêtre
'==============================================================================
Private Function fndMyHdl(txt As String) As Long
    
    ' Recherche du handel de la fenêtre
    fndHdlWnd = FindWindow(vbNullString, Texte)
    
End Function

'------------------------------------------------------------------------------
' Recherche du texte de la fenêtre
'==============================================================================
Private Function fndMyTxt() As String
    Dim txtlen As Long  ' receives length of text of the window
    Dim txtWnd As String  ' receives the text of the window
    Dim slength As Long  ' receives the length of the returned string

    txtlen = GetWindowTextLength(myHdl) + 1
    txtWnd = Space(txtlen)
    slength = GetWindowText(myHdl, txtWnd, txtlen)
    txtWnd = Left(txtWnd, slength)
    
    fndNomWnd = txtWnd
    
End Function

'------------------------------------------------------------------------------
' Modification du texte de la fenêtre
'==============================================================================
Private Sub SetMyTxt(txt As String)
    Dim rc As Long
       
    ' Envoi du message de modification du titre de la fenêtre
    rc = SendMessage(hdlWnd, WM_SETTEXT, 0, ByVal txt)

End Sub

'------------------------------------------------------------------------------
' Liste des fenêtre enfant
'==============================================================================
Private Function EnmWndShd(ByVal hWnd As Long, ByVal lParam As Long) As Long
    Dim nbrWnd As Integer
    
    ' nombre de fenêtres actuelles
    nbrWnd = UBound(lstHdlWndShd)
    
    ' Ajout de la fenêtre dans la liste
    nbrWnd = nbrWnd + 1
    ReDim Preserve lstHdlWndShd(nbrWnd)
    lstHdlWndShd(nbrWnd) = hWnd
    
    ' return value of 1 means continue enumeration
    EnmWndShd = 1
  
End Function
Private Sub setHdlWndShd(hdlWnd As Long)
    Dim retval As Long  ' return value
    
    ' Initialisation de la liste des fenêtres premier plan
    ReDim lstHdlWndShd(0)
    lstHdlWndShd(0) = hdlWnd
    
    ' Mise à jour de la liste des fenêtre au top
    retval = EnumChildWindows(hdlWnd, AddressOf EnmWndShd, 0)
    
End Sub

'------------------------------------------------------------------------------
'
'==============================================================================
Private Sub ttst()
    
End Sub











