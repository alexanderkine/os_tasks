@echo off

::set a = %1
setlocal
set a=%1
for %%i in ("%path:;=" "%") do (
	for %%j in ("%pathext:;=" "%") do (
		if exist %%~i/%a%%%~j ( 
			echo %%~i/%a%%%~j
			goto :eof
		)
	)
)
echo can't find
endlocal