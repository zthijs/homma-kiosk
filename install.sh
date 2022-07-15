#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Je moet dit script als root uitvoeren"
  exit
fi


printf "xset s off\nxset s noblank\nxset -dpms\nsetxkbmap -option terminate:ctrl_alt_bksp\nkweb -KHCUAJ+-zbhrqfpoklgtje '$url'" > /etc/xdg/openbox/autostart

su homma
cd ~

echo "[[ -z \$DISPLAY && \$XDG_VTNR -eq 1 ]] && startx -- -nocursor" >> .bash_profile

sudo reboot