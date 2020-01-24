#!/bin/sh

# Author : Cornelis Terblanche
# Copyright (c) GNU v3
# Script follows here:
# gimp-setup.sh

GIMP_REPO="ppa:otto-kesselgulasch/gimp"

INSTALL_REPOS="$GIMP_REPO"

INSTALL_PACKAGES="gimp"

install () {
	echo "Repositories to be installed: $INSTALL_REPOS"
	echo "Packages to be installed: $INSTALL_PACKAGES"

	sudo add-apt-repository --yes $INSTALL_REPOS
	sudo apt update
	sudo apt upgrade --yes
	sudo apt install --yes $INSTALL_PACKAGES
	sudo apt update
	sudo apt upgrade --yes
	sudo apt autoremove --yes
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
