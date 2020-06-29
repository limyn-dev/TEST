Attribute VB_Name = "mdlAPI"
 Option Explicit

' Key HK
Public Enum E_Reg
   HKCR = &H80000000
   HKCU = &H80000001
   HKLM = &H80000002
   HKUS = &H80000003
   HKPD = &H80000004
   HKCC = &H80000005
   HKDD = &H80000006
End Enum

' Registry value type
Public Enum E_RegType
   REG_SZ = 1
   REG_BN = 3
   REG_DW = 4
End Enum

' Return value
Public Const ERR_OK = 0&

' API functions declaration
Public Declare Function RegCloseKey Lib "advapi32.dll" (ByVal HKey As Long) As Long
Public Declare Function RegOpenKey Lib "advapi32.dll" _
   Alias "RegOpenKeyA" (ByVal HKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegCreateKey Lib "advapi32.dll" _
   Alias "RegCreateKeyA" (ByVal HKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Public Declare Function RegDeleteKey Lib "advapi32.dll" _
   Alias "RegDeleteKeyA" (ByVal HKey As Long, ByVal lpSubKey As String) As Long
Public Declare Function RegDeleteValue Lib "advapi32.dll" _
   Alias "RegDeleteValueA" (ByVal HKey As Long, ByVal lpValueName As String) As Long
Public Declare Function RegEnumKey Lib "advapi32.dll" _
   Alias "RegEnumKeyA" (ByVal HKey As Long, ByVal dwIndex As Long, ByVal lpName As String, ByVal cbName As Long) As Long
Public Declare Function RegEnumValue Lib "advapi32.dll" _
   Alias "RegEnumValueA" (ByVal HKey As Long, ByVal dwIndex As Long, ByVal lpValueName As String, lpcbValueName As Long, lpReserved As Long, lpType As Long, lpData As Byte, lpcbData As Long) As Long
Public Declare Function RegQueryValueEx Lib "advapi32.dll" _
   Alias "RegQueryValueExA" (ByVal HKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Public Declare Function RegSetValueEx Lib "advapi32.dll" _
   Alias "RegSetValueExA" (ByVal HKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long


