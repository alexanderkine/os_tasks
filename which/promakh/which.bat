@echo off
setlocal enabledelayedexpansion

if "%1"=="/?" (
	echo This command display the path to command file
	goto :eof
)

if "%1"=="" (
	echo Try input an argument
	goto :eof
)

set NewPATHEXT=
if "%~x1" neq "" (
	for %%i in (%PATHEXT%) do (
		for /f %%j in ('echo %%i^|findstr /i /x %~x1') do (
			if not "%%j"=="" set NewPATHEXT=%%j	
		)
	)
)
if not "%NewPATHEXT%"=="" set PATHEXT=%NewPATHEXT%

set success=
for %%i in (%PATHEXT%) do (
	for %%j in ("%Path:;=" "%") do (
		set p=%%~j\
		set p=!p:\\=\!
		set filename=%1
		if "%NewPATHEXT%"=="" set filename=!filename!%%i
		set dr=!p!!filename!
		if exist !dr! (
			echo !dr!
			set success=1
		)
	)
)

if "%success%"=="" (
	echo Command doesn't exist
)
endlocal

REM davletshina.sofya@yandex.ru

