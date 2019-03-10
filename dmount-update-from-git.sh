#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 
   exit 1
fi

if [ ! -e "$HOME/.dmount-tmp" ]; then
    mkdir $HOME/.dmount-tmp
else
    rm -rf $HOME/.dmount-tmp
    mkdir $HOME/.dmount-tmp
fi

git clone https://github.com/abbluiz/dmount.git $HOME/.dmount-tmp

# TODO: diff

installPath="/usr/local/bin"

script[0]="dmount-update-from-git"
script[1]="dmount-uninstall"
script[2]="dmount"
script[3]="dunmount"

updatingOrInstalling() {

    if [ -x "$2/$3" ]; then
        report="Updating"
    else
        report="Installing"
    fi

}

for i in ${script[@]}
do 

    report="Installing/Updating"
    updatingOrInstalling $report $installPath $i
    echo "$report $i..."
    install "$HOME/.dmount-tmp/$i.sh" "$installPath/$i"

done

echo "Deleting temporary directory ~/.dmount-tmp"
rm -rf $HOME/.dmount-tmp

echo "All scripts updated from git."
