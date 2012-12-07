@echo off

if "%1" equ "/?" (
	echo kill ip by n time
	goto :eof
)

for /f %%i in ('echo %1^| findstr "[^0-9]"') do (
	echo it is not number
	goto :eof
)

ping 127.0.0.1 -n %1+1 > nul
