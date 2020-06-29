Attribute VB_Name = "Registry"
Option Explicit
'For contacting information see other module

Public Const HKEY_CLASSES_ROOT = &H80000000
Public Const HKEY_CURRENT_USER = &H80000001
Public Const HKEY_LOCAL_MACHINE = &H80000002
Public Const HKEY_USERS = &H80000003
Public Const HKEY_PERFORMANCE_DATA = &H80000004
Public Const HKEY_CURRENT_CONFIG = &H80000005
Public Const HKEY_DYN_DATA = &H80000006
Public Const REG_SZ = 1                         ' Unicode nul terminated string
Public Const REG_BINARY = 3                     ' Free form binary
Public Const REG_DWORD = 4                      ' 32-bit number
Public Const ERROR_SUCCESS = 0&

Public Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Public Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" (ByVal hKey As Long, ByVal lpSubKey As String) As Long
Public Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long
'--------------------------------------------------
Public Declare Function RegEnumKey Lib "advapi32.dll" Alias "RegEnumKeyA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpName As String, ByVal cbName As Long) As Long
Public Declare Function RegEnumValue Lib "advapi32.dll" Alias "RegEnumValueA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpValueName As String, lpcbValueName As Long, lpReserved As Long, lpType As Long, lpData As Byte, lpcbData As Long) As Long
'--------------------------------------------------
Public Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Public Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long



' Key Creaation
'______________________________________________________________________________________________________________________
Public Function CreateKey(hKey As Long, strPath As String) As Boolean
   Dim hCurKey As Long
   Dim lRegResult As Long

   lRegResult = RegCreateKey(hKey, strPath, hCurKey)
   If lRegResult = ERROR_SUCCESS Then
      CreateKey = True
   Else
      CreateKey = False
   End If
   lRegResult = RegCloseKey(hCurKey)

End Function



' Key suppression
'______________________________________________________________________________________________________________________
Public Sub DeleteKey(ByVal hKey As Long, ByVal strPath As String)
   Dim lRegResult As Long

   lRegResult = RegDeleteKey(hKey, strPath)

End Sub



' Value suppression
'______________________________________________________________________________________________________________________
Public Sub DeleteValue(ByVal hKey As Long, ByVal strPath As String, ByVal strValue As String)
   Dim hCurKey As Long
   Dim lRegResult As Long

   lRegResult = RegOpenKey(hKey, strPath, hCurKey)
   lRegResult = RegDeleteValue(hCurKey, strValue)
   lRegResult = RegCloseKey(hCurKey)

End Sub



' Reading string setting
'______________________________________________________________________________________________________________________
Public Function GetSettingString(hKey As Long, strPath As String, strValue As String, Optional Default As String) As String
   Dim hCurKey As Long
   Dim lValueType As Long
   Dim strBuffer As String
   Dim lDataBufferSize As Long
   Dim intZeroPos As Integer
   Dim lRegResult As Long

   ' Set up default value
   If Not IsEmpty(Default) Then
      GetSettingString = Default
   Else
      GetSettingString = ""
   End If

   ' Open the key and get length of string
   lRegResult = RegOpenKey(hKey, strPath, hCurKey)
   lRegResult = RegQueryValueEx(hCurKey, strValue, 0&, lValueType, ByVal 0&, lDataBufferSize)
   If lRegResult = ERROR_SUCCESS Then
      If lValueType = REG_SZ Then
    
         ' initialise string buffer and retrieve string
         strBuffer = String(lDataBufferSize, " ")
         lRegResult = RegQueryValueEx(hCurKey, strValue, 0&, 0&, ByVal strBuffer, lDataBufferSize)
    
         ' format string
         intZeroPos = InStr(strBuffer, Chr$(0))
         If intZeroPos > 0 Then
            GetSettingString = Left$(strBuffer, intZeroPos - 1)
         Else
            GetSettingString = strBuffer
         End If

      End If
   Else
      Err.Raise 1001, "mdlReg.GetSettingString", "Unable to read " & HKeyName(hKey) & "\" & strPath & "\" & strValue
   End If

   ' Closing of the key
   lRegResult = RegCloseKey(hCurKey)
   
End Function



