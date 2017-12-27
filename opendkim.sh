#!/bin/sh
#rev1

key="";
domain="";

yum install openssl-devel opendkim

mkdir -p /etc/opendkim/keys
chown -R opendkim:opendkim /etc/opendkim
chmod -R go-wrx /etc/opendkim/keys

useradd -r -U -s /sbin/nologin opendkim

mkdir /etc/opendkim/keys/$domain
opendkim-genkey -D /etc/opendkim/keys/$domain/ -d $domain -s $key
chown -R opendkim:opendkim /etc/opendkim/keys/$domain
mv /etc/opendkim/keys/$domain/$key.private /etc/opendkim/keys/$domain/$key



cat /etc/opendkim.conf
