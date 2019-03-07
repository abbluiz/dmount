#!/bin/bash

echo "You will need to be a sudoer."
sleep 1

defaultDeviceDir="$HOME/Device"

if [[ "$1" == "label" && $# -eq 2 ]]; then

	deviceLabel=$2
	defaultMountpointDir="$defaultDeviceDir/$deviceLabel"

	if grep -qs "$defaultMountpointDir" /proc/mounts ; then

		echo "$deviceLabel already mounted on $defaultMountpointDir"

	elif [ -e "/dev/disk/by-label/$deviceLabel" ]; then

		if [ ! -d "$defaultDeviceDir" ]; then

			echo "Creating device directory on $defaultDeviceDirectory"
			echo "Creating mountpoint directory on $defaultMountpointDir"
			mkdir $defaultDeviceDir
			mkdir $defaultMountpointDir

		elif [ ! -d "$defaultMountpointDir" ]; then

			echo "Creating mountpoint directory on $defaultMountpointDir"
			mkdir $defaultMountpointDir

		fi

		echo "Mounting $deviceLabel on $defaultMountpointDir directory..."
		sudo mount /dev/disk/by-label/$deviceLabel $defaultMountpointDir

	else

		echo "$deviceLabel not found."

	fi

elif [[ "$1" == "uuid" && $# -eq 2 ]]; then

	deviceUuid=$2
	defaultMountpointDir="$defaultDeviceDir/$deviceUuid"

	if grep -qs "$defaultMountpointDir" /proc/mounts ; then

		echo "$deviceUuid already mounted on $defaultMountpointDir"

	elif [ -e "/dev/disk/by-uuid/$deviceUuid" ]; then

		if [ ! -d "$defaultDeviceDir" ]; then

			echo "Creating device directory on $defaultDeviceDir"
			echo "Creating mountpoint directory on $defaultMountpointDir"
			mkdir $defaultDeviceDir
			mkdir $defaultMountpointDir

		elif [ ! -d "$defaultMountpointDir" ]; then

			echo "Creating mountpoint directory on $defaultMountpointDir"
			mkdir $defaultMountpointDir

		fi

		echo "Mounting $deviceUuid on $defaultMountpointDir directory..."
		sudo mount /dev/disk/by-uuid/$deviceUuid $defaultMountpointDir

	else

		echo "$deviceUuid not found."

	fi

else

	echo "Invalid arguments."

fi
