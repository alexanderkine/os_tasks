@echo off

:start
if "%1" neq "" (
	if "%1" neq "/?" (
		shift && goto :start
	)
	if "%1"=="/?" (
		echo return ipv4-adress
		goto :eof
	)
)

REM for /f "tokens=2 delims=:" %%i in (123.bat) do echo%%i	
for %%i in (123.bat "t.    hy") do echo %%i	
