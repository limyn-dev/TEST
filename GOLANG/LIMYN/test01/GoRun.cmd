@Echo off

SET DIR_GOL=C:\ProgramData\Go\src\LIMYN\test01

ECHO ==========================================================================
ECHO SET DIRECTORY ["%DIR_GOL%\src\%PROJECT%"]
ECHO ==========================================================================
MD "%DIR_GOL%"
robocopy "%~dp0src" "%DIR_GOL%" /MIR
CD "%DIR_GOL%"
PAUSE

CLS
ECHO ==========================================================================
ECHO GO RUN
ECHO ==========================================================================
go run .
PAUSE