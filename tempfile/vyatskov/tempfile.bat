@echo off
setlocal

if "%1"=="/?" echo Creates file within specified directory & goto :eof

if "%1"=="" echo Folder is not specified! & goto :eof

set x=%1
set x=%x:^=^^%
echo %x%

if not exist "%x%" echo Folder is wrong! & goto :eof

set _dir=%x%

echo %_dir%

cd %x% >nul 2>nul || (echo Folder is wrong & goto :eof)
cd ..

if not exist "%_dir%temp.temp" echo | set /p dump=>"%_dir%temp.temp" & goto :eof

set cntr=1
:LOOP
if exist "%_dir%temp%cntr%.temp" set /a cntr=%cntr%+1 & goto :LOOP

echo 2>nul | set dumb=>"%_dir%temp%cntr%.temp"

endlocal