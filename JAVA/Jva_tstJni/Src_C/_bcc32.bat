@ECHO off

ECHO Backup de la version actuelle
del CNative.dl_
ren CNative.dll CNative.dl_
del CNative.dll

ECHO Création de la nouvelle vertion de la DLL
bcc32 -tWD CNative.cpp

