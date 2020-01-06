#!/bin/sh

# Author : Cornelis Terblanche
# Copyright (c) GNU v3
# Script follows here:
# user-experience.sh

INSTALL_REPOS=""

INSTALL_PACKAGES="gnome-tweaks vlc"

echo "Repositories to be installed: $INSTALL_REPOS"
echo "Packages to be installed: $INSTALL_PACKAGES"

sudo add-apt-repository --yes $INSTALL_REPOS
sudo apt update
sudo apt upgrade --yes
sudo apt install --yes $INSTALL_PACKAGES
sudo apt update
sudo apt upgrade --yes
sudo apt autoremove --yes

