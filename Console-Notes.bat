@ECHO off
color 02
:menu
TITLE CTEU * Welcome Screen [Beta]
cd "%userprofile%\Desktop"
SET TMPfile=%temp%\%username%.tmp
SET BORDER=ECHO -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
SET n=ECHO.
SET SIO=SHELL MODE
SET SHELL=0
CLS
%BORDER%
ECHO Crispy Text Editing Utility [UPDATED: 8/16]!
%n%
%n%
ECHO This is a tool thats used for editing text and recording console sessions.
ECHO It was scripted years ago and then updated a few years later out of boredom.
%n%
ECHO You can access console mode by typing '1' here then typeing '#$' in the editor.
ECHO You can use almost all commands, but its hard to get variables working. :(
%BORDER%
%n%
%n%
ECHO [MENU]
ECHO 1.Text Editor - Opens any unsaved work automatically & %n%
ECHO 2.Open a File - Opens a prEXISTing file & %n%
ECHO 3.About - About this project and its author & %n%
ECHO 4.Exit & %n% & %n% & %n%
set MENUinput=
set/p MENUinput=Enter a Number: 
IF not defined MENUinput GOTO menu
IF "%MENUinput%"=="1" GOTO editor
IF "%MENUinput%"=="2" GOTO open
IF "%MENUinput%"=="3" GOTO about
IF "%MENUinput%"=="4" exit
GOTO menu

:viewfile
CLS
%BORDER%
%n%
IF EXIST "%TMPfile%" Type "%TMPfile%" & %n%
IF not EXIST "%TMPfile%" @ECHO off > "%TMPfile%"
%BORDER%
%RETURN%


:editor
CLS
TITLE CTEU * Text Editor - %TMPfile% [Beta]
set RETURN=GOTO editor2
GOTO viewfile
:editor2
IF %shell%==1 TITLE CTEU * Text Editor - Shell Mode - %TMPfile% [Beta]
ECHO   [~!] SAVE/QUIT - [!@] DEL - [#$] %SIO% - [$$] HELP
%BORDER%
%n%
set EDITinput=
IF %shell%==0 set/p EDITinput=
IF %shell%==1 set/p EDITinput=[%username%@%cd%~]# 

IF "%EDITinput%"==" " GOTO editor
IF "%EDITinput%"=="&" GOTO editor
IF "%EDITinput%"==" &" GOTO editor

IF "%EDITinput%"=="~!" GOTO DONEedit
IF "%EDITinput%"=="!@" GOTO DEL

IF "%EDITinput%"=="#$" (

IF %SHELL%==0 (
SET SIO=EXIT SHELL
set SHELL=1
GOTO editor
)

IF %SHELL%==1 (
SET SIO=SHELL MODE
set SHELL=0
GOTO editor
)

)

IF "%EDITinput%"=="$$" GOTO editorhelp

IF not defined EDITinput (
%n% >> %TMPfile%
GOTO editor
)

IF %shell%==0 ECHO %EDITinput% >> %TMPfile%
IF %shell%==1 %EDITinput% >> %TMPfile% & %n%
GOTO editor

:editorhelp
CLS
TITLE CTEU * Text Editor - Help [Beta]
set RETURN=GOTO edithelp
GOTO viewfile


:edithelp
ECHO Type your input below and hit enter after each line.
ECHO IF you wish to run a command and spit the output out into
ECHO the file just type "#$" then a prompt will appear under
ECHO file display, where text input is normally located.
%n%
ECHO Press any key to continue...
%BORDER%
PAUSE>NUL
GOTO editor

:DONEedit
CLS
TITLE CTEU * Text Editor - Save - %TMPfile% [Beta]
set choice=
ECHO Type 'f' and hit enter to see example file names.
ECHO Type 'g' to go back to the last page.
ECHO File will save to desktop.
%n%
set/p choice=What would you like to name this file? (Include file extension!): 
IF "%choice%"=="f" (
CLS
ECHO Some examples of usable file types are .bat , .txt
%n%
ECHO You can use whatever file extension you wish.
%n%
PAUSE
GOTO DONEedit
)
IF "%choice%"=="g" GOTO editor
CLS
%BORDER%
%n%
move "%TMPfile%" "%cd%\%choice%"
%n%
%BORDER%
%n%
%n%
PAUSE
GOTO menu


:open
CLS
TITLE CTEU * Open File [Beta]
dir
%n%
ECHO Type the file name and extension...
set TMPfile=
set/p TMPfile=
IF not defined TMPfile GOTO open
GOTO editor

:DEL
CLS
TITLE CTEU * Text Editor - Delete [Beta]
set R=
set/p R=Are you sure? y or n: 

IF "%r%"=="y" (
IF EXIST %TMPfile% del %TMPfile%
GOTO menu
)

IF "%r%"=="n" GOTO editor
GOTO DEL


:about
CLS
TITLE CTEU * About [Beta]
%BORDER%
ECHO Crispy Text Editing Utility [UPDATED: 8/16]!
%n%
%n%
ECHO This is a text editor/console logger scripted in BATCH. 
ECHO You can execute commands and record their outputs automatically.
ECHO I made the original a few years ago and decided to take a little time
ECHO perfecting the sript which has been tested thoroughly on a WIN 7 computer.
%n%
ECHO Theoretically IF you use this script on any admin priv act you can quickly
ECHO gather all the information you need about it running a few simple commands.
%n%
ECHO Please email me with any questions or concerns @ mf666@protonmail.ch
%BORDER%
%n%
PAUSE
GOTO menu