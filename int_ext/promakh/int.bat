@echo off
setlocal enabledelayedexpansion
if "%1"=="/?" (
	echo This command display the list of internal and external commands
	goto :eof
)

for /f %%k in ('help ^| findstr /r /c:"^[A-Z]"') do (
	set Path=
	%%k /? >nul 2>nul
	if not errorlevel 1 (
		echo %%k - internal command
	)
	ver > nul rem сбрасываем errorlevel на 0
)
endlocal
