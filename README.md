# Advance Tool for Android™

	Windows ATA Tool v0.8.5.29032020
	Linux ATA Tool v0.0.1.17032020 

## 📦Download 

[Download](https://github.com/MassimilianoSartore/Advance-Tool-for-Android-ADB-Tool-/releases/download/v1.0/ATA-v0.8.5.29032020-for-Windows-By-Sway.zip) Windows ATA Tool v0.8.5.29032020

[Download](https://github.com/MassimilianoSartore/Advance-Tool-for-Android-ADB-Tool-/releases/download/v1.0/ATA-v0.0.1.17032020-for-Linux-By-Sway.zip) Linux ATA Tool v0.0.1.17032020 
    
## 💡Introduction

This tool include: 
* Adb tool [29.0.5 (October 2019)](https://developer.android.com/studio/releases/platform-tools.html#2905_october_2019)
* Scrcpy [v1.12.1](https://github.com/Genymobile/scrcpy/releases/tag/v1.12.1) 

This tool currently only supports Windows and Linux, in future updates I might add support for macOS.

## ✨ Windows Features: 
* UNLOCK BOOTLOADER 
* LOCK BOOTLOADER 
* FORMAT DATA PARTITION (EXT4) 
* FORMAT DATA PARTITION (F2FS)  
* FLASH RECOVERY (only .img file) 
* FLASH KERNEL (only .img file) 
* FLASH ROM (You must know what you are doing) 
* Check connected devices 
* Boot into ROM 
* Boot into recovery 
* REBOOT SMARTPHONE  
* REBOOT INTO THE RECOVERY 
* REBOOT INTO THE Fastboot/Bootloader 
* Check connected devices 
* Check devices version
* Install an app 
* Unistall an app  
* Emulate device (Resize Screen) 
* Emulate device (Change Density) 
* Reset (Emulate device)  
* Screen Recording
* Smartphone Status
* Change system info
* Grant WRITE_SECURE_SETTINGS permission
* Grant DUMP permission
* Check for granted permissions
* Enable/Disable Dark Mode in Q
* Factory reset
* Device ID
* Sideload a zip
* **Scrcpy** - Screen mirror
* **ADB over network** working
* Create and run a program

    keyevent Istruction 
    https://developer.android.com/reference/android/view/KeyEvent.html
    
## ✨ Linux Features: 
* Check connected devices
* REBOOT SMARTPHONE
* REBOOT INTO THE RECOVERY 
* REBOOT INTO THE Fastboot/Bootloader 
* Check devices version
* Enable/Disable Dark Mode in Q
* Device serial number
* Sideload a zip
* FORMAT DATA PARTITION (EXT4) 
* FORMAT DATA PARTITION (F2FS)  
* FLASH RECOVERY (only .img file) 
* FLASH KERNEL (only .img file) 
* FLASH ROM (You must know what you are doing) 
* Hard Reset
* Stream your smartphone with scrcpy (YOU HAVE TO INSTALL IT!) [How to install it](https://github.com/Genymobile/scrcpy/blob/master/README.md#linux)

## 🌞Windows Requirements 

1.	To run Scrcpy the Android device requires at least API 21 (Android 5.0).

2.	Make sure you [enabled adb debugging](https://developer.android.com/studio/command-line/adb.html#Enabling) on your device(s).
	On some devices, you also need to enable [an additional option](https://github.com/Genymobile/scrcpy/issues/70#issuecomment-373286323)

## 🐧Linux Requirements 


1.	To run Scrcpy the Android device requires at least API 21 (Android 5.0).

2.	Make sure you [enabled adb debugging](https://developer.android.com/studio/command-line/adb.html#Enabling) on your device(s).
	On some devices, you also need to enable [an additional option](https://github.com/Genymobile/scrcpy/issues/70#issuecomment-373286323)

3.	How to Install Scrcpy https://github.com/Genymobile/scrcpy#linux

## Licence

    Copyright (C) 2018 Genymobile
    Copyright (C) 2018-2020 Romain Vimont
    Copyright (C) 2016-2019 Google LLC	https://developer.android.com/license
    Copyright (C) 2019-2020 SwayWasTaken


    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    
    Android is a trademark of Google LLC.
    
## ❓What is Scrcpy?


[Scrcpy](https://github.com/Genymobile/scrcpy) was created by the team behind the popular Android emulator Genymotion, but it is not an Android emulator itself, it displays and controls Android devices connected via USB or TCP/IP, it does not require any root access.

Scrcpy works by running a server on your Android device, and the desktop application communicates using USB (or using ADB tunneling wireless). The server streams the H.264 video of the device screen. The client decodes the video frames and displays them. The client captures input (keyboard and mouse) events, sends them to the server, and the server injects them into the device. [The documentation](https://github.com/Genymobile/scrcpy/blob/master/DEVELOP.md) provides more details.

If you want to see your Android screen interact with the app or content on your desktop, record your phone screen or perform other basic tasks, then Scrcpy is a good choice.

In short, Scrcpy is an excellent way to easily view your Android screen on your computer and interact with it in real time.
