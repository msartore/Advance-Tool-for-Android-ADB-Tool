mode con:cols=150 lines=50
@echo off
TITLE ATA Tool by Sway
color 07
call "Scripts/banner1.bat"

echo a >> settings.tmp

:prelaunch
for /f %%a in (settings.tmp) do (
if %%a==4920617070726f7665 (
goto :adblaunch
) else (
goto :disclaimer
)
)

:infodevice
cls
call "Scripts/banner1.bat"
echo                [             ](0/7)
for /f "delims=" %%v in ('adb shell getprop ro.build.user') do set "ro_build_user=%%v"
cls
call "Scripts/banner1.bat"
echo                [..           ](1/7)
for /f "delims=" %%v in ('adb shell getprop ro.product.cpu.abilist') do set "ro_product_cpu_abilist=%%v"
cls
call "Scripts/banner1.bat"
echo                [...          ](2/7)
for /f "delims=" %%v in ('adb shell getprop ro.product.manufacturer') do set "ro_product_manufacturer=%%v"
cls
call "Scripts/banner1.bat"
echo                [.....        ](3/7)
for /f "delims=" %%v in ('adb shell getprop ro.product.model') do set "ro_product_model=%%v"
cls
call "Scripts/banner1.bat"
echo                [.......      ](4/7)
for /f "delims=" %%v in ('adb shell getprop ro.product.board') do set "ro_product_board=%%v"
cls
call "Scripts/banner1.bat"
echo                [........     ](5/7)
for /f "delims=" %%v in ('adb shell getprop ro.product.device') do set "ro_product_device=%%v"
cls
call "Scripts/banner1.bat"
echo                [...........  ](6/7)
for /f "delims=" %%v in ('adb shell getprop ro.build.version.release') do set "ro_android_version=%%v"
cls
call "Scripts/banner1.bat"
echo                [.............](7/7)
goto :menu 

:adblaunch
echo Loading...
fastboot devices >nul
adb devices >nul
cls
goto :devicecheck

:devicecheck
cls
color 07
call "Scripts/banner1.bat"
echo Checking if the device is connected...
for /f "delims=" %%v in ('adb shell getprop ro.build.version.release') do set "version=%%v"
if /I "%version%" GEQ "1" (
    cls
    call "Scripts/banner1.bat"
    DEVICE FOUND!
    goto :infodevice
) else ( 
    goto :devicenotfound
)

:devicenotfound
cls
call "Scripts/banner1.bat"
echo DEVICE NOT FOUND!
echo try to reconnect the device or enable the usb debugging in your settings
echo after that press enter
pause
cls
goto :devicecheck

:disclaimer
echo *** Disclaimer ***
echo I am not responsible for any damage YOU will do to your device
echo You have been warned, Do you accept? (Y/N)
echo.
SET /P inputd=Please Select:
if %inputd%==Y (
SET inputd=4920617070726f7665
) else (
set inputd=546s578eehds7s6553445401x
)
echo %inputd% > settings.tmp
if %inputd%==4920617070726f7665 goto :prelaunch
if %inputd%==546s578eehds7s6553445401x exit


:menu
cls
color 07
echo =============================================================
echo DEVICE INFO
echo =============================================================
echo Rom builder name: %ro_build_user%     Board: %ro_product_board%     Android Version: %ro_android_version%
echo.
echo Manufacturer: %ro_product_manufacturer%     Model: %ro_product_model%     Device Product: %ro_product_device%
echo.
echo Compitable Apk file: %ro_product_cpu_abilist% 
echo =============================================================
echo MAIN MENU
echo =============================================================
echo 1.  Fastboot/Bootloader Commands
echo.
echo 2.  Recovery Commands (Sideload)
echo.
echo 3.  System Commands
echo.
echo 4.  Credits
echo =============================================================
echo 0) EXIT
echo =============================================================

SET /P inputmm=Please Select:

if %inputmm%==1 goto menubootloader
if %inputmm%==2 goto menurecovery
if %inputmm%==3 goto menusystem
if %inputmm%==4 goto credits
if %inputmm%==0 exit