' Writing string data
'______________________________________________________________________________________________________________________
Public Sub SaveSettingString(hKey As Long, strPath As String, strValue As String, strData As String)
   Dim hCurKey As Long
   Dim lRegResult As Long
   Dim sErrMsg As String
   
   ' Key Creation
   lRegResult = RegCreateKey(hKey, strPath, hCurKey)

   ' Set then setting
   lRegResult = RegSetValueEx(hCurKey, strValue, 0, REG_SZ, ByVal strData, Len(strData))
   If Not lRegResult = ERROR_SUCCESS Then
      Err.Raise 1001, "mdlReg.SaveSettingString", "Unable to set " & HKeyName(hKey) & "\" & strPath & "\" & strValue & " to " & strData
   End If
   
   ' Closing of the key
   lRegResult = RegCloseKey(hCurKey)
   
End Sub



' Reading long data
'______________________________________________________________________________________________________________________
Public Function GetSettingLong(ByVal hKey As Long, ByVal strPath As String, ByVal strValue As String, Optional Default As Long) As Long
   Dim lRegResult As Long
   Dim lValueType As Long
   Dim lBuffer As Long
   Dim lDataBufferSize As Long
   Dim hCurKey As Long
   Dim sErrMsg As String

   ' Set up default value
   If Not IsEmpty(Default) Then
      GetSettingLong = Default
   Else
      GetSettingLong = 0
   End If

   ' Key reading
   lRegResult = RegOpenKey(hKey, strPath, hCurKey)
   lDataBufferSize = 4       ' 4 bytes = 32 bits = long
   lRegResult = RegQueryValueEx(hCurKey, strValue, 0&, lValueType, lBuffer, lDataBufferSize)
   If lRegResult = ERROR_SUCCESS Then
      If lValueType = REG_DWORD Then GetSettingLong = lBuffer
   Else
      Err.Raise 1002, "mdlReg.GetSettingLong", "Unable to Read" & HKeyName(hKey) & "\" & strPath & "\" & strValue
   End If

   ' Closing of the Key
   lRegResult = RegCloseKey(hCurKey)

End Function



' Writing long data
'______________________________________________________________________________________________________________________
Public Sub SaveSettingLong(ByVal hKey As Long, ByVal strPath As String, ByVal strValue As String, ByVal lData As Long)
   Dim hCurKey As Long
   Dim lRegResult As Long

   ' Key creation
   lRegResult = RegCreateKey(hKey, strPath, hCurKey)
   
   ' Data Setting
   lRegResult = RegSetValueEx(hCurKey, strValue, 0&, REG_DWORD, lData, 4)
   If lRegResult <> ERROR_SUCCESS Then
      Err.Raise 1003, "mdlReg.SaveSettingLong", "Unable to write " & CStr(lData) & " in " & HKeyName(hKey) & "\" & strPath & "\" & strValue
   End If

   lRegResult = RegCloseKey(hCurKey)
End Sub



' Reading byte data
'______________________________________________________________________________________________________________________
Public Function GetSettingByte(ByVal hKey As Long, ByVal strPath As String, ByVal strValueName As String, Optional Default As Variant) As Variant
   Dim lValueType As Long
   Dim byBuffer() As Byte
   Dim lDataBufferSize As Long
   Dim lRegResult As Long
   Dim hCurKey As Long

   ' setup default value
   If Not IsEmpty(Default) Then
      If VarType(Default) = vbArray + vbByte Then
         GetSettingByte = Default
      Else
         GetSettingByte = 0
      End If
   Else
     GetSettingByte = 0
   End If
   
   ' Open the key and get number of bytes
   lRegResult = RegOpenKey(hKey, strPath, hCurKey)
   lRegResult = RegQueryValueEx(hCurKey, strValueName, 0&, lValueType, ByVal 0&, lDataBufferSize)
   If lRegResult = ERROR_SUCCESS Then
      If lValueType = REG_BINARY Then
         ReDim byBuffer(lDataBufferSize - 1) As Byte
         lRegResult = RegQueryValueEx(hCurKey, strValueName, 0&, lValueType, byBuffer(0), lDataBufferSize)
         GetSettingByte = byBuffer
      End If
   Else
      Err.Raise 1004, "mdlReg.GetSettingByte", "Unable to read " & HKeyName(hKey) & "\" & strPath & "\" & strValueName
   End If
   
   ' Key closing
   lRegResult = RegCloseKey(hCurKey)
   
End Function



' Writting byte data
' Make sure that the array starts with element 0 before passing it!
' (otherwise it will not be saved!)
'______________________________________________________________________________________________________________________
Public Sub SaveSettingByte(ByVal hKey As Long, ByVal strPath As String, ByVal strValueName As String, byData() As Byte)
   Dim lRegResult As Long
   Dim hCurKey As Long

   lRegResult = RegCreateKey(hKey, strPath, hCurKey)
   lRegResult = RegSetValueEx(hCurKey, strValueName, 0&, REG_BINARY, byData(0), UBound(byData()) + 1)
   lRegResult = RegCloseKey(hCurKey)
   
