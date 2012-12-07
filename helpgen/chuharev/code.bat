@echo off

set a=%1
:tadam
if "%1" neq "/?" (
	shift
	goto :tadam
)
if "%1"=="/?" (
	echo return help for help's comands to result.txt
	goto :eof
)

type nul >result.txt

for /f %%i in ('help ^| findstr /b /r /c:"[A-Z][A-Z]*  "') do help %%i >>result.txt