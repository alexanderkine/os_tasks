@echo off
if "%1"=="/?" (
	echo This commang help to sleep.
	echo parameter is milisecond
	goto :eof
)

if "%1"=="" (
	echo You must input a time.
	goto :eof
)

for /f %%i in ('echo %1^|findstr "[^0-9]"') do (
	echo not a number 1>&2 
	exit /b 5
)

ping 1.1.1.1 -n 1 -w %1 >nul 

