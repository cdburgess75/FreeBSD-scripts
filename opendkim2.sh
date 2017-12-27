#!/bin/sh 

 if [ "$#" -eq  "0" ]
   then
    echo "No arguments supplied. Usage: dkimgen <domain>"
 else

domain=$1
mkdir /usr/local/etc/opendkim/keys/$domain;
opendkim-genkey -D /usr/local/etc/opendkim/keys/$domain/ -d $domain -s default;
chown -R opendkim: /usr/local/etc/opendkim/keys/$domain;
mv /usr/local/etc/opendkim/keys/$domain/default.private /usr/local/etc/opendkim/keys/$domain/default;
echo "default._domainkey.$domain $domain:default:/usr/local/etc/opendkim/keys/$domain/default" >> /usr/local/etc/opendkim/KeyTable;
echo "*@$domain default._domainkey.$domain" >> /usr/local/etc/opendkim/SigningTable

fi
