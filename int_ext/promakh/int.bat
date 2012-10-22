@echo off
setlocal enabledelayedexpansion
if "%1"=="/?" (
	echo This command display the list of internal and external commands
	goto :eof
)

for /f %%k in ('help ^| findstr /r /c:"^[A-Z]"') do (
	for %%i in (%PATHEXT%) do (
		for %%j in (%Path%) do (
			set dr=%%j\
			set dr=!dr:\\=\!
			if not exist !dr!%%k%%i (
				echo %%k - internal commands
			)
		)
	)
)
endlocal
