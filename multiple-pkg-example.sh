#!/bin/sh -u
#rev1
foreach i ( wget unix2dos dmidecode curl git )
echo "==> Install #i";
pkg install -y $i
end
