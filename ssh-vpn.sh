#!/bin/bash
# By Nakata143
#
# ==================================================
# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=MY
state=Malaysia
locality=Malaysia
organization=Nakata143
organizationalunit=joysmark.me
commonname=joysmark.me
email=kibocelcom@gmail.com

# simple password minimal
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/password"
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

# set time GMT +8
ln -fs /usr/share/zoneinfo/Asia/Malaysia /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "neofetch --ascii_distro Minix" >> .profile

# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/nginx.conf"
mkdir -p /home/vps/public_html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/vps.conf"
/etc/init.d/nginx restart

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config

# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# install squid
cd
apt -y install squid3
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 222
connect = 127.0.0.1:109

[dropbear]
accept = 777
connect = 127.0.0.1:22

[openvpn]
accept = 442
connect = 127.0.0.1:1194

END

# make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

#OpenVPN
wget https://raw.githubusercontent.com/scriptadamcrew/Kata/main/vpn.sh && chmod +x vpn.sh && ./vpn.sh

# install fail2ban
apt -y install fail2ban

# banner /etc/issue.net
wget -O /etc/issue.net "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/bannerssh.conf"
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
cd /usr/bin

wget -O add-host "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/add-host.sh"
wget -O about "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/about.sh"
wget -O menu "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/trial.sh"
wget -O user-limit "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/user-limit.sh"
wget -O hapus "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/hapus.sh"
wget -O member "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/member.sh"
wget -O delete "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/delete.sh"
wget -O cek "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/cek.sh"
wget -O restart "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/restart.sh"
wget -O info "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/info.sh"
wget -O renew "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/tendang.sh"
wget -O change-port "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/port-tr.sh"
wget -O port-squid "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/port-vless.sh"
wget -O xp "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/xp.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/menu-vmess.sh"
wget -O menu-vless "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/menu-vless.sh"
wget -O menu-ss "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/menu-ss.sh"
wget -O menu-ssr "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/menu-ssr.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/menu-trojan.sh"
wget -O menu-wg "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/menu-wg.sh"
wget -O menu-ssh "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/menu-ssh.sh"
wget -O running "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/running.sh"
wget -O bbr "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/bbr.sh"
wget -O strt "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/strt.sh"
wget -O ram "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/ram.sh"
wget -O bannerssh "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/bannerssh.conf"
wget -O issue "https://raw.githubusercontent.com/scriptadamcrew/Kata/main/issue.net"
chmod +x issue
chmod +x bannerssh
chmod +x ram
chmod +x strt
chmod +x user-limit
chmod +x bbr
chmod +x running
chmod +x add-host
chmod +x menu
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x cek
chmod +x restart
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x renew
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x xp
chmod +x menu-vmess
chmod +x menu-vless
chmod +x menu-ss
chmod +x menu-ssr
chmod +x menu-trojan
chmod +x menu-wg
chmod +x menu-ssh
echo "0 5 * * * root reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

# finihsing
clear
