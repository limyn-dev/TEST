Attribute VB_Name = "APIWndBroose"

'============================================================================='
'        API de gestion de boite de dialogue pour la saisie de chemins        '
'-----------------------------------------------------------------------------'
' Création                                                                    '
' Date         : 04.03.02                                                     '
' Hauteur      : Y.Delay                                                      '
' Documentation: http://www.vbapi.com/ref/msgc.html                           '
'-----------------------------------------------------------------------------'
'                                                                             '
'============================================================================='



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Réferances §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

' Fenêtre de broosing
Declare Function SHGetSpecialFolderLocation Lib "shell32.dll" _
    (ByVal hwndOwner As Long, ByVal nFolder As Long, ppidl As Long) As Long
Declare Function SHBrowseForFolder Lib "shell32.dll" Alias "SHBrowseForFolderA" _
    (lpbi As BROWSEINFO) As Long
Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" _
    (ByVal pidl As Long, ByVal pszPath As String) As Long
Declare Sub CoTaskMemFree Lib "ole32.dll" _
    (ByVal pv As Long)
    
    
    
'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Déclarations §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

' Structure pour la création d' une fenêtre de broosing
Type BROWSEINFO
  hwndOwner As Long
  pidlRoot As Long
  pszDisplayName As String
  lpszTitle As String
  ulFlags As Long
  lpfn As Long
  lParam As Long
  iImage As Long
End Type

' Messages de la fenêtre de broosing
Const BFFM_ENABLEOK = &H465
Const BFFM_SETSELECTION = &H466
Const BFFM_SETSTATUSTEXT = &H464
Const BFFM_INITIALIZED = 1
Const BFFM_SELCHANGED = 2
Const BFFM_VALIDATEFAILED = 3

' Constante des répértoires spéciaux de windows
Const CSIDL_FLAG_CREATE = &H8000
Const CSIDL_FLAG_DONT_VERIFY = &H4000
Const CSIDL_ADMINTOOLS = &H30
Const CSIDL_ALTSTARTUP = &H1D
Const CSIDL_APPDATA = &H1A
Const CSIDL_BITBUCKET = &HA
Const CSIDL_COMMON_ADMINTOOLS = &H2F
Const CSIDL_COMMON_ALTSTARTUP = &H1D
Const CSIDL_COMMON_APPDATA = &H23
Const CSIDL_COMMON_DESKTOPDIRECTORY = &H19
Const CSIDL_COMMON_DOCUMENTS = &H2E
Const CSIDL_COMMON_FAVORITES = &H1F
Const CSIDL_COMMON_PROGRAMS = &H17
Const CSIDL_COMMON_STARTMENU = &H16
Const CSIDL_COMMON_STARTUP = &H18
Const CSIDL_COMMON_TEMPLATES = &H2D
Const CSIDL_CONTROLS = &H3
Const CSIDL_COOKIES = &H21
Const CSIDL_DESKTOP = &H0
Const CSIDL_DESKTOPDIRECTORY = &H10
Const CSIDL_DRIVES = &H11
Const CSIDL_FAVORITES = &H6
Const CSIDL_FONTS = &H14
Const CSIDL_HISTORY = &H22
Const CSIDL_INTERNET = &H1
Const CSIDL_INTERNET_CACHE = &H20
Const CSIDL_LOCAL_APPDATA = &H1C
Const CSIDL_MYPICTURES = &H27
Const CSIDL_NETHOOD = &H13
Const CSIDL_NETWORK = &H12
Const CSIDL_PERSONAL = &H5
Const CSIDL_PRINTERS = &H4
Const CSIDL_PRINTHOOD = &H1B
Const CSIDL_PROFILE = &H28
Const CSIDL_PROGRAM_FILES = &H26
Const CSIDL_PROGRAM_FILES_COMMON = &H2B
Const CSIDL_PROGRAM_FILES_COMMONX86 = &H2C
Const CSIDL_PROGRAM_FILESX86 = &H2A
Const CSIDL_PROGRAMS = &H2
Const CSIDL_RECENT = &H8
Const CSIDL_SENDTO = &H9
Const CSIDL_STARTMENU = &HB
Const CSIDL_STARTUP = &H7
Const CSIDL_SYSTEM = &H25
Const CSIDL_SYSTEMX86 = &H29
Const CSIDL_TEMPLATES = &H15
Const CSIDL_WINDOWS = &H24



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Outils §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Fonction de callBack de la fenêtre de broosing
'==============================================================================
Public Function BrowseCallbackProc(ByVal hWnd As Long, ByVal uMsg As Long, ByVal lParam As Long, ByVal lpData As Long) As Long
  Dim pathstring As String  ' name of path to set by default
  Dim retval As Long        ' return value

  'Traitement du message
  Select Case uMsg
    Case BFFM_INITIALIZED
        
        ' Chemin par défaut
        pathstring = "X:"  ' the path to make the default selection
        
        ' Envoi d'un message à la fenêtre de broosing pour lui spécifier la séléction
        retval = SendMessage(hWnd, BFFM_SETSELECTION, ByVal CLng(1), ByVal pathstring)
        
  End Select
  
  ' Valeur de la fonction
  BrowseCallbackProc = 0  ' the function should always return 0
  
