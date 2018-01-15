#!/bin/tcsh
echo "FreeNAS Gogs installation script."
echo "This has been tested on:"
echo "    r295946+07c41cd(9.10-STABLE)"
echo
echo "Press any key to begin"
set jnk = $<

if ( -f /usr/local/etc/rc.d/gogs ) then
    echo "Updating Gogs..."
    echo
    # Stop Gogs service
    service gogs stop 
    ./gogs-compile.sh
    echo "Update Done!"
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
    /usr/sbin/pkg install -y memcached redis go git bash
    echo "Enabling & starting memcached & redis"
    sysrc memcached_enable=YES
    sysrc redis_enable=YES

    /usr/sbin/service memcached start
    /usr/sbin/service redis start
    # 5) Create user first; installing git will install a git user to 913
    echo "Creating git user"
    setenv GITHOME /usr/home/git/
    mkdir -p $GITHOME
    if (! -d /home ) then
	    /bin/ln -s /usr/home /home
    endif
    pw add user -n git -u 913 -d $GITHOME -s /bin/tcsh -c "Gogs -  Go Git Service"
    chown -R git:git $GITHOME
    su - git -c "/usr/bin/ssh-keygen -b 2048 -N '' -f ~/.ssh/id_rsa -t rsa -q &"
    # 6) Get & compile gogs
    ./gogs-compile.sh
    su - git -c "ln -s /usr/home/git/.ssh/ /usr/home/git/gogs/"
    # 7) Start up scripts
    sysrc gogs_enable=YES
endif
# cleaning this mess
su - git -c "rm -rf /usr/home/git/go/"
service gogs start
echo 
echo
echo

echo "Gogs should be running on port 3000 on the following addresses:"
ifconfig | grep inet
