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

function updatingOrInstalling($i) {

    if [ -x "$installPath/$i" ]; then
        return "Updating"
    else
        return "Installing"
    fi

}

for i in ${script[@]}
do 

    updatingOrInstalling=updatingOrInstalling($i)
    echo "$updatingOrInstalling $i..."
    install "$i.sh" "$installPath/$i"
    
done

echo "dmount installed."