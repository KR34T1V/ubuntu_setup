#!/bin/sh

# Author : Cornelis Terblanche
# Copyright (c) GNU v3
# Script follows here:
. $(dirname "$0")"/functions/req_config_remove.sh"
# Uninstall Kodi


INSTALL_REPOS=""

INSTALL_PACKAGES=""

echo "Repositories to be installed: $INSTALL_REPOS"
echo "Packages to be installed: $INSTALL_PACKAGES"

sudo apt update
sudo apt remove kodi*
sudo apt purge kodi*
req_config_remove
if [ $? = 1 ]
then
	sudo rm -r ~/.kodi/
fi
sudo apt autoremove --yes

