#!/bin/sh -u
#rev1
echo "==> Disk usage before cleanup";
df -h;

echo "==> ZFS Disk usage before cleanup";
zfs list;

# Purge files we don't need any longer
echo "==> Removing FreeBSD update files";
rm -rf /var/db/freebsd-update/files;
mkdir -p /var/db/freebsd-update/files;
rm -f /var/db/freebsd-update/*-rollback;
rm -rf /var/db/freebsd-update/install.*;
echo "==> Removing old kernel";
rm -rf /boot/kernel.old;
echo "==> Removing sources";
rm -rf /usr/src/*;
echo "==> Removing core dumps";
rm -f /*.core;

echo "==> Disk usage after cleanup";
df -h;

echo "==> ZFS Disk usage after cleanup";
zfs list;
