@echo off


set a=%1
if "%a%"=="/?" (
	echo return way for file or tell that way don't exist
	goto :eof
)

set a=%1

if "%~x1" neq "" (
	for %%i in ("%path:;=" "%") do (
		if exist %%~i/%a% (    
			echo %%~i/%a%
			goto :eof
		)
	)
::	goto :eof
)

for %%i in ("%path:;=" "%") do (
	for %%j in ("%pathext:;=" "%") do (
		if exist %%~i/%a%%%~j ( 
			echo %%~i/%a%%%~j
			goto :eof
		)
	)
)
echo can't find %a%
