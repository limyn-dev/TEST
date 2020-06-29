VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CWndClass"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3C88D881023A"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit

'============================================================================='
'                 Objet win32                                                 '
'-----------------------------------------------------------------------------'
' Création                                                                    '
' Date         : 05.03.02                                                     '
' Hauteur      : Y.Delay                                                      '
' Documentation: http://www.vbapi.com                                         '
'-----------------------------------------------------------------------------'
'                                                                             '
'============================================================================='



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Déclarations §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' GCW_ATOM         : Retrieve the atom which identifies the window class.
' GCL_CBCLSEXTRA   : Retrieve the size in bytes of the extra memory associated
'                    with the window class.
' GCL_CBWNDEXTRA   : Retrieve the size in bytes of the extra memory associated
'                    with each window belonging to the windowclass.
' GCL_HBRBACKGROUND: Retrieve a handle to the brush used to paint the backgrounds
'                    of windows belonging to the class.
' GCL_HCURSOR      : Retrieve a handle to the cursor associated with the class.
' GCL_HICON        : Retrieve a handle to the icon associated with the class.
' GCL_HICONSM      : Retrieve a handle to the small icon associated with the class.
' GCL_HMODULE      : Retrieve a handle to the module which registered the class.
' GCL_MENUNAME     : Retrieve a pointer to the string identifying the name of
'                    the menu resource associated with the class.
' GCL_STYLE        : Retrieve the window styles associated with the class.
' GCL_WNDPROC      : Retrieve a pointer to the WindowProc hook function which acts
'                    as the window procedure for windows belonging to the window
'                    class.
'==============================================================================
Const GCW_ATOM = -32
Const GCL_CBCLSEXTRA = -20
Const GCL_CBWNDEXTRA = -18
Const GCL_HBRBACKGROUND = -10
Const GCL_HCURSOR = -12
Const GCL_HICON = -14
Const GCL_HMODULE = -16
Const GCL_MENUNAME = -8
Const GCL_STYLE = -26
Const GCL_WNDPROC = -24

'------------------------------------------------------------------------------
' GWL_EXSTYLE   : Retrieve the extended window styles of the window.
' GWL_HINSTANCE : Retrieve a handle to the owning application's instance.
' GWL_HWNDPARENT: Retrieve a handle to the parent window, if any.
' GWL_ID        : Retrieve the identifier of the window.
' GWL_USERDATA  : Retrieve the application-defined 32-bit value associated with
'                 the window.
' GWL_STYLE     : Retrieve the window styles of the window.
' GWL_WNDPROC   : Retrieve a pointer to the WindowProc hook function acting as
'                 the window's procedure. If the window happens to be a dialog
'                 box, this could also be one of the following flags.
' DWL_DLGPROC   : Retrieve a handle to the WindowProc hook function acting as the
'                 dialog box procedure.
' DWL_MSGRESULT : Retrieve the return value of the last message processed by the
'                 dialog box.
' DWL_USER      : Retrieve the application-defined 32-bit value associated with
'                 the dialog box.
'==============================================================================
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

'------------------------------------------------------------------------------
' GCL_CBCLSEXTRA   : Set the size in bytes of the extra memory associated with
'                    the window class. dwNewLong is the new size of the block.
' GCL_CBWNDEXTRA   : Set the size in bytes of the extra memory associated with
'                    each window belonging to the window class. dwNewLong is the
'                    new size of the block.
' GCL_HBRBACKGROUND: Set the brush used to paint the backgrounds of windows
'                    belonging to the class. dwNewLong is a handle to the brush
'                    to use.
' GCL_HCURSOR      : Set the cursor associated with the class. dwNewLong is a
'                    handle to the cursor to use.
' GCL_HICON        : Set the icon associated with the class. dwNewLong is a handle
'                    to the icon to use.
' GCL_HICONSM      : Set the small icon associated with the class. dwNewLong is
'                    a handle to the small icon to use.
' GCL_HMODULE      : Change the module which registered the class. dwNewLong is
'                    a handle to the module to identify as the creator of the
'                    class.
' GCL_MENUNAME     : Set the string identifying the name of the menu resource
'                    associated with the class. dwNewLong is a pointer to the
'                    new string.
' GCL_STYLE        : Set the window styles associated with the class. dwNewLong
'                    is the new value.
' GCL_WNDPROC      : Set the WindowProc hook function to use as the window
'                    procedure for windows belonging to the window class.
'==============================================================================
Const GCL_CBCLSEXTRA = -20
Const GCL_CBWNDEXTRA = -18
Const GCL_HBRBACKGROUND = -10
Const GCL_HCURSOR = -12
Const GCL_HICON = -14
Const GCL_HMODULE = -16
Const GCL_MENUNAME = -8
Const GCL_STYLE = -26
Const GCL_WNDPROC = -24

