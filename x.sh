#!/bin/sh
#rev1
# Change this to match your machine setup.
# Services needed by the desktop.\
dbus_enable="YES"\
mixer_enable="YES"\
moused_enable="YES"\
moused_flags="-VH"\
# Remember to do file checks, but in the back ground please.\
fsck_y_enable="YES"\
background_fsck="YES"\
# Clear out the /tmp folder on reboots.\
clear_tmp_enable="YES"\
Xorgclear_tmp_enable="YES"\

# Install packages for desktop use.
pkg install xorg-server xf86-video-intel xf86-input-keyboard xf86-input-mouse xinit xauth slim slim-themes xfce xfce4-weather-plugin xfce4-power-manager xfce4-mixer ristretto xscreensaver firefox filezilla zathura-pdf-poppler cdrtools

# Setup Slim by copying the sample file over.
cp /usr/local/etc/slim.conf.sample /usr/local/etc/slim.conf

# Set slim to use ttys to start itself instead of using rc.conf slim_enable="YES"
echo 'Set slim to use ttys to start itself instead of using rc.conf'
sed -i.bak -e 's|ttyv8	"/usr/local/bin/xdm -nodaemon"	xterm	off secure|ttyv8   "/usr/local/bin/slim"   	xterm   on  secure|' /etc/ttys

# This is only for me. I would remove this sed statment for a community machine.
sed -i.bak -e 's|#default_user        simone|default_user        jda|' -e 's|#auto_login          no|auto_login          yes|' -e 's|current_theme       default|current_theme       fbsd|' /usr/local/etc/slim.conf

# Skel/dot.xinitrc
cp /usr/local/etc/xdg/xfce4/xinitrc /usr/share/skel/dot.xinitrc

# Download some cool backgrounds and icon images and place them in the proper directories.
echo 'Download some cool backgrounds and icon images and place them in the proper directories.'
fetch -o /usr/local/share/backgrounds/xfce/a_1600x900.jpg  http://ugmmutil.info.tm/images/a_1600x900.jpg
fetch -o /usr/local/share/pixmaps/Freebsd-logo.png http://ugmmutil.info.tm/images/Freebsd-logo.png
