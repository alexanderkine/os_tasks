@echo off

setlocal

if "%1"=="/?" echo Shows all IPs of current machine & goto :eof

for /f "tokens=14" %%i in ('ipconfig ^| findstr /b /c:"   IPv4"') do (
	echo %%i
)

endlocal