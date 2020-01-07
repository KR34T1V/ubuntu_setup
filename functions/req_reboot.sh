#!/bin/sh

# Author : Cornelis Terblanche
# Copyright (c) GNU v3
# Script follows here:
# req_reboot.sh

req_reboot () {
	while true
	do
		read -p "Would you like to reboot your system now? (y|n): " REBOOT_RESPONSE
		if [ $REBOOT_RESPONSE = 'y' ]
                then
			COUNT=15
			echo "Restarting...\n\nPress Ctrl + C to stop."
                        while [ $COUNT != 0 ]
			do
				echo "Rebooting in $COUNT seconds.."
				sleep 1
				COUNT=`expr $COUNT - 1`

			done
			echo "Rebooting!"
			sleep 2
			reboot
                        return 1
                elif [ $REBOOT_RESPONSE = 'n' ]
                then
                        echo "Please reboot system later.."
                        return 0
                fi

	done
}
