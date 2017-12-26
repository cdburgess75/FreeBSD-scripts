#!/bin/sh -u
#rev1
echo "==> set hostname";
cat >>/etc/rc.conf << RC_CONF
hostname="$HOSTNAME"
RC_CONF
