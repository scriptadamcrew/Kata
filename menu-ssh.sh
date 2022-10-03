#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
LIGHT='\033[0;37m'
CYAN='\e[36m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
echo -e "\e[94m  ══════════════════════════════════════════════════════"
echo -e "\e[94m          Script Vps For Debian N Ubuntu    "
echo -e "\e[94m                   Nakata143                "
echo -e "\e[94m  .----------------------------------------------------.    "
echo -e "\e[94m  |                    MENU OVPN SSH                   |    "
echo -e "\e[94m  '----------------------------------------------------'    "
echo -e "\e[0m                                                             "
echo -e "\e[1;37m* [1]\e[0m  \e[1;36m:  Create SSH & OpenVPN Account\e[0m"
echo -e "\e[1;37m* [2]\e[0m  \e[1;36m:  Trial Account SSH & OpenVPN\e[0m"
echo -e "\e[1;37m* [3]\e[0m  \e[1;36m:  Renew SSH & OpenVPN Account\e[0m"
echo -e "\e[1;37m* [4]\e[0m  \e[1;36m:  Delete SSH & OpenVPN Account\e[0m"
echo -e "\e[1;37m* [5]\e[0m  \e[1;36m:  Check User Login SSH & OpenVPN\e[0m"
echo -e "\e[1;37m* [6]\e[0m  \e[1;36m:  List Member SSH & OpenVPN\e[0m"
echo -e "\e[1;37m* [7]\e[0m  \e[1;36m:  Delete User Expired SSH & OpenVPN\e[0m"
echo -e "\e[1;37m* [8]\e[0m  \e[1;36m:  Set up Autokill SSH\e[0m"
echo -e "\e[1;37m* [9]\e[0m  \e[1;36m:  Cek Users Who Do Multi Login SSH\e[0m"
echo -e "\e[1;37m* [10]\e[0m \e[1;36m:  Restart Service Dropbear, Squid3\e[0m"
echo -e ""
read -p "     Please Input Number  [1-10 or x] :  "  ssh
echo -e ""
case $ssh in
1)
usernew
;;
2)
trial
;;
3)
renew
;;
4)
deluser
;;
5)
cek
;;
6)
member
;;
7)
delete
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
x)
exit
;;
*)
echo "Please enter an correct number"
;;
esac
