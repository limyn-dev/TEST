VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CRegistry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit




' Key Creation
'______________________________________________________________________________________________________________________
Public Sub CboLoad(nHKey As Long, sPath As String, oCbo As ComboBox)
   Const BUF_SZE = 4000
   Const VAL_SZE = 255
   Dim nRsu As Long           ' Result value
   Dim hCrk As Long           ' Handel for the curent key
   Dim sVnm As String         ' Value name
   Dim nVtp As Long           ' Value type
   Dim nVct As Long           ' Value counter
   Dim nBuf(SZE_BUF) As Byte  ' Buffer
   Dim nEol As Integer        ' End of line position

   ' key openning
   nRsu = RegOpenKey(nHKey, sPath, hCrk)
   
   ' Value browsing
   Do
      sVnm = String$(VAL_SZE, " ")
      nRsu = RegEnumValue(hCrk, nVct, sVnm, VAL_SZE, 0&, nVtp, nBuf(0), SZE_BUF)
      If nRsu = ERR_OK Then
         nEol = InStr(sVnm, Chr$(0))
         If nEol > 0 Then
            oCbo.AddItem = Left$(sVnm, nEol - 1)
         Else
            oCbo.AddItem = sVnm
         End If
      Else
         Exit Do
      End If
   Loop

End Sub






'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§



' Key Creation
'______________________________________________________________________________________________________________________
Private Function CreateKey(HKey As Long, strPath As String) As Boolean
   Dim hCurKey As Long
   Dim lRegResult As Long

   lRegResult = RegCreateKey(HKey, strPath, hCurKey)
   If lRegResult = ERR_OK Then
      CreateKey = True
   Else
      CreateKey = False
   End If
   lRegResult = RegCloKey(hCurKey)

End Function



' Key suppression
'______________________________________________________________________________________________________________________
Private Sub DeleteKey(ByVal HKey As Long, ByVal strPath As String)
   Dim lRegResult As Long

   lRegResult = RegDeleteKey(HKey, strPath)

End Sub



' Value suppression
'______________________________________________________________________________________________________________________
Private Sub DeleteValue(ByVal HKey As Long, ByVal strPath As String, ByVal strValue As String)
   Dim hCurKey As Long
   Dim lRegResult As Long

   lRegResult = RegOpenKey(HKey, strPath, hCurKey)
   lRegResult = RegDeleteValue(hCurKey, strValue)
   lRegResult = RegCloKey(hCurKey)

End Sub



' Reading string setting
'______________________________________________________________________________________________________________________
Private Function GetSettingString(HKey As Long, strPath As String, strValue As String, Optional Default As String) As String
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
   lRegResult = RegOpenKey(HKey, strPath, hCurKey)
   lRegResult = RegQueryValueEx(hCurKey, strValue, 0&, lValueType, ByVal 0&, lDataBufferSize)
   If lRegResult = ERR_OK Then
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
      Err.Raise 1001, "mdlReg.GetSettingString", "Unable to read " & HKeyName(HKey) & "\" & strPath & "\" & strValue
   End If

   ' Closing of the key
   lRegResult = RegCloKey(hCurKey)
   
End Function



' Writing string data
'______________________________________________________________________________________________________________________
Private Sub SaveSettingString(HKey As Long, strPath As String, strValue As String, strData As String)
   Dim hCurKey As Long
   Dim lRegResult As Long
   Dim sErrMsg As String
   
   ' Key Creation
   lRegResult = RegCreateKey(HKey, strPath, hCurKey)

   ' Set then setting
   lRegResult = RegSetValueEx(hCurKey, strValue, 0, REG_SZ, ByVal strData, Len(strData))
   If Not lRegResult = ERR_OK Then
      Err.Raise 1001, "mdlReg.SaveSettingString", "Unable to set " & HKeyName(HKey) & "\" & strPath & "\" & strValue & " to " & strData
   End If
   
   ' Closing of the key
   lRegResult = RegCloKey(hCurKey)
   
End Sub



' Reading long data
'______________________________________________________________________________________________________________________
Private Function GetSettingLong(ByVal HKey As Long, ByVal strPath As String, ByVal strValue As String, Optional Default As Long) As Long
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
   lRegResult = RegOpenKey(HKey, strPath, hCurKey)
   lDataBufferSize = 4       ' 4 bytes = 32 bits = long
   lRegResult = RegQueryValueEx(hCurKey, strValue, 0&, lValueType, lBuffer, lDataBufferSize)
   If lRegResult = ERR_OK Then
      If lValueType = REG_DW Then GetSettingLong = lBuffer
   Else
      Err.Raise 1002, "mdlReg.GetSettingLong", "Unable to Read" & HKeyName(HKey) & "\" & strPath & "\" & strValue
   End If

   ' Closing of the Key
   lRegResult = RegCloKey(hCurKey)