'------------------------------------------------------------------------------
' GWL_EXSTYLE   : Set the extended window styles of the window. dwNewLong is the
'                 new setting.
' GWL_HINSTANCE : Set which application instance is considered to own the window.
'                 dwNewLong is the new setting.
' GWL_HWNDPARENT: Retrieve a handle to the parent window, if any. dwNewLong is a
'                 handle to the instance to set as the owner.
' GWL_ID        : Set the identifier of the window. dwNewLong is the new identifier.
' GWL_USERDATA  : Set the application-defined 32-bit value associated with the
'                 window. dwNewLong is the new value.
' GWL_STYLE     : Retrieve the window styles of the window.
' GWL_WNDPROC   : Set the WindowProc hook function to use as the window's procedure.
'                 dwNewLong is a pointer to the hook function to set as the window
'                 procedure.
'                 If the window happens to be a dialog box, this could also be
'                 one of the following flags:
' DWL_DLGPROC   : Set the WindowProc hook function to use as the dialog box procedure.
'                 dwNewLong is a pointer to the hook function to set as the window
'                 procedure.
' DWL_MSGRESULT : Set the return value of the last message processed by the dialog
'                 box. dwNewLong is the new value.
' DWL_USER      : Set the application-defined 32-bit value associated with the
'                 dialog box. dwNewLong is the new value.
'==============================================================================
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




'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Réferances §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
'Description & Usage
'   GetClassInfo retrieves most of the information associated with a window class.
'   The information is placed into the structure passed as lpWndClass.
'Return Value
'   If an error occured, the function returns 0 (use GetLastError to get the error
'   code). If successful, the function returns a non-zero value.
'Visual Basic-Specific Issues
'   None.
'Parameters
'   hInstance  : A handle to the instance which owns the window class, or 0 if the
'                window class is defined by the operating system.
'   lpClassName: The name of the window class to retrieve information about.
'   lpWndClass : Receives the information about the window class.
'==============================================================================
Declare Function GetClassInfo Lib "user32.dll" Alias "GetClassInfoA" _
    (ByVal hInstance As Long, ByVal lpClassName As String, lpWndClass As WNDCLASS) As Long

'------------------------------------------------------------------------------
' Description & Usage
'    GetClassInfoEx retrieves all of the information associated with a window class. The information is placed into the structure passed as lpwcx.
' Return Value
'    If an error occured, the function returns 0 (use GetLastError to get the error code). If successful, the function returns a non-zero value.
' Visual Basic-Specific Issues
'    None.
' Parameters
'    hinst    : A handle to the instance which owns the window class, or 0 if
'               the window class is defined by the operating system.
'    lpszClass: The name of the window class to retrieve information about.
'    lpwcx    : Receives the information about the window class.
'==============================================================================
Declare Function GetClassInfoEx Lib "user32.dll" Alias "GetClassInfoExA" _
    (ByVal hinst As Long, ByVal lpszClass As String, lpwcx As WNDCLASSEX) As Long

