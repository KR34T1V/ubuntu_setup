#!/bin/sh

# Author : Cornelis Terblanche
# Copyright (c) GNU v3
# Script follows here:
# kodi-remove.sh
. $(dirname "$0")"/functions/req_config_remove.sh"

KODI_REPO="ppa:team-xbmc/ppa"

REMOVE_REPOS="$KODI_REPO"

REMOVE_PACKAGES="kodi"

echo "Repositories to be removed: $REMOVE_REPOS"
echo "Packages to be removed: $REMOVE_PACKAGES"

sudo apt update
sudo add-apt-repository --remove --yes $REMOVE_REPOS
sudo apt remove --yes $REMOVE_PACKAGES
sudo apt purge --yes $REMOVE_PACKAGES
req_config_remove
if [ $? = 1 ]
then
	sudo rm -r ~/.kodi/
fi
sudo apt update
sudo apt autoremove --yes