:menubootloader
cls
echo =============================================================
echo BOOTLOADER/FASTBOOT MENU
echo =============================================================
echo What do you want to do?
echo.
echo 1) UNLOCK/LOCK BOOTLOADER 
echo.
echo 2) FORMAT DATA PARTITION (EXT4)
echo.
echo 3) FORMAT DATA PARTITION (F2FS)
echo.
echo 4) FLASH RECOVERY (only .img file)
echo.
echo 5) FLASH KERNEL (only .img file)
echo.
echo 6) FLASH ROM (You must know what you are doing)
echo.
echo 7) Check connected devices
echo.
echo 8) Boot into ROM
echo.
echo 9) Boot into recovery
echo =============================================================
echo 0) EXIT
echo =============================================================
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

pause
goto menubootloader

:menubootloaderunlock
cls
echo =============================================================
echo BOOTLOADER UNLOCK/LOCK MENU
echo =============================================================
echo What do you want to do?
echo.
echo 1) UNLOCK BOOTLOADER for older devices (2014 and earlier) (not all device supported)
echo.
echo 2) UNLOCK BOOTLOADER For newer devices (2015 and later) (not all device supported)
echo.
echo 4) LOCK BOOTLOADER For older devices (2014 and earlier) (not all device supported)
echo.
echo 3) LOCK BOOTLOADER For newer devices (2015 and later) (not all device supported)
echo.
echo =============================================================
echo 0) EXIT
echo =============================================================
echo.
SET /P inputmbul=Please Select:

if %inputmbul%==0 goto :menubootloader

if %inputmbul%==1 fastboot oem device-info && fastboot oem unlock && echo checking. && cls && echo checking.. && cls && echo checking... && fastboot getvar unlocked

if %inputmbul%==2 fastboot oem device-info && fastboot flashing unlock && echo checking. && cls && echo checking.. && cls && echo checking... && fastboot getvar unlocked

if %inputmbul%==3 fastboot oem device-info && fastboot oem lock && echo checking. && cls && echo checking.. && cls && echo checking... && fastboot getvar unlocked

if %inputmbul%==4 fastboot oem device-info && fastboot flashing lock && echo checking. && cls && echo checking.. && cls && echo checking... && fastboot getvar unlocked
pause
goto menubootloaderunlock

:menusystem
cls
echo =============================================================
echo SYSTEM MENU
echo =============================================================
echo What do you want to do?
echo.
echo 1) REBOOT SMARTPHONE
echo.
echo 2) REBOOT INTO THE RECOVERY
echo.
echo 3) REBOOT INTO THE Fastboot/Bootloader
echo.
echo 4) Check connected devices
echo.
echo 5) Check devices version connected
echo.
echo 6) Install an app
echo.
echo 7) Unistall an app (No System App)
echo.
echo 8) Emulate device (Resize Screen)
echo.
echo 9) Emulate device (Change Density)
echo.
echo 10) Reset (Emulate device)
echo.
echo 11) Change system info 
echo.
echo 12) Screen Recording 
echo. 
echo 13) SMARTPHONE Status
echo.
echo 14) Unistall System App/Bloat 
echo =============================================================
echo 0) EXIT
echo =============================================================
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
pause
goto menusystem


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
echo =============================================================
echo RECOVERY MENU
echo =============================================================
echo What do you want to do?
echo.
echo 1) Sideload a zip
echo =============================================================
echo 0) EXIT
echo =============================================================
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
call "Scripts/banner2.bat"
echo =============================================================
echo CREDITS MENU
echo =============================================================
echo What do you want to do?
echo.
echo 1) Github
echo.
echo 2) Twitter
echo =============================================================
echo 0) EXIT
echo =============================================================
echo.
SET /P inputmc=Please Select:

if %inputmc%==0 goto :devicecheck 

if %inputmc%==1  start "" https://github.com/MassimilianoSartore/Advance-Tool-for-Android

if %inputmc%==2  start "" https://twitter.com/SWayWasTaken
goto :credits


:optionalreboot
echo Do you want to reboot the SMARTPHONE(Y/N)?
set /p inputop=Please Select:

if %inputop%==Y cls && echo Loading... && adb reboot >nul && cls && echo Rebooted! 
else
goto :menusystem
