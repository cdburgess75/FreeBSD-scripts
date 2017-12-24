pkg -y install apache24
sysrc apache24_enable = "yes"
service apache24 start