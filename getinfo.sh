#!/usr/local/bin/bash

HOSTNAME=$(hostname)
DISTR=$(uname -sr)
MOTHERBOARD=$(dmidecode -t 2 | grep -i 'manufacturer\|product name' | sed 's/[^.]*: //' | paste -s -d' ' -)
CPUNUMBERS=$(dmidecode -t 4 | grep -i status | grep -ic "populated\|enabled")
CPUINFO=$(grep -i cpu: /var/run/dmesg.boot | sed -e 's/[(R)@CPU:]//g' -e 's/ \{1,\}/ /g')
RAMNUMBERS=$(dmidecode -t 17 | grep Size | grep -vc "No Module Installed")
RAMINFO=$(dmidecode -t 17 | grep -i "size\|type:\|speed" | grep -v "No Module Installed\|Unknown" | sort -u | paste -s -d' ' - | awk '{print $2, $3, $8, $5, $6}')
MAXRAM=$(dmidecode -t 16 | grep "Maximum Capacity" | sed 's/[^.]*: //')

echo -e "Mother Board: $MOTHERBOARD
Distr: $DISTR
Mother Board: $MOTHERBOARD
CPU: $CPUNUMBERS x$CPUINFO
RAM: $RAMNUMBERS x $RAMINFO
Max RAM: $MAXRAM"
