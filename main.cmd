@echo off
chcp 65001>nul

net session>nul 2>nul
if %errorLevel% GEQ 1 goto :startAsAdmin

%~d0
cd "%~dp0"

set foldersDB=fileSystemTree-folders.db
set filesDB=fileSystemTree-files.db
set searchResults=searchResults.db
cls





call :logo
echo.^(i^) Scanning...
echo.^(^!^) Please wait^!

start /d "%~dp0" /b cmd /q /c scanner.cmd d %foldersDB%
start /d "%~dp0" /b /wait cmd /q /c scanner.cmd -d %filesDB%

echo.^(i^) Scan completed^!

set /p keyWord=Type for search ^> 

echo.^(i^) Search started.

echo.>%searchResults%
for /f "delims=" %%i in (%foldersDB%) do echo.%%i | find /i>>%searchResults%
for /f "delims=" %%i in (%filesDB%) do echo.%%i | find /i>>%searchResults%

echo.^(^!^) Search completed^!

pause>nul
exit





:logo
title [ADSI] The Fastest Search
color 0b
cls
echo.
echo.    [ADSI] ==^> The Fastest Search
echo.
echo.
exit /b





:startAsAdmin
echo.Please, run as Admin!
>nul timeout /nobreak /t 3
exit