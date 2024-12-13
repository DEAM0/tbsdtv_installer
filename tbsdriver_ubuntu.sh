#!/bin/bash
clear
echo -e "1) Install TBSDriver"
echo -e "2) Install TBSDriver with Tvheadend"
echo -e "3) Update Script"
echo -e "4) Exit"
echo -e ""
echo -e ""
echo -e "Choose option[1-4]:"
read i
case $i in
1) echo "[+] Installing updates..."
     sleep 2
     sudo apt-get update && sudo apt-get full-upgrade -y
     echo "[+] Updates completed!"
     sleep 2
     echo "[+] I am installing the tools for building TBSDriver..."
     sleep 2
     sudo apt-get install make patchutils gcc bzip2 apt-transport-https
     echo "[+] Installation completed"
     sleep 2
     echo "[+] Creating build folder"
     sleep 2
     mkdir -p /opt/tbs
     cd /opt/tbs
     sleep 2
     echo "[+] Cloning TBSDriver..."
     sleep 2
     git clone https://github.com/tbsdtv/media_build.git
     git clone --depth=1  https://github.com/tbsdtv/linux_media.git -b latest ./media
     sleep 2
     echo "[+] Cloning Completed"
     sleep 2
     echo "[+] Now build TBSDriver"
     sleep 2
     cd media_build/
     make dir DIR=../media
     make allyesconfig
     sed -i -r 's/(^CONFIG._RC.=)./\1n/g' v4l/.config
     sed -i -r 's/(^CONFIG._IR.=)./\1n/g' v4l/.config
     make -j4
     make install
     sleep 2
     echo "[+] Installation Completed!"
     sleep 2
     echo "[+] Last step, installing firmware"
     sleep 2
     cd /tmp
     wget http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v1.0.tar.bz2
     sudo tar jxvf tbs-tuner-firmwares_v1.0.tar.bz2 -C /lib/firmware/
     sleep 2
     echo "[+] Installation completed, please restart your server.";;
   2) echo "[+] Installing updates..."
     sleep 2
     sudo apt-get update && sudo apt-get full-upgrade -y
     echo "[+] Updates completed!"
     sleep 2
     echo "[+] I am installing the tools for building TBSDriver..."
     sleep 2
     sudo apt-get install make patchutils gcc bzip2 apt-transport-https
     echo "[+] Installation completed"
     sleep 2
     echo "[+] Creating build folder"
     sleep 2
     mkdir -p /opt/tbs
     cd /opt/tbs
     sleep 2
     echo "[+] Cloning TBSDriver..."
     sleep 2
     git clone https://github.com/tbsdtv/media_build.git
     git clone --depth=1  https://github.com/tbsdtv/linux_media.git -b latest ./media
     sleep 2
     echo "[+] Cloning Completed"
     sleep 2
     echo "[+] Now build TBSDriver"
     sleep 2
     cd media_build/
     make dir DIR=../media
     make allyesconfig
     sed -i -r 's/(^CONFIG._RC.=)./\1n/g' v4l/.config
     sed -i -r 's/(^CONFIG._IR.=)./\1n/g' v4l/.config
     make -j4
     make install
     sleep 2
     echo "[+] Installation Completed!"
     sleep 2
     echo "[+] Installing firmware"
     sleep 2
     cd /tmp
     wget http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v1.0.tar.bz2
     sudo tar jxvf tbs-tuner-firmwares_v1.0.tar.bz2 -C /lib/firmware/
     sleep 2
     echo "[+] Installation completed, now installing TvHeadEnd"
     sleep 2
     curl -1sLf \
        'https://dl.cloudsmith.io/public/tvheadend/tvheadend/setup.deb.sh' \
        | sudo -E bash
     sudo apt-get install tvheadend
     sleep 2
     echo "[+] Installation completed, now restart your server to apply all updates.";;
   3) echo "Updating Script..."
      sleep 2
      cd /tmp
      git clone https://github.com/DEAM0/tbsdtv_installer.git
      cd tbsdtv_installer
      mv tbsdriver.sh /root
      cd ..
      rm -r tbsdtv_installer
      sleep 2
      echo "[+] Update completed!";;
    4) exit;;
esac
