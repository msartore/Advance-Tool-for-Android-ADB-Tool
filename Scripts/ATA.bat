MODE 150
@echo off
TITLE ATA Tool by Sway
color 07
call "Banners/banner1.bat"
echo. 
echo Log:
echo.
if exist settings.ini (
    goto :prelaunch
) else (
    echo a >> settings.ini
)

:prelaunch
for /f %%a in (settings.ini) do (
if %%a==417070726f766564 (
goto :adblaunch
) else (
goto :disclaimer
)
)

:infodevice
echo [  OK  ] Device found!
for /f "delims=" %%v in ('adb shell getprop ro.build.user') do set "ro_build_user=%%v"
echo [  OK  ] ro.build.use loaded!
for /f "delims=" %%v in ('adb shell getprop ro.product.cpu.abilist') do set "ro_product_cpu_abilist=%%v"
echo [  OK  ] ro.product.cpu.abilist loaded!
for /f "delims=" %%v in ('adb shell getprop ro.product.manufacturer') do set "ro_product_manufacturer=%%v"
echo [  OK  ] ro.product.manufacturer loaded!
for /f "delims=" %%v in ('adb shell getprop ro.product.model') do set "ro_product_model=%%v"
echo [  OK  ] ro.product.model loaded! 
for /f "delims=" %%v in ('adb shell getprop ro.product.board') do set "ro_product_board=%%v"
echo [  OK  ] ro.product.board loaded!
for /f "delims=" %%v in ('adb shell getprop ro.product.device') do set "ro_product_device=%%v"
echo [  OK  ] ro.product.device loaded!
for /f "delims=" %%v in ('adb shell getprop ro.build.version.release') do set "ro_android_version=%%v"
echo [  OK  ] ro.build.version.release loaded!
goto :menu 

:notsuccess
cls
call "Banners/banner1.bat"
echo.
echo Log:
echo.
echo [FAILED] ADB launch failed!
echo [FAILED] Device not found!
echo [FAILED] ro.build.use loaded!
timeout /T 2>nul
echo [FAILED] ro.product.cpu.abilist loaded!
timeout /T 2>nul
echo [FAILED] ro.product.manufacturer loaded!
timeout /T 2>nul
echo [FAILED] ro.product.model loaded! 
timeout /T 2>nul
echo [FAILED] ro.product.board loaded!
timeout /T 2>nul
echo [FAILED] ro.product.device loaded!
timeout /T 2>nul
echo [FAILED] ro.build.version.release loaded!
timeout /T 2>nul
echo Booting into Bootloader menu
goto :devicenotfound

:adblaunch
echo ADB launch...
fastboot devices >nul
adb devices >nul
goto :devicecheck
 
:devicecheck
cls
call "Banners/banner1.bat"
color 07
echo Checking if the device is connected...
for /f "delims=" %%v in ('adb shell getprop ro.build.version.release') do set "version=%%v"
if /I "%version%" GEQ "1" (
    goto :infodevice
) else ( 
    goto :notsuccess
    pause
)

:devicenotfound
cls
call "Banners/banner1.bat"
echo ==========================================================================
echo DEVICE NOT FOUND!
echo try to reconnect the device or enable the usb debugging in your settings
echo after that press enter
echo ==========================================================================
echo fastboot mode (Y/N) 
SET inputd=0
SET /P inputdnt=Please Select:
if %inputdnt%==Y goto :menubootloader
if %inputdnt%==y goto :menubootloader
if %inputdnt%==N pause && cls && goto :devicecheck
if %inputdnt%==n pause && cls && goto :devicecheck
echo Error, Wrong input!
pause
cls 
goto :devicecheck