'------------------------------------------------------------------------------
' Description & Usage
'    GetClassLong retrieves a single 32-bit value from the information about the
'    window class to which the specified window belongs. The class's properties
'    may not necessarily match perfectly with the actual properties of the window.
'    This function can also retrieve a 32-bit value from the extra memory area
'    associated with the window class.
' Return Value
'    If an error occured, the function returns 0 (use GetLastError to get the error
'    code). If successful, the function returns the desired 32-bit value.
' Visual Basic-Specific Issues
'    None.
' Parameters
'    hWnd  : A handle to a window which belongs to the class to read a property
'            of.
'    nIndex: To retrieve a 32-bit value from the class's extra memory, set this
'            to the zero-based offset of the byte to begin reading at. Valid values
'            are 0 to the number of bytes of extra memory minus 4, inclusive. To
'            retrieve a 32-bit property of the class, set this to one of the
'            following flags specifying which 32-bit value to retrieve from the
'            window class:
'==============================================================================
Declare Function GetClassLong Lib "user32.dll" Alias "GetClassLongA" _
    (ByVal hWnd As Long, ByVal nIndex As Long) As Long

'------------------------------------------------------------------------------
' Description & Usage
'    GetClassName retrieves the name of the window class to which a window belongs.
'    The name of the class is placed into the string passed as lpClassName.
' Return Value
'    If an error occured, the function returns 0 (use GetLastError to get the error
'    code). If successful, the function returns the number of characters copied into
'    the string passed as lpClassName.
' Visual Basic-Specific Issues
'    None.
' Parameters
'    hWnd       : A handle to the window to get the name of the window class of.
'    lpClassName: A string which receives the name of the window class. This must
'                 first be initialized to a sufficient length to receive the string.
'    nMaxCount  : The size in bytes of the string passed as lpClassName
'==============================================================================
Declare Function GetClassName Lib "user32.dll" Alias "GetClassNameA" _
    (ByVal hWnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long

'------------------------------------------------------------------------------
' Description & Usage
'    GetWindowLong retrieves a 32-bit value from the information about a window. This function can also read a 32-bit value from the block of extra memory given to the window, if one exists.
' Return Value
'    If an error occured, the function returns 0 (use GetLastError to get the error code). If successful, the function returns the 32-bit value which was retrieved.
' Visual Basic-Specific Issues
'    None.
' Parameters
'    hWnd  : A handle to the window to retrieve a 32-bit value from.
'    nIndex: To get a 32-bit value from the window's extra memory block, this
'            is the zero-based offset of the byte to begin reading from. Valid
'            values range from 0 to the size of the extra memory block in bytes
'            minus four. To get a 32-bit value from the properties of the window,
'            this is one of the following flags specifying which piece of
'            information to retieve:
'==============================================================================
Declare Function GetWindowLong Lib "user32.dll" Alias "GetWindowLongA" _
    (ByVal hWnd As Long, ByVal nIndex As Long) As Long

'------------------------------------------------------------------------------
' Description & Usage
'    RegisterClass registers a new window class for use. Only after registering
'    the window class can it be used to create windows. This function is unable
'    to set the small icon associated with a window class; to do that, use the
'    more powerful RegisterClassEx function. After the window class is completely
'    finished being used, use UnregisterClass to unregister it.
' Return Value
'    If an error occured, the function returns 0 (use GetLastError to get the
'    error code). If successful, the function returns an atom identifying the
'    class.
' Visual Basic-Specific Issues
'    None.
' Parameters
'    lpWndClass: Information about the window class being registered.
'==============================================================================
Declare Function RegisterClass Lib "user32.dll" Alias "RegisterClassA" _
    (lpWndClass As WNDCLASS) As Long

'------------------------------------------------------------------------------
' Description & Usage
'    RegisterClassEx registers a new window class for use. Only after registering
'    the window class can it be used to create windows. After the window class is
'    completely finished being used, use UnregisterClass to unregister it.
' Return Value
'    If an error occured, the function returns 0. If successful, the function
'    returns an atom identifying the class.
' Visual Basic-Specific Issues
'    None.
' Parameters
'    lpwcx: Information about the window class being registered.
'==============================================================================
Declare Function RegisterClassEx Lib "user32.dll" Alias "RegisterClassExA" _
    (lpwcx As WNDCLASSEX) As Long

'------------------------------------------------------------------------------
' Description & Usage
'    SetClassLong sets a single 32-bit value from the information about the window
'    class to which the specified window belongs. This function can also set a
'    32-bit value within the extra memory area associated with the window class.
' Return Value
'    If an error occured, the function returns 0 (use GetLastError to get the
'    error code). If successful, the function returns the previous setting of the
'    32-bit value which was changed.
' Visual Basic-Specific Issues
'    None.
' Parameters
'    hWnd: A handle to a window which belongs to the class to set a property of.
'    nIndex: To set a 32-bit value within the class's extra memory, set this to
'    the zero-based offset of the first byte in the 32-bit block to set. Valid
'    values are 0 to the number of bytes of extra memory minus 4, inclusive. To
'    set a 32-bit property of the class, set this to one of the following flags
'    specifying which 32-bit value to set from the window class:
'==============================================================================
Declare Function SetClassLong Lib "user32.dll" Alias "SetClassLongA" _
    (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long

'------------------------------------------------------------------------------
' Description & Usage
'    SetWindowLong sets a 32-bit value constituting the information about a window.
'    This function can also set a 32-bit value within the block of extra memory
'    given to the window, if such a block exists.
' Return Value
'    If an error occured, the function returns 0 (use GetLastError to get the
'    error code). If successful, the function returns the previous setting of
'    whatever 32-bit value was replaced.
' Visual Basic-Specific Issues
'    None.
' Parameters
'    hWnd  : A handle to the window to set a 32-bit value in.
'    nIndex: To set a 32-bit value within the window's extra memory block, this
'            is the zero-based offset of the byte to begin writing to. Valid
'            values range from 0 to the size of the extra memory block in bytes
'            minus four. To set a 32-bit value of one of the properties of the
'            window, this is one of the following flags specifying which piece
'            of information to set: dwNewLong The 32-bit value to set as specified
'            by nIndex.
'==============================================================================
Declare Function SetWindowLong Lib "user32.dll" Alias "SetWindowLongA" _
    (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long

'------------------------------------------------------------------------------
' Description & Usage
'    UnregisterClass unregisters a window class, after which it can no longer be
'    used. Obviously, a window class cannot be unregistered if windows still exist
'    which belong to the class. All window classes created by an application should
'    be unregistered after the application is completely finished using them.
' Return Value
'    If an error occured, the function returns 0 (use GetLastError to get the
'    error code). If successful, the function returns a non-zero value.
' Visual Basic-Specific Issues
'    None.
' Parameters
'    lpClassName: The name of the window class to unregister, or an atom identifying
'                 the window class to unregister.
'    hInstance  : A handle to the instance which originally registered the window
'                 class.
'==============================================================================
Declare Function UnregisterClass Lib "user32.dll" Alias "UnregisterClassA" _
    (ByVal lpClassName As Any, ByVal hInstance As Long) As Long

'------------------------------------------------------------------------------
'==============================================================================





'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Membres §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

Private mHandel As Long



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Gestion de la classe §§§§§§§§§§§§§§§§§§§§§§§§§§§

Private Sub Class_Terminate()
    
    ' Initialisation de l'etat de la classe
    ImSet = False
    
End Sub

Private Sub Class_Initialize()

End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Propriété §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Handel de la windows class
'==============================================================================
Public Property Get Handel() As Long
    Handel = mHandel
End Property
'------------------------------------------------------------------------------
Public Property Let Handel(ByVal hdl As Long)
    mHandel = hdl
    ImSet = True
End Property

'------------------------------------------------------------------------------
' Texte de la fenêtre
'==============================================================================
Public Property Get Texte() As String
    If ImSet Then
        Texte = fndMyTxt()
    Else
        Texte = "PAS DE FENETRE"
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



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Outils §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Recherche du handel de la fenêtre
'==============================================================================
Private Sub fndMyHdl(txt As String)
    
    ' Recherche du handel de la fenêtre
    mHandel = FindWindow(vbNullString, txt)
    
End Sub

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