End Function



' Writing long data
'______________________________________________________________________________________________________________________
Private Sub SaveSettingLong(ByVal HKey As Long, ByVal strPath As String, ByVal strValue As String, ByVal lData As Long)
   Dim hCurKey As Long
   Dim lRegResult As Long

   ' Key creation
   lRegResult = RegCreateKey(HKey, strPath, hCurKey)
   
   ' Data Setting
   lRegResult = RegSetValueEx(hCurKey, strValue, 0&, REG_DW, lData, 4)
   If lRegResult <> ERR_OK Then
      Err.Raise 1003, "mdlReg.SaveSettingLong", "Unable to write " & CStr(lData) & " in " & HKeyName(HKey) & "\" & strPath & "\" & strValue
   End If

   lRegResult = RegCloKey(hCurKey)
End Sub



' Reading byte data
'______________________________________________________________________________________________________________________
Private Function GetSettingByte(ByVal HKey As Long, ByVal strPath As String, ByVal strValueName As String, Optional Default As Variant) As Variant
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
   lRegResult = RegOpenKey(HKey, strPath, hCurKey)
   lRegResult = RegQueryValueEx(hCurKey, strValueName, 0&, lValueType, ByVal 0&, lDataBufferSize)
   If lRegResult = ERR_OK Then
      If lValueType = REG_BN Then
         ReDim byBuffer(lDataBufferSize - 1) As Byte
         lRegResult = RegQueryValueEx(hCurKey, strValueName, 0&, lValueType, byBuffer(0), lDataBufferSize)
         GetSettingByte = byBuffer
      End If
   Else
      Err.Raise 1004, "mdlReg.GetSettingByte", "Unable to read " & HKeyName(HKey) & "\" & strPath & "\" & strValueName
   End If
   
   ' Key closing
   lRegResult = RegCloKey(hCurKey)
   
End Function



' Writting byte data
' Make sure that the array starts with element 0 before passing it!
' (otherwise it will not be saved!)
'______________________________________________________________________________________________________________________
Private Sub SaveSettingByte(ByVal HKey As Long, ByVal strPath As String, ByVal strValueName As String, byData() As Byte)
   Dim lRegResult As Long
   Dim hCurKey As Long

   lRegResult = RegCreateKey(HKey, strPath, hCurKey)
   lRegResult = RegSetValueEx(hCurKey, strValueName, 0&, REG_BN, byData(0), UBound(byData()) + 1)
   lRegResult = RegCloKey(hCurKey)
   
End Sub



' Writting byte data
' Returns: an array in a variant of strings
'______________________________________________________________________________________________________________________
Private Function GetAllKeys(HKey As Long, strPath As String) As Variant
   Dim lRegResult As Long
   Dim lCounter As Long
   Dim hCurKey As Long
   Dim strBuffer As String
   Dim lDataBufferSize As Long
   Dim strNames() As String
   Dim intZeroPos As Integer
   
   lCounter = 0
   
   ' Key openning
   lRegResult = RegOpenKey(HKey, strPath, hCurKey)
   
   ' Key browsing
   Do
      lDataBufferSize = 255
      strBuffer = String(lDataBufferSize, " ")
      lRegResult = RegEnumKey(hCurKey, lCounter, strBuffer, lDataBufferSize)
      If lRegResult = ERR_OK Then
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
Private Function GetAllValues(HKey As Long, strPath As String) As Variant
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
   lRegResult = RegOpenKey(HKey, strPath, hCurKey)
   
   ' Value browsing
   Do
      lValueNameSize = 255
      strValueName = String$(lValueNameSize, " ")
      lDataBufferSize = 4000
      lRegResult = RegEnumValue(hCurKey, lCounter, strValueName, lValueNameSize, 0&, lValueType, byDataBuffer(0), lDataBufferSize)
      If lRegResult = ERR_OK Then
      
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
      Case HKCR:     HKeyName = "HKCR"
      Case HKCU:     HKeyName = "HKCU"
      Case HKLM:    HKeyName = "HKLM"
      Case HKUS:            HKeyName = "HKUS"
      Case HKPD: HKeyName = "HKPD"
      Case HKCC:   HKeyName = "HKCC"
      Case HKDD:         HKeyName = "HKDD"
   End Select
End Function



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§



' Classe creation
'______________________________________________________________________________________________________________________
Private Sub Class_Initialize()

End Sub



' Classe deletion
'______________________________________________________________________________________________________________________
Private Sub Class_Terminate()

End Sub
