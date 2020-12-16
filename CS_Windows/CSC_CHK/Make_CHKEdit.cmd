@ECHO off

SET CSC_DIR=C:\Windows\Microsoft.NET\Framework\v4.0.30319
SET SDK_DIR=C:\Program Files (x86)\Windows Kits\10\bin
SET SRC_FLE=CHKEdit.cs
SET SRC_LBT=CTemplates.cs
SET EXE_FLE=CHKEdit.exe

REM CLS
REM ECHO **************************************************************************
REM ECHO MAKE CERTIFICAT
REM ECHO **************************************************************************
REM DEL /F /Q "%~dp0sign\C_R201210B_C201210B.cer"
REM DEL /F /Q "%~dp0sign\C_R201210B_C201210B.pfx"
REM "%SDK_DIR%\x64\makecert.exe" -sv "%~dp0sign\K_R201210B_C201210B.pvk" -n "CN=LIMYN" -len 2048 "%~dp0sign\C_R201210B_C201210B.cer" -r
REM "%SDK_DIR%\x64\pvk2pfx.exe" -pvk "%~dp0sign\K_R201210B_C201210B.pvk" -spc "%~dp0sign\C_R201210B_C201210B.cer" -pfx "%~dp0sign\C_R201210B_C201210B.pfx" -po Passw0rd
REM PAUSE

ECHO **************************************************************************
ECHO BUILD APP
ECHO **************************************************************************
DEL /F /Q "%~dp0%EXE_FLE%" 
"%CSC_DIR%\csc.exe" -target:winexe -out:"%~dp0%EXE_FLE%" "%~dp0CS\*.cs"
PAUSE

CLS
ECHO **************************************************************************
ECHO SIGN APP
ECHO **************************************************************************
"%SDK_DIR%\x64\signtool.exe" sign /f "%~dp0sign\C_R201210B_C201210B.pfx" /p Passw0rd "%~dp0%EXE_FLE%"
PAUSE

CLS
ECHO **************************************************************************
ECHO START APP
ECHO **************************************************************************
"%~dp0%EXE_FLE%"
PAUSE