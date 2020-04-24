Rem Tool made by Sway 
Rem Version: 0.01
Rem github repository: https://github.com/MassimilianoSartore/ATA-updater
Rem twitter: https://twitter.com/SWayWasTaken
Rem email: massimiliano.sartore@protonmail.com
Rem Copyright (C) 2019-2020 SwayWasTaken

MODE 150
@echo off
:adbinstall
TITLE ATA updater tool by Sway
call "Banners/updatebanner.bat"
if exist j_unzip.vbs (
    echo DON'T CLOSE THIS BATCH! 
    echo ATA update started!
    taskkill /f /im adb.exe 2>nul
    powershell -command "& { iwr https://github.com/MassimilianoSartore/ATA-updater/raw/master/update.zip -OutFile update.zip }"
    echo update started!
    echo Unzipping update.zip
    cscript //B j_unzip.vbs update.zip
    echo Moving files in %cd%
    set main="%cd%"
    move /Y update\* %main%
    echo Deleting stuffs
    rmdir /Q /S update
    echo Deleting update.zip
    del update.zip
    if exist ATA.bat (
        start ATA.bat
        exit
    ) else (
        echo update failed!
        echo You have to download ATA again!
        start "" https://massimilianosartore.github.io/Advance-Tool-for-Android-ADB-Tool/
        exit 
        pause
    )
) else (
    echo update failed!
    echo You have to download ATA again!
    start "" https://massimilianosartore.github.io/Advance-Tool-for-Android-ADB-Tool/
    exit 
    pause
)