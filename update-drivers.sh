#!/bin/bash
clear

sleep 5

echo "[+] Running update..."
sleep 5

sudo apt-get install git
cd /opt/tbs
git pull

cd media_build/
     make dir DIR=../media
     make allyesconfig
     sed -i -r 's/(^CONFIG._RC.=)./\1n/g' v4l/.config
     sed -i -r 's/(^CONFIG._IR.=)./\1n/g' v4l/.config
     make -j4
     make install
     sleep 2
sleep 5
echo "[+] Update Completed! Now restart your server"
sleep 2
sudo reboot
