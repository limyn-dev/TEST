Dim oShl
Dim sPth
Dim sCmd
sPth = WScript.ScriptFullName
sPth = Mid(sPth, 1, InStr(sPth, WScript.ScriptName)-1) 
sCmd = "powershell.exe -WindowStyle Hidden -f """ & sPth & "stm.ps1"""
Set oShl = WScript.CreateObject ("WSCript.shell")
oShl.run sCmd, 0, false
Set oShl = Nothing