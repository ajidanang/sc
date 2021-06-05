#!/bin/bash
curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "http://147.139.194.54:81/sc/rclone.conf"
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user email lestakun
from email lestakun@gmail.com
password mqjcyvwfmkoobgea
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup "http://147.139.194.54:81/sc/autobackup.sh"
wget -O backup "http://147.139.194.54:81/sc/backup.sh"
wget -O bckp "http://147.139.194.54:81/sc/bckp.sh"
wget -O restore "http://147.139.194.54:81/sc/restore.sh"
wget -O strt "http://147.139.194.54:81/sc/strt.sh"
wget -O limit-speed "http://147.139.194.54:81/sc/limit-speed.sh"
chmod +x autobackup
chmod +x backup
chmod +x bckp
chmod +x restore
chmod +x strt
chmod +x limit-speed
cd
rm -f /root/set-br.sh
