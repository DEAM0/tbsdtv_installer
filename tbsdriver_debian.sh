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
1) clear
   echo "[+] Installing updates."
   sleep 2
   apt-get update -y
   apt-get full-upgrade -y
   clear
   echo "[+] I am installing the necessary software."
   sleep 2
   apt-get install sudo make patchutils gcc bzip2 apt-transport-https libproc-processtable-perl linux-headers-$(uname -r) curl tar
   clear
   echo "[+] I am preparing for installation."
   sleep 2
   mkdir -p /opt/tbs
   cd /opt/tbs
   git clone https://github.com/tbsdtv/media_build.git
   git clone --depth=1 https://github.com/tbsdtv/linux_media.git -b latest ./media
   cd media_build/
   make dir DIR=../media
   make allyesconfig
   sed -i -r 's/(^CONFIG._RC.=)./\1n/g' v4l/.config
   sed -i -r 's/(^CONFIG._IR.=)./\1n/g' v4l/.config
   make -j4
   make install
   clear
   echo "[+] I am installing firmware."
   cd /tmp 
   wget http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v1.0.tar.bz2
   sudo tar jxvf tbs-tuner-firmwares_v1.0.tar.bz2 -C /lib/firmware/
   echo "[+] Driver successfully installed. Restart the server."
2) clear
   echo "[+] Installing updates."
   sleep 2
   apt-get update -y
   apt-get full-upgrade -y
   clear
   echo "[+] I am installing the necessary software."
   sleep 2
   apt-get install sudo make patchutils gcc bzip2 apt-transport-https libproc-processtable-perl linux-headers-$(uname -r) curl tar
   clear
   echo "[+] I am preparing for installation."
   sleep 2
   mkdir -p /opt/tbs
   cd /opt/tbs
   git clone https://github.com/tbsdtv/media_build.git
   git clone --depth=1 https://github.com/tbsdtv/linux_media.git -b latest ./media
   cd media_build/
   make dir DIR=../media
   make allyesconfig
   sed -i -r 's/(^CONFIG._RC.=)./\1n/g' v4l/.config
   sed -i -r 's/(^CONFIG._IR.=)./\1n/g' v4l/.config
   make -j4
   make install
   clear
   echo "[+] I am installing firmware."
   cd /tmp 
   wget http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v1.0.tar.bz2
   sudo tar jxvf tbs-tuner-firmwares_v1.0.tar.bz2 -C /lib/firmware/
   clear
   echo "[+] Installing Tvheadend."
   sleep 2
   curl -1sLf \
  'https://dl.cloudsmith.io/public/tvheadend/tvheadend/setup.deb.sh' \
  | sudo -E bash;;
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