#!/bin/sh

# Author : Cornelis Terblanche
# Copyright (c) GNU v3
# bluetooth-setup.sh
# Script follows here:

INSTALL_REPOS=""
INSTALL_PACKAGES="pulseaudio pulseaudio-utils pavucontrol pulseaudio-module-bluetooth"

echo "Repositories to be installed: $INSTALL_REPOS"
echo "Packages to be installed: $INSTALL_PACKAGES"

sudo add-apt-repository --yes $INSTALL_REPOS
sudo apt update
sudo apt upgrade --yes
sudo apt install --yes $INSTALL_PACKAGES
sudo apt autoremove --yes

# Configure Bluetooth Sound
echo "# This section contains general options
    [General]
    Enable=Source,Sink,Media,Socket" > /etc/bluetooth/audio.conf
sudo service bluetooth restart
