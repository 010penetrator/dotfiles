@echo off
:: You may add this file to HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor/AutoRun
SET HOMEDRIVE=%SYSTEMDRIVE%
SET HOMEPATH="\Users\%USERNAME%"
::SET HOMEPATH="\cmd"
SET HOMESHARE="X:\"
::SET HOME=%SYSTEMDRIVE%\Documents and Settings\%USERNAME%
SET HOME=%USERPROFILE%
::SET TEMP=%HOME%\Local Settings\Temp
::SET TMP="%TEMP%"
SET PATH=%PATH%;C:\exe\nvim-win64\bin;"c:\program files\cmake\bin"
set git=c:\compy
set sh=%GIT%\dotfiles\sh
set loc=c:\cmd

%HOMEDRIVE%
cd %HOMEPATH%
