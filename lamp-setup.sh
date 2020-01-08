#!/bin/bash

# Author : Cornelis Terblanche
# Copyright (c) GNU v3
# Script follows here:
# lamp-setup.sh

install () {
sudo sh apache-setup.sh install
sudo sh mysql-setup.sh install
sudo sh mariadb-setup.sh install
sudo sh php-setup.sh install
}

remove () {
sudo sh apache-setup.sh remove
sudo sh mysql-setup.sh remove
sudo sh mariadb-setup.sh remove
sudo sh php-setup.sh remove
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