:disclaimer
cls
call "Banners/banner1.bat"
echo *** Disclaimer ***
echo I am not responsible for any damage YOU will do to your device
echo You have been warned, Do you accept? (Y/N)
echo.
SET inputd=0
SET /P inputd=Please Select:
echo.
echo log:
if %inputd%==Y SET inputd=417070726f766564 
if %inputd%==y SET inputd=417070726f766564 
if %inputd%==N set inputd=6e6f7420617070726f766564
if %inputd%==n set inputd=6e6f7420617070726f766564
echo %inputd% > settings.ini
if %inputd%==417070726f766564 goto :prelaunch
if %inputd%==6e6f7420617070726f766564 exit
echo Error, Wrong input!
pause
cls
goto :disclaimer


:menu
cls
color 07
call "Banners/banner2.bat"
echo ==========================================================================
echo DEVICE INFO
echo ==========================================================================
echo Rom builder name: %ro_build_user%     Board: %ro_product_board%     Android Version: %ro_android_version%
echo.
echo Manufacturer: %ro_product_manufacturer%     Model: %ro_product_model%     Device Product: %ro_product_device%
echo.
echo Compitable Apk file: %ro_product_cpu_abilist% 
echo ==========================================================================
echo MAIN MENU
echo ==========================================================================
echo 1.  Fastboot/Bootloader Commands
echo.
echo 2.  Recovery Commands (Sideload)
echo.
echo 3.  System Commands
echo.
echo 4.  Stream your SMARTPHONE
echo.
echo 5.  Create your own program!
echo.
echo 6.  Credits
echo ==========================================================================
echo 0) EXIT
echo ==========================================================================

SET /P inputmm=Please Select:

if %inputmm%==1 goto menubootloader
if %inputmm%==2 goto menurecovery
if %inputmm%==3 goto menusystem
if %inputmm%==4 call "scrcpy"
if %inputmm%==5 goto creator
if %inputmm%==6 goto credits
if %inputmm% gtr 4 echo. && echo. && echo log: && echo Error! this section doesn't exist. 
if %inputmm%==0 goto :exitstatus
pause
goto :menu


:menubootloader
cls
call "Banners/banner1.bat"
echo ==========================================================================
echo BOOTLOADER/FASTBOOT MENU
echo ==========================================================================
echo What do you want to do?
echo.
echo 1) UNLOCK/LOCK BOOTLOADER 
echo 2) FORMAT DATA PARTITION (EXT4)
echo 3) FORMAT DATA PARTITION (F2FS)
echo 4) FLASH RECOVERY (only .img file)
echo 5) FLASH KERNEL (only .img file)
echo 6) FLASH ROM (You must know what you are doing)
echo 7) Check connected devices
echo 8) Boot into ROM
echo 9) Boot into recovery
echo 10) Factory reset
echo ==========================================================================
echo 0) EXIT
echo ==========================================================================
echo.
SET /P inputmb=Please Select:

if %inputmb%==0 goto :devicecheck

if %inputmb%==1 goto :menubootloaderunlock

if %inputmb%==2 fastboot format:ext4 userdata

if %inputmb%==3 fastboot format:f2fs userdata

if %inputmb%==4 SET /P recovery=Write recovery name like (recoveryname.img) && fastboot flash recovery %recovery%

if %inputmb%==5 SET /P kernel=Write kernel name like (kernelname.img) && fastboot flash boot %kernel%

if %inputmb%==6 SET /P rom=Write rom path like (/path/to/your/Rom.zip) && fastboot -w && fastboot update %rom%

if %inputmb%==7 fastboot devices

if %inputmb%==8 echo Loading. && echo Loading.. && fastboot reboot >nul && echo Loading... && goto :menubootloader

if %inputmb%==9 echo Loading. && echo Loading.. && fastboot reboot recovery >nul && echo Loading... && goto :menurecovery

if %inputmb%==10 echo Erasing process started && fastboot format userdata && fastboot format cache && echo Erasing process finished!
pause
goto menubootloader