End Sub



' Writting byte data
' Returns: an array in a variant of strings
'______________________________________________________________________________________________________________________
Public Function GetAllKeys(hKey As Long, strPath As String) As Variant
   Dim lRegResult As Long
   Dim lCounter As Long
   Dim hCurKey As Long
   Dim strBuffer As String
   Dim lDataBufferSize As Long
   Dim strNames() As String
   Dim intZeroPos As Integer
   
   lCounter = 0
   
   ' Key openning
   lRegResult = RegOpenKey(hKey, strPath, hCurKey)
   
   ' Key browsing
   Do
      lDataBufferSize = 255
      strBuffer = String(lDataBufferSize, " ")
      lRegResult = RegEnumKey(hCurKey, lCounter, strBuffer, lDataBufferSize)
      If lRegResult = ERROR_SUCCESS Then
         ReDim Preserve strNames(lCounter) As String
         intZeroPos = InStr(strBuffer, Chr$(0))
         If intZeroPos > 0 Then
            strNames(UBound(strNames)) = Left$(strBuffer, intZeroPos - 1)
         Else
            strNames(UBound(strNames)) = strBuffer
         End If
         lCounter = lCounter + 1
      Else
         Exit Do
      End If
   Loop
   
   ' Result return
   GetAllKeys = strNames
   
End Function
   
   
   
' Browsing values of a key
'     Returns: a 2D array.
'     (x,0) is value name
'     (x,1) is value type (see constants)
'______________________________________________________________________________________________________________________
Public Function GetAllValues(hKey As Long, strPath As String) As Variant
   Dim lRegResult As Long
   Dim hCurKey As Long
   Dim lValueNameSize As Long
   Dim strValueName As String
   Dim lCounter As Long
   Dim byDataBuffer(4000) As Byte
   Dim lDataBufferSize As Long
   Dim lValueType As Long
   Dim strNames() As String
   Dim lTypes() As Long
   Dim intZeroPos As Integer
   Dim Finisheddata() As Variant
   
   ' key openning
   lRegResult = RegOpenKey(hKey, strPath, hCurKey)
   
   ' Value browsing
   Do
      lValueNameSize = 255
      strValueName = String$(lValueNameSize, " ")
      lDataBufferSize = 4000
      lRegResult = RegEnumValue(hCurKey, lCounter, strValueName, lValueNameSize, 0&, lValueType, byDataBuffer(0), lDataBufferSize)
      If lRegResult = ERROR_SUCCESS Then
      
         ' Save the type
         ReDim Preserve strNames(lCounter) As String
         ReDim Preserve lTypes(lCounter) As Long
         lTypes(UBound(lTypes)) = lValueType
         intZeroPos = InStr(strValueName, Chr$(0))
         If intZeroPos > 0 Then
            strNames(UBound(strNames)) = Left$(strValueName, intZeroPos - 1)
         Else
            strNames(UBound(strNames)) = strValueName
         End If
         lCounter = lCounter + 1
      Else
         Exit Do
      End If
   Loop
   
   'Move data into array
   ReDim Finisheddata(UBound(strNames), 0 To 1) As Variant
   For lCounter = 0 To UBound(strNames)
      Finisheddata(lCounter, 0) = strNames(lCounter)
      Finisheddata(lCounter, 1) = lTypes(lCounter)
   Next
   GetAllValues = Finisheddata
   
End Function



' Retrive the HKey name
'______________________________________________________________________________________________________________________
Private Function HKeyName(lHkey As Long) As String
   Select Case lHkey
      Case HKEY_CLASSES_ROOT:     HKeyName = "HKEY_CLASSES_ROOT"
      Case HKEY_CURRENT_USER:     HKeyName = "HKEY_CURRENT_USER"
      Case HKEY_LOCAL_MACHINE:    HKeyName = "HKEY_LOCAL_MACHINE"
      Case HKEY_USERS:            HKeyName = "HKEY_USERS"
      Case HKEY_PERFORMANCE_DATA: HKeyName = "HKEY_PERFORMANCE_DATA"
      Case HKEY_CURRENT_CONFIG:   HKeyName = "HKEY_CURRENT_CONFIG"
      Case HKEY_DYN_DATA:         HKeyName = "HKEY_DYN_DATA"
   End Select
End Function
