@Echo Off & Color 17

if Exist "%SystemRoot%\SysWOW64" Path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
                
Bcdedit > Nul

If '%errorlevel%' NEQ '0' (Goto UACPrompt) Else (Goto UACAdmin)

:UACPrompt
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close) & Exit
Exit /B

:UACAdmin
Cd /D "%~dp0"

Echo Current Path: "%Cd%"
Echo You are getting admin privileges.

:: Please insert your script...

Echo.>> Uninstall.log
Echo ++++++++++ %DATE% %TIME% ++++++++++ >> Uninstall.log

:: If the bat file isn't on current drive, should [Cd] to current drive letter.
%~d0 & Echo Current Drive: "%~d0" >> Uninstall.log

Cd %~dp0 & Echo Uninstall Path: "%Cd%" >> Install.log

:: If you added path "%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\" or "%SystemRoot%\Microsoft.NET\Framework64\v4.0.30319\"
InstallUtil /U KeLi.HelloWindowService.App.exe >> Uninstall.log