::Detects which version of windows you are running and dynamically chooses 
::the appropriate way to view battery/energy related information.

@echo off
:: Establishing Context
%systemdrive%
cd %temp%

:: Title Command
set TTL=title Battery Report Generator -

:: Wait Command
set WAIT=ping localhost -n 1 > nul

:: Force Delete Command
set FD=del /f /q

:: Powercfg Message Command
set PWMG=echo Running powercfg...

:: Deleting Message Command
set DLMG=echo Deleting temp files...

:: Exit Message Command
set EXMS=echo Good Bye :)

:: Battery Report File
set BTRP=Battery-Report.html

:: Energy Report File
set ENRP=energy-report.html

%TTL% Checking Windows Version

echo Checking Windows version
setlocal

:: Get Version
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j

:: Version Message Command
set VRMS=echo Windows version %version% detected!
if "%version%" == "10.0" %TTL% Windows 10  & %VRMS% & goto :8PLUS
if "%version%" == "6.3"  %TTL% Windows 8.1 & %VRMS% & goto :8PLUS
if "%version%" == "6.2"  %TTL% Windows 8   & %VRMS% & goto :8PLUS
if "%version%" == "6.1"  %TTL% Windows 7   & %VRMS% & goto :SEVEN
endlocal

:: Windows version isn't supported error
:NOTSUPPORTED
%TTL% Incompadible Windows version...
echo. & echo This script only supports Windows version 6.1 (7) - 10.0...
echo Your version is:
ver
pause
%EXMS%
%WAIT%
exit

:: General Error
:ERROR
%TTL% He's dead Jim...
echo. & echo ====SOMETHING SEEMS TO HAVE GONE WRONG!====
echo Try running this script as an administrator!
pause
%EXMS%
%WAIT%
exit

:: Version 8 or higher will be directed here
:8PLUS
if exist "%temp%\%BTRP%" %FD% %BTRP%
%PWMG%
powercfg /batteryreport
if exist "%BTRP%" start /wait %BTRP% else goto :ERROR
%WAIT%
%DLMS%
%FD% %BTRP%
%EXMS%
exit

:: Version 7 will be directed here
:SEVEN
if exist "%temp%\%ENRP%" %FD% %ENRP%
%PWMG%
powercfg /energy
if exist "%ENRP%" start /wait %ENRP% else goto :ERROR
%WAIT%
%DLMS%
%FD% %ENRP%
%EXMS%
exit
