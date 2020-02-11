#!/bin/sh

# Author : Cornelis Terblanche
# Copyright (c) GNU v3
# Script follows here:
# extlinux-setup.sh
#http://shallowsky.com/linux/extlinux.html

. $(dirname "$0")"/functions/req_reboot.sh"
REPO1=""

INSTALL_REPOS="$REPO1"

INSTALL_PACKAGES="extlinux syslinux-common"

install () {
	echo "Repositories to be installed: $INSTALL_REPOS"
	echo "Packages to be installed: $INSTALL_PACKAGES"

	sudo add-apt-repository --yes $INSTALL_REPOS
	sudo apt update
	sudo apt upgrade --yes
	sudo apt install --yes $INSTALL_PACKAGES
	sudo extlinux --install /boot/extlinux
	sudo fdisk -l /dev/sda
	sudo dd if=/usr/lib/extlinux/mbr.bin of=/dev/sda bs=440 count=1
	sudo cp /usr/lib/syslinux/*menu* /boot/extlinux
	sudo cp /usr/lib/syslinux/chain.c32 /boot/extlinux
	sudo echo "ui vesamenu.c32" >> /boot/extlinux.conf 
	sudo apt update
	sudo apt upgrade --yes
	sudo apt autoremove --yes
	req_reboot
	echo "\nSetup Complete"
}

remove() {
	REMOVE_REPOS="$INSTALL_REPOS"

	REMOVE_PACKAGES="$INSTALL_PACKAGES"

	echo "Repositories to be removed: $REMOVE_REPOS"
	echo "Packages to be removed: $REMOVE_PACKAGES"

	sudo apt update
	sudo add-apt-repository --remove --yes $REMOVE_REPOS
	sudo apt remove --yes $REMOVE_PACKAGES
	sudo apt purge --yes $REMOVE_PACKAGES
	sudo apt update
        sudo apt autoremove --yes
	echo "\nSetup Complete"

}

main () {
	INSTALL="install"
	REMOVE="remove"

	if [ $1 ]
	then
		ARG1=$1	

		if [ $ARG1 = $INSTALL ]
		then
			install
		elif [ $ARG1 = $REMOVE ]
		then
			remove
		else
			echo "Argument Required: \"$INSTALL\" | \"$REMOVE\""
			return 0
		fi
	else
		echo "Argument Required: \"$INSTALL\" | \"$REMOVE\""
	fi
		return 0
}

main $1 $2 $3
