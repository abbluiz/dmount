#!/bin/bash

echo "You will need to be a sudoer."
sleep 1

defaultDeviceDir="$HOME/Device"

if [[ "$1" == "label" && $# -eq 2 ]]; then

	deviceLabel=$2
	defaultMountpointDir="$defaultDeviceDir/$deviceLabel"

	if grep -qs "$defaultMountpointDir" /proc/mounts; then

	    echo "Unmounting $deviceLabel from $defaultMountpointDir"
	    sudo umount /dev/disk/by-label/$deviceLabel
	    echo "Deleting mountpoint directory $defaultMountpointDir"
	    rmdir $defaultMountpointDir

	else

	    echo "$deviceLabel is not mounted on mountpoint directory $defaultMountpointDir"

	fi

elif [[ "$1" == "uuid" && $# -eq 2 ]]; then

	deviceUuid=$2
	defaultMountpointDir="$defaultDeviceDir/$deviceUuid"

	if grep -qs "$defaultMountpointDir" /proc/mounts; then

	    echo "Unmounting $deviceUuid from $defaultMountpointDir"
	    sudo umount /dev/disk/by-uuid/$deviceUuid
	    echo "Deleting mountpoint directory $defaultMountpointDir"
	    rmdir $defaultMountpointDir

	else

	    echo "$deviceUuid is not mounted on mountpoint directory $defaultMountpointDir"

	fi

else

	echo "Invalid arguments."

fi