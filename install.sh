#!/bin/tcsh
echo "Fortress installation script."
echo
echo "Press any key to begin"
set jnk = $<

if ( -f /root/fortress ) then
    echo "Beginning Fortress Installation..."
    echo
    ./root/fortress/update.sh
else
    # 3) Enable SSH
    echo "Enabling SSH"
    /usr/bin/sed -i '.bak' 's/sshd_enable="NO"/sshd_enable="YES"/g' /etc/rc.conf
    # Generate root keys &  Enable root login (with SSH keys). 
    echo "Enabling root login without password"
    echo "PermitRootLogin without-password" >> /etc/ssh/sshd_config
    # Start SSH
    echo "Starting SSH Service"
    /usr/sbin/service sshd start
    # 4) Update packages and upgrade any.
    echo "Updating packages"
    /usr/sbin/pkg update -f
    echo "Upgrading packages"
    /usr/sbin/pkg upgrade -y
    echo "Installing memcached, redis & go"
    /usr/sbin/pkg install -y wget
   
  
