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

for /f "tokens=2 delims=:" %%i in ("2:3:4") do echo%%i	
