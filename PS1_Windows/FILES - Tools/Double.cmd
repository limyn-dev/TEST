ECHO off

SET DIR_REF=C:\Users\U10754\OneDrive\_DATA
SET DIR_CHK=C:\Users\U10754\OneDrive\__

powershell.exe -f "%~dp0scripts\Double.ps1" -RP "%DIR_REF%" -CP "%DIR_CHK%"

PAUSE