End Function

'------------------------------------------------------------------------------
' Gestion d'une fenêtre de broosing
'==============================================================================
Public Function DummyFunc(ByVal param As Long) As Long
  DummyFunc = param
End Function

'------------------------------------------------------------------------------
' Création d'une fenêtre de broosing
'==============================================================================
Public Function openBroose(hdlWnd As Long)
    Dim bi As BROWSEINFO    ' Structure de fenêtre de broousing
    Dim pidl As Long        ' PIDL de la séléction du user
    Dim physpath As String  ' string used to temporarily hold the physical path
    Dim retval As Long      ' return value

    ' Propriétaire de la fenêtre de broosing
    bi.hwndOwner = hdlWnd  ' window Form1 is the owner of the dialog box
    
    ' Specify the My Computer virtual folder as the root
    retval = SHGetSpecialFolderLocation(hdlWnd, CSIDL_DRIVES, bi.pidlRoot)
    
    ' Initialisation de la structure pour la création d'une fenêtre de broosing
    With bi
        .pszDisplayName = Space(260)                    ' Make room in the buffer to get the [virtual] folder's display name
        .lpszTitle = "Please choose a folder."          ' Message afficher dans la fenêtre de broosing
        .ulFlags = 0                                    ' no flags are needed here
        .lpfn = DummyFunc(AddressOf BrowseCallbackProc) ' identification de la fonnction de call back
        .lParam = 0                                     ' the callback function here doesn't need this
        .iImage = 0                                     ' this will be set by the function
    End With
    
    ' Ouverture de la fenêtre de broosing
    pidl = SHBrowseForFolder(bi)
    
    ' Traitement de la séléction du user
    If pidl <> 0 Then
      
        ' Remove the empty space from the display name variable.
        bi.pszDisplayName = Left(bi.pszDisplayName, InStr(bi.pszDisplayName, vbNullChar) - 1)
        Debug.Print "The user selected: "; bi.pszDisplayName
    
        ' If the folder is not a virtual folder, display its physical location.
        physpath = Space(260)  ' make room in the buffer
        retval = SHGetPathFromIDList(pidl, physpath)
        
        If retval = 0 Then
            Debug.Print "Physical Location: (virtual folder)"
        Else
        
            ' Remove the empty space and display the result.
            physpath = Left(physpath, InStr(physpath, vbNullChar) - 1)
            Debug.Print "Physical Location: "; physpath
        End If
        
        ' Free the pidl returned by the function.
        CoTaskMemFree pidl
        
    End If

    ' Whether successful or not, free the PIDL which was used to
    ' identify the My Computer virtual folder.
    CoTaskMemFree bi.pidlRoot

End Function

