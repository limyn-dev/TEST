@ECHO off

SET CSC_DIR=C:\Windows\Microsoft.NET\Framework\v4.0.30319
SET SRC_FLE=StartExe.cs
SET EXE_FLE=StartExe.exe

DEL /Y "%~dp0%EXE_FLE%" 

"%CSC_DIR%\csc.exe" -target:winexe -out:"%~dp0%EXE_FLE%" "%~dp0%SRC_FLE%"

PAUSE