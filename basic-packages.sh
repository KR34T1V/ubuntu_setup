#!/bin/sh

# Author : Cornelis Terblanche
# Copyright (c) GNU v3
# Script follows here:

UKUU_REPO="ppa:teejee2008/ppa"

INSTALL_REPOS="$UKUU_REPO"

INSTALL_PACKAGES="build-essential git curl"

echo "Repositories to be installed: $INSTALL_REPOS"
echo "Packages to be installed: $INSTALL_PACKAGES"

sudo add-apt-repository --yes $INSTALL_REPOS
sudo apt update
sudo apt upgrade
sudo apt install --yes $INSTALL_PACKAGES
sudo apt autoremove --yes
