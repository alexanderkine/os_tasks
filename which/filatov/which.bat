@echo off
setlocal
if "%1"=="/?" (
echo This command display the path to command file
goto :eof
)

if "%1"=="" (
echo Try input an argument
goto :eof
)
if "%~x1" neq "" (
for %%g in (%PATHEXT%) do (
if  /I "%~x1"=="%%g" (
goto :cont
)
)
echo Not Executable
goto :eof
)

:cont
if "%~x1" neq "" (
set PATHEXT=%~x1
)
)
set p="%PATH:;=" "%"
for %%k in (%p%) do (
for /f %%j in ('dir /b %%k 2^>nul') do (
for %%i in (%PATHEXT%) do (
if /I "%%j"=="%~n1%%i" (
	echo %%~k\%~n1%%i
	goto :eof
)
)
)
)
echo Program doesn't exist
endlocal

