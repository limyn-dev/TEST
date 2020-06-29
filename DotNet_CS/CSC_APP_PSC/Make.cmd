@ECHO off

SET CSC_DIR=C:\Windows\Microsoft.NET\Framework\v4.0.30319
SET SRC_FLE=*.cs
SET DLL_SMA=C:\Windows\Microsoft.NET\assembly\GAC_MSIL\System.Management.Automation\v4.0_3.0.0.0__31bf3856ad364e35\System.Management.Automation.dll
SET EXE_FLE=pcs.exe

DEL /Y "%~dp0%EXE_FLE%" 

"%CSC_DIR%\csc.exe" -target:exe -reference:"%DLL_SMA%" -out:"%~dp0%EXE_FLE%" "%~dp0CS\*.cs"

PAUSE