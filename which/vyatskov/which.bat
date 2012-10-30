@echo off 
setlocal

if "%1"=="/?" echo Locates a program file, including aliases and paths. & goto :eof

if "%1"=="" echo Programm is not specified! & goto :eof

set _path="%path:;=\" "%\" "%cd%\"
set _path=%_path:\\=\%
set _pathext=%pathext:;= %

for %%d in (%_path%) do if exist %%d (
	for /f %%f in ('dir %%d /b /a-d 2^>nul ^| findstr /i /r /e "%_pathext%"') do (
		 if "%%~nf"=="%1" echo %%~d%%f
		 if "%%f"=="%1" echo %%~d%%f
	)
)

endlocal