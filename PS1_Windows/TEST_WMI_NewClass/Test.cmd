SET DIR_LOC=TESTPS1
SET FLE_PS1=NewWmiClass.ps1

MD "%temp%\%DIR_LOC%" -force
robocopy "%~dp0\." "%temp%\%DIR_LOC%"

powershell.exe -f "%temp%\%DIR_LOC%\%FLE_PS1%"

pause