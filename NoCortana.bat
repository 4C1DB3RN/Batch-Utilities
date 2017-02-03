@ECHO OFF
SET TTL=TITLE if3xist's Cortana Disabling Utility -
SET BRD=ECHO ##########################################
SET CDIR=%SYSTEMROOT%\SystemApps\
SET COR=Microsoft.Windows.Cortana_*
COLOR f0

:MENU
CLS
%TTL% Menu
ECHO.
%BRD%
ECHO Welcome to if3xist's Cortana Disabling Utility!
%BRD%
%BRD%
ECHO This tool was made to help turn off the creepy Cortana feature on Windows 10.
ECHO You MUST run this file as an Administrator otherwise it will not work!
ECHO Keep in mind that this tool CANNOT revert this change. Be sure of your choice!
%BRD%
ECHO.
ECHO Do you wish to disable Cortana on your computer? [y/n] 

SET /P CHOICE=
IF /I %CHOICE%==y GOTO :DISABLE
IF /I %CHOICE%==N GOTO :CLOSE
GOTO :MENU

:DISABLE
%TTL% Disabling Cortana...
CLS
IF EXIST "%CDIR%%COR%" (
%BRD%
ECHO Now attempting to disable Cortana...
%BRD%
%BRD%
ECHO Killing processes associated with Cortana...
TASKKILL /F /IM Search*
TASKKILL /F /IM backgroundTaskHost*
%BRD%
ECHO Disabling Cortana now...
MOVE %CDIR%%COR% %CDIR%CORTANA.DISABLED.if3xist
IF NOT ERRORLEVEL 1 (GOTO :SUCCESS) ELSE (GOTO :FAILURE)

) ELSE (GOTO :NOCOR)

:SUCCESS
%TTL% Success!
%BRD%
%BRD%
ECHO Cortana has been successfully disabled!
%BRD%
ECHO.
PAUSE
GOTO :ABOUT

:FAILURE
%TTL% Something went wrong!
%BRD%
%BRD%
ECHO Something seems to have gone wrong! Make sure you run this script as an Administrator!
ECHO Please contact me at mf666@protonmail.ch with any questions.
%BRD%
ECHO.
PAUSE
GOTO :CLOSE

:NOCOR
%TTL% Something went wrong!
CLS
%BRD%
ECHO Hmm... We can't seem to find Cortana on this machine...
%BRD%
ECHO.
PAUSE
EXIT

:ABOUT
%TTL% About
CLS
ECHO.
%BRD%
ECHO About This Tool
%BRD%
%BRD%
ECHO I made this script to help others delete Cortana. Windows 10 is filled with privacy violations and I believe that we need more scripts and programs to help combat this. That is what led me to write this.
ECHO Feel free to contact me with any questions, concerns, or suggestions at mf666@protonmail.ch
%BRD%
ECHO.
PAUSE

:CLOSE
%TTL% Good bye! :)
ECHO.
ECHO Good Bye!
PING -n 3 LOCALHOST > NUL
EXIT
