Attribute VB_Name = "mdlRmtScr"
Option Explicit



' Execution d'un script sur une machine
'______________________________________________________________________________________________________________________
Public Sub runRmtScr(sHost As String, sScript As String)
   Dim oScr As MSScriptControl.ScriptControl
   
   ' Création du contrôleur de script
   Set oScr = CreateObject("MSScriptControl.ScriptControl", sHost)
   oScr.Language = "VBScript"
   
   ' Execution du script
   oScr.ExecuteStatement sScript
   
   Set oScr = Nothing
End Sub
