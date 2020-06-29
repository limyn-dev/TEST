@ECHO off

SET CSC_DIR=C:\Windows\Microsoft.NET\Framework\v4.0.30319
SET EXE_FLE=WinCredCmd.exe

DEL /Y "%~dp0%EXE_FLE%" 

"%CSC_DIR%\csc.exe" -target:exe -out:"%~dp0%EXE_FLE%" "%~dp0LIMYN\C_LG.cs" "%~dp0LIMYN\C_WinCred.cs" "%~dp0LIMYN\C_WinCredCmd.cs"

PAUSE