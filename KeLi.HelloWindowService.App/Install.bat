@Echo Off & Color 17

if Exist "%SystemRoot%\SysWOW64" Path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
                
Bcdedit > Nul

If '%errorlevel%' NEQ '0' (Goto UACPrompt) Else (Goto UACAdmin)

:UACPrompt
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close) & Exit
Exit /B

:UACAdmin
Cd /D "%~dp0"

Echo Current Path: "%CD%"
Echo You are getting admin privileges.

:: Please insert your script...

Echo.>> Install.log
Echo ++++++++++ %DATE% %TIME% ++++++++++ >> Install.log

:: If the bat file isn't on current drive, should [Cd] to current drive letter.
%~D0 & Echo Current Drive: "%~D0" >> Install.log

Cd %~DP0 & Echo Install Path: "%CD%" >> Install.log

%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\InstallUtil.exe KeLi.HelloWindowService.App.exe >> Install.log
Net Start TestService >> Install.log
Sc Config TestService Start = Auto >> Install.log