#!/bin/bash

cd
pkg update && pkg upgrade -y


freebsd-update fetch && freebsd-update install

portsnap fetch auto



pkg install -y nano xorg slim xfce curl wget htop
sleep 3
pkg install xarchiver-0.5.4.7 zip rar xfce4-mixer xfce4-goodies-4.12_1 thunar-archive-plugin numix-theme-2.6.7 mate-icon-theme-faenza-1.18.1 slim-themes-1.0.1_1 chromium deadbeef filezilla bluefish gimp claws-mail-3.16.0 openshot frei0r-plugins audacity jamin transmission-2.92 -y  
sleep 3

sysrc slim_enable="YES"
sysrc moused_enable="YES"
sysrc dbus_enable="YES"
sysrc hald_enable="YES"
sysrc linux_enable="YES"
sysrc ntpd_enable="YES"
sysrc ntpdate_enable="YES"
sysrc powerd_enable="YES"
sysrc powerd_flags="-a hiadaptive"
kldload linux.ko

touch .xinitrc
echo 'exec xfce4-session' >> .xinitrc

sleep 3

cd /usr/ports/x11/nvidia-driver
make install clean BATCH=yes
cd /usr/ports/x11/nvidia-settings
make install clean BATCH=yes
cd /usr/ports/x11/nvidia-xconfig
make install clean BATCH=yes
echo 'nvidia-modeset_load="YES"' >> /boot/loader.conf
nvidia-xconfig

pkg audit -F

sysrc pf_enable="YES"
sysrc pflog_enable="YES"
sysrc clear_tmp_enable="YES"
sysrc syslogd_flags="-ss"
sysrc sendmail_enable="NONE"
sysrc dumpdev="NO"

echo 'kern.elf64.nxstack=1' >> /etc/sysctl.conf
echo 'sysctl security.bsd.map_at_zero=0' >> /etc/sysctl.conf
echo 'security.bsd.see_other_uids=0' >> /etc/sysctl.conf
echo 'security.bsd.see_other_gids=0' >> /etc/sysctl.conf
echo 'security.bsd.unprivileged_read_msgbuf=0' >> /etc/sysctl.conf
echo 'security.bsd.unprivileged_proc_debug=0' >> /etc/sysctl.conf
echo 'kern.randompid=1000' >> /etc/sysctl.conf
echo 'security.bsd.stack_guard_page=1' >> /etc/sysctl.conf
echo 'net.inet.udp.blackhole=1' >> /etc/sysctl.conf
echo 'net.inet.tcp.blackhole=2' >> /etc/sysctl.conf
echo 'kern.ipc.shm_allow_removed=1' >> /etc/sysctl.conf



pkg update && pkg upgrade -y
pkg clean -y


exit
