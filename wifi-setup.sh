#!/bin/sh

# Author : Cornelis Terblanche
# Copyright (c) GNU v3
# Script follows here:

FOLDER="rtl8821ce"
INSTALL_REPOS=""
INSTALL_PACKAGES="linux-headers-$(uname -r) build-essential dkms"

echo "Repositories to be installed: $INSTALL_REPOS"
echo "Packages to be installed: $INSTALL_PACKAGES"

sudo add-apt-repository --yes $INSTALL_REPOS
sudo apt update
sudo apt upgrade --yes
sudo apt install --yes $INSTALL_PACKAGES
sudo apt autoremove --yes

#install rtl8821ce wifi driver

git clone https://github.com/M4DM0NK3Y/rtl8821ce.git $FOLDER
cd $FOLDER
sudo make install
sudo ./dkms-install.sh
sudo sed -i "s/^GRUB_CMDLINE_LINUX_DEFAULT=\".*\"$/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash pci=noaer\"/g" /etc/default/grub
cd ..
sudo rm -rf ./$FOLDER
echo Rebooting...
wait 50
reboot
