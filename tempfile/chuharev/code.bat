@echo off
setlocal 
set a=%1
if "%1"=="/?" (
	echo create new file
	goto :eof
)
if exist %1 (
	cd %1
	for /l %%i in (1 1 100000) do (
		if not exist %%i.txt (
			type nul > %%i.txt
			goto :eof
		)
	)
) else (
	mkdir %1
	::echo %1
	cd %1
	type nul > 1.txt
)
endlocal
::type nul >%a%