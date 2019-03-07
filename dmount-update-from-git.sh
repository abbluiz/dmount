#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

if [ ! -e "~/.dmount-tmp" ]; then
    mkdir ~/.dmount-tmp
else
    rm -rf ~/.dmount-tmp
    mkdir ~/.dmount-tmp
fi

git clone https://github.com/abbluiz/upgrade-linux-apps.git ~/.dmount-tmp

# TODO: diff

~/.dmount-tmp/dmount-install.sh

rm -rf ~/.dmount-tmp