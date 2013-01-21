@echo off
if "%1"=="/?" (
	echo return IPv4-adress
	goto :eof
)

for /f "tokens=2 delims=:" %%i in ('echo 1:2:3') do (echo %%i)	