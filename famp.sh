#!/bin/bash


test $? -eq 0 || exit 1 "Got Root?"

sleep 1

echo CTRL-C to cancel
sleep 10

pkg update && pkg upgrade -y

sleep 4

freebsd-update fetch && freebsd-update install

sleep 2

sleep 4

portsnap fetch auto

sleep 4

pkg install -y nano curl htop wget git apache24 php71 php71-mysqli mod_php71 php71-mbstring php71-gd php71-json php71-mcrypt php71-zlib php71-curl mariadb102-client mariadb102-server

sleep 3

sysrc apache24_enable="YES"
service apache24 start
touch /usr/local/etc/apache24/Includes/php.conf
echo "<IfModule dir_module>
DirectoryIndex index.php index.html
<FilesMatch "\.php$">
SetHandler application/x-httpd-php
</FilesMatch>
<FilesMatch "\.phps$">
SetHandler application/x-httpd-php-source
</FilesMatch>
</IfModule>" > /usr/local/etc/apache24/Includes/php.conf
service apache24 restart
sysrc mysql_enable="YES"
service mysql-server start
mv /usr/local/etc/php.ini-production /usr/local/etc/php.ini

sleep 3

chown -R root:www /usr/local/www/apache24/data/
chmod -R 775 root:www /usr/local/www/apache24/data/

sleep 6

pkg audit -F

sysrc pf_enable="YES"
sysrc pflog_enable="YES"
sysrc clear_tmp_enable="YES"
sysrc syslogd_flags="-ss"
sysrc sendmail_enable="NONE"
sysrc dumpdev="NO"

echo "kern.elf64.nxstack=1" > /etc/sysctl.conf
echo "sysctl security.bsd.map_at_zero=0" > /etc/sysctl.conf
echo "security.bsd.see_other_uids=0" > /etc/sysctl.conf
echo "security.bsd.see_other_gids=0" > /etc/sysctl.conf
echo "security.bsd.unprivileged_read_msgbuf=0" > /etc/sysctl.conf
echo "security.bsd.unprivileged_proc_debug=0" > /etc/sysctl.conf
echo "kern.randompid=1000" > /etc/sysctl.conf
echo "security.bsd.stack_guard_page=1" > /etc/sysctl.conf
echo "net.inet.udp.blackhole=1" > /etc/sysctl.conf
echo "net.inet.tcp.blackhole=2" > /etc/sysctl.conf

sleep 7

pkg update && pkg upgrade -y
pkg clean -y


sleep 2

echo Please run /usr/local/bin/mysql_secure_installation

sleep 5
exit
