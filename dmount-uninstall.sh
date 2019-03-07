#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

installPath="/usr/local/bin"

script[0]="dmount-update-from-git"
script[1]="dmount-uninstall"
script[2]="dmount"
script[3]="dunmount"

for i in ${script[@]} 
do 
    if [ -x "$installPath/$i" ]; then
        echo "Uninstalling $i script..."
        rm "$installPath/$i"
    fi
done

echo "All scripts uninstalled."