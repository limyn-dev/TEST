@ECHO off

ECHO -------------------------------------------------------------
ECHO START [%~dp0Menu.ps1]
ECHO -------------------------------------------------------------
REM powershell -WindowStyle Hidden -f "%~dp0Menu.ps1"
powershell -f "%~dp0Menu.ps1"
PAUSE