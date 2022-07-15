#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Je moet dit script als root uitvoeren"
  exit
fi

sudo apt-get update
sudo apt-get upgrade


cd ~

wget http://steinerdatenbank.de/software/kweb-1.7.9.8.tar.gz
tar -xzf kweb-1.7.9.8.tar.gz
cd kweb-1.7.9.8
./debinstall

cd ~

wget http://steinerdatenbank.de/software/kweb_upgrade_buster_20190823.tar.gz
tar -xzf kweb_upgrade_buster_20190823.tar.gz
cd kweb_upgrade_buster_20190823
./install

echo "Vul de URL voor het scherm in : "
read url

rm -f /etc/xdg/openbox/autostart
printf "xset s off\nxset s noblank\nxset -dpms\nsetxkbmap -option terminate:ctrl_alt_bksp\nkweb -KHCUAJ+-zbhrqfpoklgtje '$url'" >> /etc/xdg/openbox/autostart

su homma
cd ~

echo "[[ -z \$DISPLAY && \$XDG_VTNR -eq 1 ]] && startx -- -nocursor" >> .bash_profile

sudo reboot