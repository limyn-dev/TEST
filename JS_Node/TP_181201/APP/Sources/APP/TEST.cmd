@ECHO off

REM Set location
CD "%~dp0"

REM Start server
node.exe "./App.js"