:menubootloaderunlock
cls
call "Banners/banner1.bat"
echo ==========================================================================
echo BOOTLOADER UNLOCK/LOCK MENU
echo ==========================================================================
echo What do you want to do? (To use all commands below you have to boot in bootloader mode)
echo.
echo 1) UNLOCK BOOTLOADER for older devices (2014 and earlier) (not all device supported)
echo 2) UNLOCK BOOTLOADER For newer devices (2015 and later) (not all device supported)
echo 3) LOCK BOOTLOADER For older devices (2014 and earlier) (not all device supported)
echo 4) LOCK BOOTLOADER For newer devices (2015 and later) (not all device supported)
echo 5) GET BOOTLOADER INFO 
echo 6) UNLOCK BOOTLOADER for device that have an unlock.bin to flash (Put it inside the folder before start the command)
echo 7) Device ID
echo 8) Oem unlock data (for Motorola devices)
echo 9) UNLOCK BOOTLOADER FOR MOTOROLA DEVICES (I MUST HAVE YOUR OEM UNLOCK CODE)
echo ==========================================================================
echo 0) EXIT
echo ==========================================================================
echo.
SET /P inputmbul=Please Select:
echo log:
if %inputmbul%==0 goto :menubootloader

if %inputmbul%==1 fastboot oem device-info && echo Oem unlocking.. && fastboot oem unlock && echo Getting var unlock state.. && fastboot getvar unlocked

if %inputmbul%==2 fastboot oem device-info && echo Oem unlocking.. && fastboot flashing unlock && echo Getting var unlock state.. && fastboot getvar unlocked

if %inputmbul%==3 fastboot oem device-info && echo Oem locking.. && fastboot oem lock && echo Getting var unlock state.. && fastboot getvar unlocked

if %inputmbul%==4 fastboot oem device-info && echo Oem locking.. && fastboot flashing lock && echo Getting var unlock state.. && fastboot getvar unlocked

if %inputmbul%==5 fastboot getvar all 

if %inputmbul%==6 fastboot flash unlock unlock.bin && fastboot reboot && echo Done! && echo. && echo Rebooting!

if %inputmbul%==7 fastboot oem device-id

if %inputmbul%==8 fastboot oem get_unlock_data

if %inputmbul%==9 SET /P oemcode=Paste the code here && fastboot oem unlock %oemcode% && echo Done && echo Rebooting!
pause
goto menubootloaderunlock

:menusystem
cls
call "Banners/banner1.bat"
echo ==========================================================================
echo SYSTEM MENU
echo ==========================================================================
echo What do you want to do?
echo.
echo 1) REBOOT SMARTPHONE
echo 2) REBOOT INTO THE RECOVERY
echo 3) REBOOT INTO THE Fastboot/Bootloader
echo 4) Check connected devices
echo 5) Check devices version connected
echo 6) Install an app
echo 7) Unistall an app (No System App)
echo 8) Emulate device (Resize Screen)
echo 9) Emulate device (Change Density)
echo 10) Reset (Emulate device)
echo 11) Change system info 
echo 12) Screen Recording 
echo 13) SMARTPHONE Status
echo 14) Unistall System App/Bloat 
echo 15) Grant root permissions (App)
echo 16) Interface
echo ==========================================================================
echo 0) EXIT
echo ==========================================================================
echo.
SET /P inputms=Please Select:

if %inputms%==0 goto :devicecheck

if %inputms%==1 cls && echo Loading. && cls && adb reboot >nul && cls && echo Rebooted! 

if %inputms%==2 echo Loading... && adb reboot recovery && goto :menurecovery

if %inputms%==3 echo Loading... && adb reboot-bootloader && goto :menubootloader

if %inputms%==4 adb devices

if %inputms%==5 adb shell getprop ro.build.version.release

if %inputms%==6 SET /P i=Write the app name like (app.apk) && adb install -r %i%

if %inputms%==7 SET /P appcom=Write the app name like (com.myAppPackage) && adb uninstall %appcom%

if %inputms%==8 SET /P ss=Write the size of the screen like (2048x1536) && adb shell wm size %ss%

