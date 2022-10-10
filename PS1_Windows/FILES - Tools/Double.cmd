ECHO off

SET DIR_TO_SCAN=\\nas\2017

powershell.exe -f "%~dp0scripts\Double.ps1" -SF "%DIR_TO_SCAN%"

PAUSE