@ECHO off

SET CSC_DIR=C:\Windows\Microsoft.NET\Framework\v4.0.30319
SET SRC_FLE=OPR_CND.cs
SET EXE_FLE=OPR_CND.exe

DEL /Y "%~dp0%EXE_FLE%" 

"%CSC_DIR%\csc.exe" -target:exe -out:"%~dp0%EXE_FLE%" "%~dp0%SRC_FLE%"

PAUSE