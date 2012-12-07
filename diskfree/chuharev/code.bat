@echo off

if "%1" equ "/?" (
	echo It is help for this program
	goto :eof
)

if "%1" neq "" goto :pichal

for /f "tokens=2 delims==" %%i in ('set SystemDrive') do (
	set a=
	for /f "tokens=3" %%j in ('dir %%i') do (
		set a=%%j
	)
)
echo %a%
goto :eof

:pichal

set a=

if not exist %1 (
	echo Tadam
	goto :eof
)

for /f "tokens=3" %%i in ('dir %1') do (
	set a=%%i
)

echo %a%
::CHUKHAREV KN 101