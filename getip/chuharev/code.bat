@echo off

:tadam
if "%1" neq "" (
if "%1" neq "/?" (
	shift
	goto :tadam
)
if "%1"=="/?" (
	echo return IPv4-adres
	goto :eof
)
)


for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /B /C:"   IPv4"') do (
	echo%%i	
	for /f %%j in ("%%i") do (
		echo %%j
	)
)