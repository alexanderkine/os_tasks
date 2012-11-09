@echo off
setlocal enabledelayedexpansion
if "%1"=="/?" (
	echo This command display the path to command file
	goto :eof
)

::error catch
if "%1"=="" (
	echo Try input an argument
	goto :eof
) 

if "%~x1" neq "" (
	set PATHEXT=%~x1
)

for %%i in (%PATHEXT%) do (
	for %%j in (%Path%) do (
		set filename=%~n1
		set dr=%%j\!filename!%%i
		if exist !dr! (
			echo !dr!
			goto :eof
		)
	)
)
echo Command doesn't exist
endlocal

::davletshina.sofya@yandex.ru

REM for %%i in ("%path:;=" "%") do (
		REM if exist %%~i/%a% (    
			REM echo %%~i/%a%
			REM goto :eof
		REM )
	REM )

