#! /bin/sh


# For 12.0-RELEASE


# Only root can run this
if [ $(id -u) -ne 0 ]; then
	echo "Fatal Error: The script must be run as root"
	exit 1
fi

# Make sure we are on FreeBSD
if [ "$OSTYPE" != "FreeBSD" ]; then
	echo "Fatal Error: This script is only for FreeBSD"
	exit 1
fi

# Currently we only support FreeBSD 12.x
if [ $(/bin/freebsd-version | awk -F '-' '{ print $1}' | awk -F '.' '{ print $1 }') != "12" ]; then
	echo "Fatal Error: This script is only for FreeBSD version 12"
	exit 1
fi

# Only 64-bit CPU
if [ "$MACHTYPE" != "x86_64" ]; then
	echo "Fatal Error: This script is only for 64-bit machines"
	exit 1
fi



# Lets now install some additional usefull osftware
pkg install -y thunderbird openjdk8

# Install VMWare Tools (if virtual machine on VMWare)
if [ $(pciconf -lv | grep -i vmware >/dev/null 2>/dev/null; echo $?) = "0" ]; then
	fetch -qo - http://k.itty.cat/3 | sh
fi

# Install VirtualBox Addons (if virtual machine on VirtualBox)
if [ $(pciconf -lv | grep -i virtualbox >/dev/null 2>/dev/null; echo $?) = "0" ]; then
	# Install the drivers
	pkg install -y emulators/virtualbox-ose-additions
	# Enable
	sysrc vboxguest_enable="YES" vboxservice_enable="YES"
	# Moused doesn't work with VirtualBox
	sysrc moused_enable="NO"
fi

# All done, lets reboot into a desktop!
reboot
