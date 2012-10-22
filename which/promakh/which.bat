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

for %%i in (%PATHEXT%) do (
	for %%j in (%Path%) do (
		set dr=%%j\
		set dr=!dr:\\=\!
		set dr=!dr!%1.%%i
		set dr=!dr:..=.!
		::echo !dr!%~n1%%i
		if exist !dr! (
			echo !dr!
			goto :eof
		)
	)
)
echo Command doesn't exist
endlocal

::davletshina.sofya@yandex.ru