Rem Tool made by Sway 
Rem github repository: https://github.com/MassimilianoSartore/Advance-Tool-for-Android-ADB-Tool-
Rem twitter: https://twitter.com/SWayWasTaken
Rem email: massimiliano.sartore@protonmail.com
Rem Copyright (C) 2019-2020 SwayWasTaken

@echo off
TITLE ATA Tool by Sway [device info]
:viewdeviceinfo

echo Loading info...

for /f "delims=" %%v in ('adb shell getprop ro.build.id') do set "ro_build_id=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.build.display.id') do set "ro_build_display_id=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.build.version.incremental') do set "ro_build_version_incremental=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.build.version.sdk') do set "ro_build_version_sdk=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.build.version.codename') do set "ro_build_version_codename=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.build.version.release') do set "ro_build_version_release=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.build.date') do set "ro_build_date=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.build.type') do set "ro_build_type=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.build.user') do set "ro_build_user=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.build.host') do set "ro_build_host=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.build.tags') do set "ro_build_tags=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.model') do set "ro_product_model=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.brand') do set "ro_product_brand=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.name') do set "ro_product_name=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.device') do set "ro_product_device=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.board') do set "ro_product_board=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.cpu.abi') do set "ro_product_cpu_abi=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.cpu.abi2') do set "ro_product_cpu_abi2=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.cpu.abi3') do set "ro_product_cpu_abi3=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.cpu.abi4') do set "ro_product_cpu_abi4=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.manufacturer') do set "ro_product_manufacturer=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.locale.language') do set "ro_product_locale_language=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.product.locale.region') do set "ro_product_locale_region=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.wifi.channels') do set "ro_wifi_channels=%%v"
for /f "delims=" %%v in ('adb shell getprop ro.board.platform') do set "ro_board_platform=%%v"
cls
echo =================================================================================
echo Build Properties
echo =================================================================================
echo ID: %ro_build_id%
echo.
echo Display ID: %ro_build_display_id%
echo.
echo Version Incremental: %ro_build_version_incremental%
echo.
echo Version SDK: %ro_build_version_sdk%
echo.
echo Version Codename: %ro_build_version_codename%
echo.
echo Version Release: %ro_build_version_release%
echo.
echo Build Date: %ro_build_date%
echo.
echo Type: %ro_build_type%
echo.
echo User: %ro_build_user%
echo.
echo Host: %ro_build_host%
echo.
echo Tags: %ro_build_tags%
echo =================================================================================
echo Product Properties
echo =================================================================================
echo Model: %ro_product_model%
echo.
echo Brand: %ro_product_brand%
echo.
echo Name: %ro_product_name%
echo.
echo Device: %ro_product_device%
echo.
echo Board: %ro_product_board%
echo.
echo CPU 1: %ro_product_cpu_abi%
echo.
echo CPU 2: %ro_product_cpu_abi2%
echo.
echo CPU 3: %ro_product_cpu_abi3%
echo.
echo CPU 4: %ro_product_cpu_abi4%
echo.
echo Manufacturer: %ro_product_manufacturer%
echo.
echo Language: %ro_product_locale_language%
echo.
echo Locale Region: %ro_product_locale_region%
echo.
echo Wifi Channels: %ro_wifi_channels%
echo.
echo Board Platform: %ro_board_platform%
pause