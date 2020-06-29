@ECHO off

CD "%~dp0"

ECHO.
ECHO Delete Main.exe
DEL Main.exe

ECHO.
ECHO Compile Main.exe
"C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe" -nologo "Main.cs"

PAUSE