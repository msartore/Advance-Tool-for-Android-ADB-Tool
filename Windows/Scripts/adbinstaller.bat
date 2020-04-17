Rem Tool made by Sway 
Rem github repository: https://github.com/MassimilianoSartore/Advance-Tool-for-Android-ADB-Tool-
Rem twitter: https://twitter.com/SWayWasTaken
Rem email: massimiliano.sartore@protonmail.com
Rem Copyright (C) 2019-2020 SwayWasTaken

@echo off
:adbinstall
taskkill /f /im adb.exe 2>nul
set main="%cd%"
cd platform-tools
move "fastboot.exe" %main%
cd %main%
rmdir /Q /S "platform-tools"
del adb.zip
pause