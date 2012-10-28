@echo off
setlocal enabledelayedexpansion
if "%1"=="/?" (
	echo This command display the list of internal and external commands
	goto :eof
)

for /f %%k in ('help ^| findstr /r /c:"^[A-Z]"') do (
	set external=0
	for %%i in (%PATHEXT%) do (	
		for %%j in (%Path%) do (
			set dr=%%j\
			set dr=!dr:\\=\!
			if exist !dr!%%k%%i (
				set external=1
			)
		)
	)
	if not !external!==1 (
		echo %%k - internal command
	)
)
endlocal
