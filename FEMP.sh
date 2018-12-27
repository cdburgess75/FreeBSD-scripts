#!/bin/sh

pkg update && pkg upgrade -y ;
pkg install -y php72 php72-mysqli php72-session php72-xml php72-hash php72-ftp php72-curl php72-tokenizer php72-zlib php72-zip php72-filter php72-gd php72-openssl
pkg install -y mariadb102-client mariadb102-server
pkg install -y py36-certbot-nginx
pkg install -y py36-salt
pkg install -y nano htop git libtool automake autoconf curl geoip wget
pkg install -y nginx
pkg install -y varnish5

sysrc nginx_enable="YES"
sysrc varnishd_enable=YES
sysrc varnishd_listen=":80"
sysrc varnishd_backend="localhost:8080"
sysrc varnishd_storage="malloc,512M"
sysrc varnishd_admin=":8081"

mv /usr/local/etc/nginx/nginx.conf /usr/local/etc/nginx/nginx.conf_bkp

cd /usr/local/etc/nginx/ && fetch https://raw.githubusercontent.com/Wamphyre/AutoTools/master/nginx.conf

mkdir conf.d

touch /usr/local/etc/nginx/conf.d/default_vhost.conf && cd /usr/local/etc/nginx/conf.d/

DOMAIN=$(hostname)

echo "

server {
listen 8080;
listen [::]:8080;

server_name $DOMAIN;

root /usr/local/www/public_html;
index index.php;
}

# HTTPS (port 443) server - our website
server {
    # listening socket that will bind to port 443 on all available IPv4 addresses
    listen                     443 ssl http2;

    # listening socket that will bind to port 443 on all available IPv6 addresses
    listen                     [::]:443 ssl;

    root                       /usr/local/www/public_html;
    index                      index.php;

    # change this to your domain name (domain.com) or host name (blog.domain.com)
    server_name                $DOMAIN;  
    
    # DNS resolver - you may want to change it to some other provider,
    # e.g. OpenDNS: 208.67.222.222
    # or Google: 8.8.8.8
    # (9.9.9.9 is https://quad9.net )
    resolver                   8.8.8.8;
    # allow POSTs to static pages
    error_page                 405    =200 \$uri;
    access_log                 /var/log/nginx/$DOMAIN-access.log;
    error_log                  /var/log/nginx/$DOMAIN-error.log;

    # gzip compression

    gzip on;
    gzip_disable "\msie6";
    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_buffers 16 8k;
    gzip_http_version 1.1;
    gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;

    # no logging for favicon

    location ~ favicon.ico\$ {
        access_log off;
    }

    # deny access to .htaccess files
    
    location ~ /\.ht {
        deny all;
    }

    # expires of assets (per extension)

    location ~ .(jpe?g|gif|png|webp|ico|css|js|zip|tgz|gz|rar|bz2|7z|tar|pdf|txt|mp4|m4v|webm|flv|wav|swf)\$ {
        if (\$args ~ [0-9]+) {
            expires 30d;
        } 
    }

    # expires of assets (per path)

    location ~ ^/(css|js|img|files) {
        if (\$args ~ [0-9]+) {
            expires 30d;
        } 
    }
}
" >> default_vhost.conf

service nginx start
service varnishd start

mv /usr/local/etc/php.ini-production /usr/local/etc/php.ini-production_bk
cd /usr/local/etc/ && fetch https://raw.githubusercontent.com/Wamphyre/AutoTools/master/php.ini
mkdir /usr/local/www/public_html
cd /usr/local/www/public_html
chown -R www:www /usr/local/www/public_html/


sysrc mysql_enable="YES"
sysrc mysql_args="--bind-address=127.0.0.1"
service mysql-server start

sleep 5

/usr/local/bin/mysql_secure_installation

pkg install -y phpMyAdmin-php72

ln -s /usr/local/www/phpMyAdmin/ /usr/local/www/public_html/phpmyadmin

service nginx restart

pkg clean -y && pkg autoremove -y
