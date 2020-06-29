Attribute VB_Name = "mdlApi"
Option Explicit

' Boîte de saisie des fichiers
'------------------------------------------------------------------------------
Public Const OFN_FILEMUSTEXIST = &H1000
Public Const OFN_HIDEREADONLY = &H4
Public Const OFN_PATHMUSTEXIST = &H800
Public Const OFN_OVERWRITEPROMPT = &H2
Public Type OPENFILENAME
        lStructSize As Long
        hwndOwner As Long
        hInstance As Long
        lpstrFilter As String
        lpstrCustomFilter As String
        nMaxCustomFilter As Long
        nFilterIndex As Long
        lpstrFile As String
        nMaxFile As Long
        lpstrFileTitle As String
        nMaxFileTitle As Long
        lpstrInitialDir As String
        lpstrTitle As String
        flags As Long
        nFileOffset As Integer
        nFileExtension As Integer
        lpstrDefExt As String
        lCustData As Long
        lpfnHook As Long
        lpTemplateName As String
End Type
Declare Function GetOpenFileName Lib "comdlg32.dll" Alias "GetOpenFileNameA" (lpofn As OPENFILENAME) As Long
Declare Function GetSaveFileName Lib "comdlg32.dll" Alias "GetSaveFileNameA" (lpofn As OPENFILENAME) As Long
 
' Fonction d'ouvertur des fichiers
'------------------------------------------------------------------------------
Public Function SelectFile(hWnd As Long, strFilter As String) As String
    Dim filebox As OPENFILENAME  ' open file dialog structure
    Dim result As Long           ' result of opening the dialog

    ' Configure how the dialog box will look
    With filebox
        .lStructSize = Len(filebox)                 ' Size of the structure.
        .hwndOwner = hWnd                           ' Handle to window opening the dialog.
        .hInstance = 0                              ' Handle to calling instance (not needed).
        .lpstrFilter = strFilter                    ' File filters to make available: Text Files and All Files
        .nMaxCustomFilter = 0                       '
        '.lpstrCustomFilter                         ' is ignored -- unused string
        .nFilterIndex = 1                           ' Default filter is the first one (Text Files, in this case).
        .lpstrFile = Space(256) & vbNullChar        ' No default filename.  Also make room for received path and filename of the user's selection.
        .nMaxFile = Len(.lpstrFile)                 '
        .lpstrFileTitle = Space(256) & vbNullChar   ' Make room for filename of the user's selection.
        .nMaxFileTitle = Len(.lpstrFileTitle)       '
        .lpstrInitialDir = "C:\" & vbNullChar       ' Initial directory is C:\.
        .lpstrTitle = "Select a File" & vbNullChar  ' Title of file dialog.
        .flags = OFN_PATHMUSTEXIST Or _
                 OFN_FILEMUSTEXIST Or _
                 OFN_HIDEREADONLY                   ' The path and file must exist; hide the read-only box.
        .nFileOffset = 0                            ' The rest of the options aren't needed.
        .nFileExtension = 0                         '
        .lCustData = 0                              '
        '.lpstrDefExt                               ' is ignored -- unused string
        .lpfnHook = 0                               '
        '.lpTemplateName                            ' is ignored -- unused string
    End With
    
    ' Display the dialog box.
    result = GetOpenFileName(filebox)
    
    If result <> 0 Then
        SelectFile = Left(filebox.lpstrFile, InStr(filebox.lpstrFile, vbNullChar) - 1)
    Else
        SelectFile = ""
    End If
    
End Function

' Séléction d'un répertoire
'------------------------------------------------------------------------------
Public Function SelectFolder(hWnd As Long, strFilter As String) As String
    Dim filebox As OPENFILENAME  ' save file dialog structure
    Dim result As Long           ' result of opening the dialog
        
    ' Configure how the dialog box will look
    With filebox
        .lStructSize = Len(filebox)                 ' Size of the structure.
        .hwndOwner = hWnd                           ' Handle to window opening the dialog.
        .hInstance = 0                              ' Handle to calling instance (not needed).
        .lpstrFilter = strFilter                    '
        .nMaxCustomFilter = 0                       '
        '.lpstrCustomFilter                         ' is ignored -- unused string
        .nFilterIndex = 1                           ' Default filter is the first one (Text Files, in this case).
        .lpstrFile = "-" & Space(256) & vbNullChar        ' No default filename.  Also make room for received path and filename of the user's selection.
        .nMaxFile = Len(.lpstrFile)                 '
        .lpstrFileTitle = Space(256) & vbNullChar   ' Make room for filename of the user's selection.
        .nMaxFileTitle = Len(.lpstrFileTitle)       '
        .lpstrInitialDir = "C:\" & vbNullChar       ' Initial directory is C:\.
        .lpstrTitle = "Select a File" & vbNullChar  ' Title of file dialog.
        .flags = OFN_PATHMUSTEXIST                  ' The path must exist.  Hide the read-only box. Warn if an existing file is selected.
        .nFileOffset = 0                            ' The rest of the options aren't needed.
        .nFileExtension = 0                         '
        .lCustData = 0                              '
        '.lpstrDefExt                               ' is ignored -- unused string
        .lpfnHook = 0                               '
        '.lpTemplateName                            ' is ignored -- unused string
    End With
        
    ' Display the dialog box.
    result = GetSaveFileName(filebox)
    
    ' check du résultat
    If result <> 0 Then
        SelectFolder = Left(filebox.lpstrFile, InStr(filebox.lpstrFile, vbNullChar) - 1)
    Else
        SelectFolder = ""
    End If
    
End Function

