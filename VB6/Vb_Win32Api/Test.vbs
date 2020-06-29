Option Explicit

Dim oApi : Set oApi=CreateObject("Win32Api.CWin32Api")
Dim nHwd
Dim sTtl

nHwd = CLng(oApi.WrapGetActiveWindow)
MsgBox "Active window [" & CStr(nHwd) & "]"

sTtl = oApi.GetActiveWindowTitle
MsgBox "Active window [" & sTtl & "]"

