@ECHO off

ECHO -------------------------------------------------------------
ECHO START [%~dp0stm.ps1]
ECHO -------------------------------------------------------------
powershell -WindowStyle Hidden -f "%~dp0stm.ps1"
REM powershell -f "%~dp0stm.ps1"
PAUSE