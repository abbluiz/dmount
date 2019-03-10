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

$HOME/.dmount-tmp/dmount-install.sh

echo "Deleting temporary directory ~/.dmount-tmp"
rm -rf $HOME/.dmount-tmp

echo "All scripts updated from git."
