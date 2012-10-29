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

ping 1.1.1.1 -n 1 -w %1 >null 

