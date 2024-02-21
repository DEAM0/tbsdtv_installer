#!/bin/bash
clear
echo -e "[+] Welcome to the TBSDriver Installer!"
echo -e "[+] Version: 1.0.1 | Last update: 3.8.2023"
echo -e "[+] This script is created for install TBSDriver."
echo -e "[+] Script created by https://github.com/DEAM0"
echo -e "[+] Tested on"
echo -e "    Ubuntu 22.04"
echo -e "[+] Support me: https://sk.liberapay.com/GuardianChat"
echo -e ""
echo -e "1) Ubuntu"
echo -e ""
echo -e ""
echo -e "Choose option[1]:"
read os
case $os in
    1) clear
	   echo "[+] You have chosen to install Ubuntu."
	   sleep 2
	   echo "[+] I am downloading the installation package for ubuntu."
	   sleep 2
	   cd tvsbdtv_installer
	   chmod +x tbsdriver_ubuntu.sh
	   ./tbsdriver_ubuntu.sh
	   ;;
  esac
