@ECHO off

SET DIR_INC=C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\um
SET FLE_SRC=T01.cpp
SET FLE_EXE=T01.exe

clang++.exe -I "%DIR_INC%" -Wall "%~dp0%FLE_SRC%" -o "%~dp0%FLE_EXE%"
PAUSE

CLS
"%~dp0%FLE_EXE%" "CERT_ECHO;CURRENT_USER:MY"
PAUSE