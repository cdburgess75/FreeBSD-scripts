#!/bin/sh -u

echo "==> Enable NFS and set hostname";
# As sharedfolders are not in defaults ports tree, we will use NFS sharing
cat >>/etc/rc.conf << RC_CONF
hostname="$HOSTNAME"
RC_CONF
