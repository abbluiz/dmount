#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 
   exit 1
fi

if [ ! -e "~/.dmount-tmp" ]; then
    mkdir ~/.dmount-tmp
else
    rm -rf ~/.dmount-tmp
    mkdir ~/.dmount-tmp
fi

git clone https://github.com/abbluiz/dmount.git ~/.dmount-tmp

# TODO: diff

~/.dmount-tmp/dmount-install.sh

echo "Deleting temporary directory ~/.dmount-tmp"
rm -rf ~/.dmount-tmp

echo "All scripts updated from git."