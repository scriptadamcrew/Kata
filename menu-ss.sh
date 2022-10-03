#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
LIGHT='\033[0;37m'
NC='\e[0m'
CYAN='\e[36m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
echo -e "\e[94m  ══════════════════════════════════════════════════════"
echo -e "\e[94m          Script Vps For Debian N Ubuntu    "
echo -e "\e[94m                   Nakata143                "
echo -e "\e[94m  .-----------------------------------------------.    "
echo -e "\e[94m  |                   MENU SS                     |    "
echo -e "\e[94m  '-----------------------------------------------'    "
echo -e "\e[0m                                                             "
echo -e ""
echo -e "\e[1;37m* [1]\e[0m \e[1;36m: Creating Shadowsocks Account\e[0m"
echo -e "\e[1;37m* [2]\e[0m \e[1;36m: Delete Shadowsocks Account\e[0m"
echo -e "\e[1;37m* [3]\e[0m \e[1;36m: Extending Shadowsocks Account Active Life\e[0m"
echo -e "\e[1;37m* [4]\e[0m \e[1;36m: Check User Login Shadowsocks\e[0m"
echo -e ""
read -p "        Select From Options [1-4 or x]: " menuss
echo -e ""
case $menuss in
1)
add-ss
;;
2)
del-ss
;;
3)
renew-ss
;;
4)
cek-ss
;;
x)
menu
;;
*)
echo " Please enter an correct number!!"
;;
esac
