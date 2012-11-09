@echo off
setlocal enabledelayedexpansion
if "%1"=="/?" (
	echo This command display the list of internal and external commands
	goto :eof
)

for /f %%k in ('help ^| findstr /r /c:"^[A-Z]"') do (
	for %%i in (%Pathext%) do (
		for %%j in (%Path%) do (
			set dr=%%j\
			set dr=!dr:\\=\!
			::echo !dr!%%k%%i
			if exist !dr!%%k%%i (
				echo %%k - external commands
			)
		)
	)
)
endlocal


