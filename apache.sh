#!/bin/sh -u
#rev1
echo "==> Install apache24";
pkg -y install apache24
sysrc apache24_enable = "yes"
service apache24 start
