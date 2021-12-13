@echo off
my_sdk\ml.exe /c %1.asm
my_sdk\rc.exe %1.rc 
my_sdk\rc.exe %2.rc
my_sdk\link.exe /DEFAULTLIB:my_sdk\kernel32.lib /DEFAULTLIB:my_sdk\user32.lib /DEFAULTLIB:my_sdk\gdi32.lib /DEFAULTLIB:my_sdk\masm32.lib /DEFAULTLIB:my_sdk\shlwapi.lib /SUBSYSTEM:WINDOWS %1.obj %1.res %2.res
if exist %1.obj del %1.obj
dir %1.*
pause