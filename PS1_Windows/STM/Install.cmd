@ECHO off

SET DIR_APP=%USERPROFILE%\AppData\Local\stm
SET KEY_RUN=HKCU\Software\Microsoft\Windows\CurrentVersion\Run
SET VAL_STM=stm

ECHO --------------------------------------------------------------------------
ECHO SET DIRECTORY [%DIR_APP%]
ECHO --------------------------------------------------------------------------
MD "%DIR_APP%"
robocopy "%~dp0sources" "%DIR_APP%" /MIR
PAUSE

CLS
ECHO --------------------------------------------------------------------------
ECHO SET REGISTRY
ECHO --------------------------------------------------------------------------
reg delete "%KEY_RUN%" /v "%VAL_STM%" /f
reg add "%KEY_RUN%" /v "%VAL_STM%" /t REG_SZ /d "cscript.exe \"%DIR_APP%\stm.vbs\""
PAUSE