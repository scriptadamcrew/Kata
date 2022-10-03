#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Script By Nakata143"
clear
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP2
fi
IP=$(wget -qO- icanhazip.com);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
created=`date -d "0 days" +"%d-%m-%Y"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "==============================="
echo -e "Informasi SSH & OpenVPN"
echo -e "==============================="
echo -e "IP/Host       : $IP"
echo -e "Domain        : ${domain}"
echo -e "Username      : $Login "
echo -e "Password      : $Pass"
echo -e "Created       : $created"
echo -e "Expired       : $exp"
echo -e "==============================="
echo -e "OpenSSH       : 22"
echo -e "Dropbear      : 109, 143"
echo -e "SSL/TLS       : 222, 444, 777"
echo -e "Port Squid    : 3128, 8080, 8000"
echo -e "Port TCP      : 1194"
echo -e "Port UDP      : 2200"
echo -e "Port SSL      : 442"
echo -e "BadVpn        : 7100-7200-7300"
echo -e "Ssh Ws SSL    : 443"
echo -e "Ssh Ws No SSL : 8880"
echo -e "Ovpn Ws       : 2086"
echo -e "OHP SSH       : 8181"
echo -e "OHP Dropbear  : 8282"
echo -e "OHP OpenVPN   : 8383"
echo -e "==============================="
echo -e "Link Download Ovpn"
echo -e "==============================="
echo -e "http://$IP:81/client-tcp-$ovpn.ovpn"
echo -e "==============================="
echo -e "http://$IP:81/client-udp-$ovpn2.ovpn"
echo -e "==============================="
echo -e "http://$IP:81/client-tcp-ssl.ovpn"
echo -e "==============================="
echo -e ""
echo -e "Script By @Nakata143"
echo -e ""