if %inputms%==9 SET /P sd=Write the density of the screen like (288) && adb shell wm density %sd%

if %inputms%==10 adb shell wm size reset && adb shell wm density reset

if %inputms%==11 echo Loading... && adb reboot recovery && echo Booting to recovery! && goto changesystemsettings  

if %inputms%==12 echo Press Control + C to stop the recording, the file is placed in /storage/emulated/0/ && adb shell screenrecord --verbose /storage/emulated/0/demo.mp4

if %inputms%==13 cls && adb get-serialno && adb shell netstat && adb shell pwd && adb shell dumpsys battery && adb shell pm list features && adb shell service list && adb shell ps && adb shell wm size 

if %inputms%==14 SET /P app_com=Write the app name like com.myAppPackage && echo Loading.. && adb shell pm uninstall -k --user 0 %app_com% 

if %inputms%==15 goto :grantpermissions

if %inputms%==16 goto :Interface
pause
goto menusystem

:Interface
cls
call "Banners/banner2.bat"
echo ==========================================================================
echo INTERFACE MENU
echo ==========================================================================
echo 1) Enable Dark Mode
echo 2) Disable Dark Mode
echo ==========================================================================
echo 0) EXIT
echo ==========================================================================
echo.
SET /P inputms=Please Select:

if %inputms%==0 goto :devicecheck

if %inputms%==1 adb shell settings put secure ui_night_mode 2 && echo Loading. && cls && adb reboot >nul && cls && echo Rebooted! 

if %inputms%==2 adb shell settings put secure ui_night_mode 1 && echo Loading. && cls && adb reboot >nul && cls && echo Rebooted! 
pause
goto :menusystem

:changesystemsettings
cls
echo This process can cause damage to your SMARTPHONE
echo.
echo Select Mount and then select System from the list of partitions to mount the system partition and then go back.
echo.
echo Select 1 to pull the build.prop to ATA folder, after the pull you can change your 
echo system info. After the change save it and Select 2
goto :changesystemsettings1
:changesystemsettings1
SET /P inputcss=Please Select 
if %inputcss%==0 goto menusystem
if %inputcss%==1 adb pull /system/build.prop "build.prop" && goto :changesystemsettings1 
if %inputcss%==2 adb push "build.prop" /system/ && goto :changesystemsettings2
:changesystemsettings2
echo Now you have to write:
echo cd system
echo chmod 644 build.prop
echo exit
echo Now reboot into the system
adb shell
pause
goto :menusystem


:menurecovery
cls
call "Banners/banner1.bat"
echo ==========================================================================
echo RECOVERY MENU
echo ==========================================================================
echo What do you want to do?
echo.
echo 1) Sideload a zip
echo ==========================================================================
echo 0) EXIT
echo ==========================================================================
echo.
SET /P inputmr=Please Select:

if %inputmr%==0 goto :devicecheck
set slzip=0
if %inputmr%==1 SET /P slzip=Write the zip name like (name.zip)
adb sideload %slzip%
pause
goto menurecovery

:credits
cls
color 0A
call "Banners/banner2.bat"
echo ==========================================================================
echo CREDITS MENU
echo ==========================================================================
echo What do you want to do?
echo.
echo 1) Github
echo.
echo 2) Twitter
echo.
echo 3) Donate
echo ==========================================================================
echo 0) EXIT
echo ==========================================================================
echo.
SET /P inputmc=Please Select:
echo log:
if %inputmc%==0 goto :devicecheck 

if %inputmc%==1  start "" https://github.com/MassimilianoSartore/Advance-Tool-for-Android

if %inputmc%==2  start "" https://twitter.com/SWayWasTaken

if %inputmc%==3  start "" https://www.paypal.me/SWayGaming && echo Thank you very much for offering to help out with this project!
pause
goto :credits

:optionalreboot
echo Do you want to reboot the SMARTPHONE(Y/N)?
set /p inputop=Please Select:

