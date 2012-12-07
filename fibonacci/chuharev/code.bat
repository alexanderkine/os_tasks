@echo off  

set /a a=1+0
set /a b=1+0

if "%1" equ "/?" (
	echo It is help for this program
	goto :eof
)

::echo %1>forCode.txt
for /f %%i in ('echo %1^|findstr "[^0-9]"') do (
	echo not a number 1>&2
	exit /b 5
)

if %1 lss 1 (
	echo can not tell
	exit /b 4
)

if %1 lss 3 (
	echo 1
	goto :eof
)
 
set /a i=2

:begin

set /a x=%a%+%b%
set /a a=%b%+0
set /a b=%x%
set /a i=%i%+1
if "%i%" equ "%1" (
	echo %b%
) else (
	goto :begin
) 
::CHUKHAREV KN 101