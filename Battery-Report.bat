::This file detects which version of windows you are running
::and dynamically chooses the appropriate way to view battery
::and energy related information.
::
::It then automatically deletes any files it generated and exits.
::
::Scripted by if3xist for github & HackForums
::Contact me @ mf666@protonmail.ch

@echo off
%systemdrive%
cd %temp%
set TTL=title Battery Report Generator -
set EXMS=echo Exiting...
%TTL% Checking Windows Version

echo Checking Windows version...
setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
set VRMS=echo Windows version %version% detected!
if "%version%" == "10.0" %TTL% Windows 10 & %VRMS% & goto :8PLUS
if "%version%" == "6.3" %TTL% Windows 8.1 & %VRMS% & goto :8PLUS
if "%version%" == "6.2" %TTL% Windows 8 & %VRMS% & goto :8PLUS
if "%version%" == "6.1" %TTL% Windows 7 & %VRMS% & goto :SEVEN
endlocal

goto :ERROR1

:ERROR
%TTL% He's dead Jim...
echo. & echo ====SOMETHING SEEMS TO HAVE GONE WRONG!====
echo Try running this script as an administrator!
pause
%EXMS%
ping localhost > nul
exit

:ERROR1
%TTL% Incompadible Windows version...
echo. & echo This script only supports Windows version 6.1 (7) - 10.0...
echo Your version is:
ver
pause
%EXMS%
ping localhost > nul
exit

:8PLUS
if exist "%temp%\Battery-Report.html" del /f /q Battery-Report.html
echo Generating battery report...
powercfg /batteryreport
if exist "Battery-Report.html" start /wait Battery-Report.html else goto :ERROR
echo Waiting...
ping localhost > nul
echo Deleting temp files...
del /f /q Battery-Report.html
%EXMS%
exit

:SEVEN
if exist "%temp%\Battery-Report.html" del /f /q Battery-Report.html
echo Building energy report...
powercfg /energy
if exist "energy-report.html" start /wait energy-report.html else goto :ERROR
echo Waiting...
ping localhost > nul
echo Deleting temp files...
del /f /q energy-report.html
%EXMS%
exit