if %inputop%==Y cls && echo Loading... && adb reboot >nul && cls && echo Rebooted! 
else
goto :menusystem


:grantpermissions
cls
call "Banners/banner2.bat"
echo ==========================================================================
echo ROOT PERMISSIONS MENU
echo ==========================================================================
echo What do you want to do?
echo.
echo 1) Grant WRITE_SECURE_SETTINGS permission
echo 2) Grant DUMP permission
echo 3) Check for granted permissions
echo ==========================================================================
echo 0) EXIT
echo ==========================================================================
echo.
SET /P inputgp=Please Select:

if %inputgp%==0 goto :devicecheck 

if %inputgp%==1 SET /P app_gp=Write the app name like com.myAppPackage && echo Loading.. && adb shell pm grant %app_gp% android.permission.WRITE_SECURE_SETTINGS && echo Executed!

if %inputgp%==2 SET /P app_gp=Write the app name like com.myAppPackage && echo Loading.. && adb shell pm grant %app_gp% android.permission.DUMP && echo Executed!

if %inputgp%==3 SET /P app_gp=Write the app name like com.myAppPackage && echo Loading.. && adb shell dumpsys package %app_gp% && echo Executed!
pause
goto :grantpermissions


:exitstatus
tasklist /FI "IMAGENAME eq adb.exe" 2>NUL | find /I /N "adb.exe">NUL
if "%ERRORLEVEL%"=="0" goto :exit
exit

:exit 
cls
call "Banners/banner1.bat"
echo The ADB.exe is still running, Do you want to kill it? (Y/n)
SET /P inputex=Please Select:
if %inputex%==Y taskkill /f /im adb.exe && echo Done! && goto :exitstatus
if %inputex%==y taskkill /f /im adb.exe && echo Done! && goto :exitstatus
if %inputex%==N exit
if %inputex%==n exit 
echo Error, Wrong input!
pause
goto :exitstatus


:creator
cls
call "Banners/banner2.bat"
echo.
echo ==========================================================================
echo PROGRAM MENU
echo ==========================================================================
echo What do you want to do?
echo.
echo 1) Create a program (.bat)
echo 2) Run a program 
echo ==========================================================================
echo 0) EXIT
echo ==========================================================================
SET /P crinput=Please Select:
echo.
echo log:
if %crinput%==1 goto creator1
if %crinput%==2 goto runp
if %crinput%==0 goto menu
pause
goto creator

:creator1
SET /P inputcr=Program name:
if exist %inputcr%.bat (
    echo %inputcr% exist, change the name!
    pause
) else (
    echo @echo off >> %inputcr%.bat
    echo created!
    goto commandsin
)
goto :creator1

:commandsin
cls
call "Banners/banner2.bat"
echo.
echo ==========================================================================
echo REMOTE COMMANDS MENU
echo ==========================================================================
echo What do you want to do?
echo.
echo 1) Instruction
echo 2) Text
echo ==========================================================================
echo 0) EXIT
echo ==========================================================================
SET /P ccinput=Please Select:
echo.
echo log:
if %ccinput%==1 goto instruction
if %ccinput%==2 goto textc
if %ccinput%==0 goto creator
echo Done!
echo Do you want to continue? (Y/n)
SET /P inputcr1=Please Select:
if %inputcr1%==Y goto commandsin
if %inputcr1%==y goto commandsin
if %inputcr1%==N goto creator
if %inputcr1%==n goto creator
goto commandsin

:instruction
SET /P inputcom=Instruction number: 
echo adb shell input keyevent %inputcom% >> %inputcr%.bat
goto commandsin

:textc
SET /P inputcom=Text: 
echo adb shell input text %inputcom% >> %inputcr%.bat
goto commandsin

:runp
SET /P inputcc1=Program name with extension: 
if exist %inputcc1% (
    start %inputcc1%
    echo Launched!
) else (
    echo The program doesn't exist!
)
pause
goto creator