#!/bin/sh -u

echo "==> Setup NTP";
# Set the time correctly
ntpdate -v -b in.pool.ntp.org;