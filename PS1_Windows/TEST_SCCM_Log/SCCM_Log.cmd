@ECHO off


powershell.exe -f "%~dp0SCCM_Log.Ps1" -LP "%~dp0Logs" -DX 2

PAUSE