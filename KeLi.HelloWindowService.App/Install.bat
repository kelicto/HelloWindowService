@echo off & color 17

if exist "%systemroot%\SysWOW64" path %path%;%windir%\SysNative;%systemroot%\SysWOW64;%~dp0
                
bcdedit > nul

if '%errorlevel%' neq '0' (goto UACPrompt) else (goto UACAdmin)

:UACPrompt
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close) & exit
exit /b

:UACAdmin
cd /d "%~dp0"

echo Current Path: "%cd%"
echo You are getting admin privileges.

:: Please insert your script...

echo.>> Install.log
echo ++++++++++ %date% %time% ++++++++++ >> Install.log

:: If the bat file isn't on current drive, should [cd] to current drive letter.
%~d0 & echo Current Drive: "%~d0" >> Install.log

cd %~dp0 & echo Install Path: "%cd%" >> Install.log

:: If you added path "%systemroot%\Microsoft.NET\Framework\v4.0.30319\" or "%systemroot%\Microsoft.NET\Framework64\v4.0.30319\"
installutil KeLi.HelloWindowService.App.exe >> Install.log

net start TestService >> Install.log
sc config TestService start = auto >> Install.log