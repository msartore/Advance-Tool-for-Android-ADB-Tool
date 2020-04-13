@echo off
:adbinstall
powershell -command "& { iwr https://dl.google.com/android/repository/platform-tools-latest-windows.zip -OutFile adb.zip }"
cscript //B j_unzip.vbs adb.zip
set main="%cd%"
cd platform-tools
move "adb.exe" %main%
move "fastboot.exe" %main%
move "AdbWinApi.dll" %main%
move "AdbWinUsbApi.dll" %main%
cd %main%
rmdir /Q /S "platform-tools"
del adb.zip