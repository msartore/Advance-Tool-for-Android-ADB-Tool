reset 
tput setaf 2; echo  "       "
tput setaf 2; echo  "       "
tput setaf 2; echo  "       :shdddhy+..yyyyo    oyyyy.   :yyyy:./shdddhyo- -yyyy+      yyyyo    "             
tput setaf 2; echo  "       hMMMNNNMMMN+yMMMM-  :MMMMMy   dMMMm+NMMNNNNMMMMy yMMMM/    hMMMN.   "              
tput setaf 2; echo  "      -MMMM+. :s/-  NMMMy  mMMMMMM: :MMMM/ -oo-.  /NMMM+ hMMMN-  oMMMM:    "              
tput setaf 2; echo  "       oNMMMMNdho-  +MMMM.oMMMhMMMm dMMMh  +hNMMMNmNMMMs  mMMMm.:MMMM+     "              
tput setaf 2; echo  "         /oshmMMMMh  dMMMdNMMm yMMMhMMMN. dMMMmswayNMMMs  .NMMMmNMMMs      "              
tput setaf 2; echo  "      :ohNh:..oMMMM- -MMMMMMM:  NMMMMMMo .MMMM:   :NMMMs   -NMMMMMMy       "              
tput setaf 2; echo  "      -mMMMMMMMMMMs   sMMMMMy   +MMMMMd   yMMMMmdNMMMMMs    :MMMMMd        "              
tput setaf 2; echo  "         ohdmmdyo.     yyyyy.    syyyy-    :sdmmds-oyyy+     dMMMm.        "              
tput setaf 2; echo  "                                                            sMMMN-         "              
tput setaf 2; echo  "                                                           oMMMM:          "              
tput setaf 2; echo  "                                                          -dddd+           "              
tput setaf 2; echo  "                                                                           "                                                        
tput setaf 2; echo 	"      ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::        "
tput setaf 2; echo  "      ::                  ATA Tool v0.0.1.17032020                  ::        "
tput setaf 2; echo  "      ::                   adb and fastboot tool                    ::        "
tput setaf 2; echo  "      ::                      Created By Sway	                    ::        "
tput setaf 2; echo  "      ::                  Copyright 2019-2020 Sway	            ::        "
tput setaf 2; echo  "      ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::        "
tput setaf 2; echo  "================================================================================="
tput setaf 2; echo  " RECOVERY MENU "
tput setaf 2; echo  "================================================================================="
tput setaf 2; echo  " 1. Sideload (ONLY .zip) "
tput setaf 2; echo  "================================================================================="
tput setaf 2; echo  " 0. Return to main menu"
tput setaf 2; echo  "================================================================================="

tput setaf 2; echo  "Please Select:"
read inputmenu

case $inputmenu in

   0)
    sh ATA.sh
    ;;
   1)
    tput setaf 2; echo  "Please enter zip name file with exention:"
    read inputsideload
    ./adb sideload $inputsideload
    ;;



esac
tput setaf 2; echo  "Press [Enter] key to continue..."
read 1 -p prompt
sh recovery.sh