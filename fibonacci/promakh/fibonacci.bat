@echo off  
setlocal
set a=1
set b=1

if "%1"=="/?" (
	echo Calculation fibonacci number by position number
	goto :eof
)

for /f %%i in ('echo %1^|findstr "[^0-9]"') do (
	echo not a number 1>&2
	exit /b 5
)

if %1 lss 1 (
	echo can not tell
	goto :eof
)

if %1 lss 3 (
	echo 1
	goto :eof
)

if %1 gtr 46 (
	echo too big
	goto :eof
)
 
set i=2

:calc
set /a x=%a%+%b%
set a=%b%
set b=%x%
set /a i=%i%+1
if "%i%"=="%1" (
	echo %b%
) else (
	goto :calc
) 

endlocal