#!/bin/sh

# Author : Cornelis Terblanche
# Copyright (c) GNU v3
# Script follows here:
# req_config_remove.sh

req_config_remove () {
	while true
	do
		read -p "Would you like to remove your configuration aswell? (y|n): " CONFIG_RESPONSE
		if [ $CONFIG_RESPONSE = 'y' ]
		then
			echo "Removing Config!"
			return 1
		elif [ $CONFIG_RESPONSE = 'n' ]
		then
			echo "Keeping Config!"
			return 0
		fi
	done
}
