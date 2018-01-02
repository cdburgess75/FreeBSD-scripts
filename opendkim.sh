#!/bin/sh
#rev2

#dirs are off

pkg install opendkim

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



touch /usr/local/etc/mail/opendkim.keytable
touch /usr/local/etc/mail/opendkim.signingtable
mkdir -p /var/run/dkim /var/db/dkim
chown mailnull:mailnull /var/run/dkim /var/db/dkim
chmod 0700 /var/run/dkim

#rc.conf:
milteropendkim_enable=”YES”
milteropendkim_uid=”mailnull”
milteropendkim_cfgfile=”/usr/local/etc/mail/opendkim.conf”
and now we can start with:

service milter-opendkim start




#!/bin/sh

SELECTOR=myselector
DOMAIN=${1}

if [ -z ${1} ]; then
echo “Usage: ${0} <domain>”
exit 1
fi

if [ -f /var/db/dkim/${DOMAIN}/${SELECTOR}.txt ]; then
echo “=> ERROR: found DKIM keys for ${DOMAIN} already”
/bin/cat /var/db/dkim/${DOMAIN}/${SELECTOR}.txt
exit 1
fi

echo “==> Generating DKIM key for ${DOMAIN}…”
/bin/mkdir /var/db/dkim/${DOMAIN}
/usr/sbin/chown mailnull:mailnull /var/db/dkim/${DOMAIN}
/usr/local/sbin/opendkim-genkey -a -b 2048 -d ${DOMAIN} -D /var/db/dkim/${DOMAIN} -s ${SELECTOR}
/usr/sbin/chown mailnull:mailnull /var/db/dkim/${DOMAIN}/*
echo “==> Done”
echo “==> Updating config to enable DKIM signing…”
echo “${SELECTOR}._domainkey.${DOMAIN}      ${DOMAIN}:${SELECTOR}:/var/db/dkim/${DOMAIN}/${SELECTOR}.private” >> /usr/local/etc/mail/opendkim.keytable
echo “*@${DOMAIN}       ${SELECTOR}._domainkey.${DOMAIN}” >> /usr/local/etc/mail/opendkim.signingtable
echo “==> Done”
echo “==> Reloading OpenDKIM configuration…”
/bin/pkill -USR1 -F /var/run/milteropendkim/pid
echo “==> Done”
echo “DKIM DNS entry to add is below:”
/bin/cat /var/db/dkim/${DOMAIN}/${SELECTOR}.txt
If you chose a different ‘selector’ in the earlier step, remember to change the SELECTOR= line above to match or your signing wont work!

And dont forget to make it executable:

chmod a+x generate-dkim
Now, whenever we want to add a new signing domain, for example dan.me.uk, we can run

generate-dkim dan.me.uk
This will generate a new key, add it to the opendkim configuration files, reload opendkim, and output the required DNS entry to you.

If you’ve previously added the domain, it will just show the DNS entry to you without modifying anything.

Now any emails sent out with a sender of *@dan.me.uk will be DKIM signed using the key generated in the step above.

You MUST add the DNS entry to the domain’s DNS zone for DKIM signing to work.  If the receiving mailserver can’t lookup the DNS entry then it can’t verify your email!

If you ever need to remove a domain from signing, you have to do this manually…

Remove it from /usr/local/etc/mail/opendkim.keytable and /usr/local/etc/mail/opendkim.signingtable (one line in each file), then there’s a folder in /var/db/dkim/ named after the domain which needs to be removed.

For the best chance of delivering to the world’s biggest spammers (gmail/outlook/aol/yahoo/etc), I would recommend SPF, DKIM and DMARC!

