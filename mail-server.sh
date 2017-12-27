hostname
domain
certpath
certkeypath

pkg update -f
pkg upgrade -f
pkg install -y ap24-mod_security apache24 apr arc arj autoconf autoconf-wrapper automake automake-wrapper bash bison ca_root_nss cclient clamav-milter cmake cmake-modules-webos kf5-extra-cmake-modules curl cvsps davical db5 dialog4ports dovecot-pigeonhole dovecot expat ezjail freetype2 gdbm gettext-runtime gettext-tools git gmake gnupg1 help2man icu indexinfo jpeg-turbo json-c jsoncpp kbproto ldns lha libICE libSM libX11 libXau libXaw libXdmcp libXext libXmu libXp libXpm libXt libarchive libedit libevent libffi libiconv libidn libltdl liblz4 libmcrypt libpthread-stubs libspf2 libtool libuv libxcb libxml2 libzip lua52 lzo2 m4 mod_php56 munin-common mysql56-client mysql56-server nano oniguruma5 opendkim opendmarc p5-Algorithm-C3 p5-Authen-NTLM p5-Authen-SASL p5-B-Hooks-EndOfScope p5-BerkeleyDB p5-Bit-Vector p5-Cache p5-Cache-Cache p5-Carp-Clan p5-Class-c3 p5-Class-Data-Inheritable p5-Class-Inspector p5-Class-Method-Modifiers p5-Class-Singleton p5-Crypt-CBC p5-Crypt-DES p5-Crypt-OpenSSL-Bignum p5-Crypt-OpenSSL-RSA p5-Crypt-OpenSSL-Random p5-DBD-Pg p5-DBD-mysql p5-DBI p5-Data-OptList p5-Date-Calc p5-DateTime p5-DateTime-HiRes p5-DateTime-Locale p5-DateTime-TimeZone p5-Devel-StackTrace
pkg install -y p5-Digest-HMAC p5-Digest-SHA1 p5-Dist-CheckConflicts p5-Encode-Detect p5-Encode-Locale p5-Error p5-Eval-Closure p5-Exception-Class p5-File-Listing p5-File-NFSLock p5-File-ShareDir
pkg install -y p5-Filter p5-GSSAPI p5-HTML-Parser p5-HTML-Tagset p5-HTTP-Cookies p5-HTTP-Daemon p5-HTTP-Date p5-HTTP-Message p5-HTTP-Negotiate p5-Heap p5-IO-HTML p5-IO-Multiplex p5-IO-Socket-INET6
pkg install -y p5-IO-Socket-IP p5-IO-Socket-SSL p5-IO-String p5-IO-stringy p5-IPC-ShareLite p5-LWP-MediaTypes p5-List-AllUtils p5-List-SomeUtils p5-List-SomeUtils-XS p5-List-UtilsBy p5-Locale-gettext
pkg install -y p5-MRO-Compat p5-Mail-DKIM p5-Mail-SPF p5-Mail-Tools p5-Module-Build p5-Module-Implementation p5-Module-Runtime p5-Mozilla-CA p5-Net-CIDR p5-Net-DNS p5-Net-DNS-Resolver-Programmable p5-Net-HTTP
pkg install -y p5-Net-IDN-Encode p5-Net-LibIDN p5-Net-SMTP-SSL p5-Net-SNMP p5-Net-SSLeay p5-Net-Server p5-NetAddr-IP p5-Package-Stash p5-Package-Stash-XS p5-Params-Util p5-Params-Validate
pkg install -y p5-Params-ValidationCompiler p5-Parse-Syslog p5-Role-Tiny p5-Scalar-List-Utils p5-Socket p5-Socket6 p5-Specio p5-Sub-Exporter p5-Sub-Exporter-Progressive p5-Sub-Identify p5-Sub-Install p5-Switch
pkg install -y p5-TimeDate p5-Try-Tiny p5-URI p5-Variable-Magic p5-WWW-RobotRules p5-XML-LibXML p5-XML-NamespaceSupport p5-XML-Parser p5-XML-SAX p5-XML-SAX-Base p5-YAML p5-libwww p5-namespace-autoclean
pkg install -y p5-namespace-clean pcre pear pear-Auth pear-Auth_SASL pear-Net_SMTP pear-Net_Socket pecl-intl perl5 pflogsumm php-libawl php56 php56-calendar php56-ctype php56-curl php56-dom php56-extensions
pkg install -y php56-filter php56-gd php56-gettext php56-hash php56-iconv php56-imap php56-json php56-mbstring php56-mcrypt php56-mysql php56-mysqli php56-opcache php56-openssl php56-pdo php56-pdo_mysql
pkg install -y php56-pdo_pgsql php56-pdo_sqlite php56-pgsql php56-phar php56-posix php56-session php56-simplexml php56-sqlite3 php56-tokenizer php56-xml php56-xmlreader php56-xmlwriter php56-zip php56-zlib pkg
pkg install -y pkgconf png portmaster postfix postgresql93-client postgresql93-server postgrey printproto pwgen py27-Babel py27-Jinja2 py27-MarkupSafe py27-alabaster py27-authres py27-dns py27-docutils py27-fail2ban
pkg install -y py27-imagesize py27-ipaddr py27-postfix-policyd-spf-python py27-pygments py27-pyspf py27-pystemmer py27-pytz py27-setuptools py27-six py27-snowballstemmer py27-sphinx py27-sphinx_rtd_theme py27-sqlite3
pkg install -y python2 python27 re2c readline rhash rsync scons screen spamassassin sqlite3 t1lib unzoo vsftpd-ssl xextproto xproto yajl



echo 'zfs_enable="YES" # For ZFS filesystems' >> /etc/rc.conf
echo 'ntpd_enable="YES"' >> /etc/rc.conf
echo 'sshd_enable="YES"' >> /etc/rc.conf
echo 'sendmail_enable="NO"' >> /etc/rc.conf
echo 'sendmail_submit_enable="NO"' >> /etc/rc.conf
echo 'sendmail_outbound_enable="NO"' >> /etc/rc.conf
echo 'sendmail_msp_queue_enable="NO"' >> /etc/rc.conf
echo 'mysql_enable="YES"' >> /etc/rc.conf
echo 'postgresql_enable="YES"' >> /etc/rc.conf
echo 'apache24_enable="YES"' >> /etc/rc.conf
echo 'postfix_enable="YES"' >> /etc/rc.conf
echo 'dovecot_enable="YES"' >> /etc/rc.conf
echo 'spamd_enable="YES"' >> /etc/rc.conf
echo 'spamd_flags="-d -m5 -x -q -Q -u nobody"' >> /etc/rc.conf
echo 'milteropendkim_enable="YES"' >> /etc/rc.conf
echo 'milteropendkim_uid="opendkim"' >> /etc/rc.conf
echo 'opendmarc_enable="YES"' >> /etc/rc.conf
echo 'opendmarc_runas="opendmarc"' >> /etc/rc.conf
echo 'clamav_clamd_enable="YES"' >> /etc/rc.conf
echo 'clamav_freshclam_enable="YES"' >> /etc/rc.conf
echo 'clamav_milter_enable="YES"' >> /etc/rc.conf
echo 'loginscript_enable="YES"' >> /etc/rc.conf


cat /usr/local/etc/apache24/httpd.conf | grep ServerName
echo "ServerName $hostname.$domain" >> /usr/local/etc/apache24/httpd.conf
cat /usr/local/etc/apache24/httpd.conf | grep ServerName

cp /usr/local/etc/php.ini-production /usr/local/etc/php.ini

cat /usr/local/etc/php.ini | grep date.timezone
echo "date.timezone = UTC" >> /usr/local/etc/php.ini
cat /usr/local/etc/php.ini | grep date.timezone

mkdir -p /etc/skel/Maildir/{cur,new,tmp}
mkdir -p /usr/local/vhosts
mkdir -p /usr/local/etc/postfix/keys

cp $cerykeypath /usr/local/etc/postfix/keys/server.crt
cp $certpath /usr/local/etc/postfix/keys/server.key

pw groupadd -n vmail -g 5000
pw adduser -n vmail -c "Virtual mail user" -u 5000 -g 5000 -d /usr/local/vhosts -s /usr/sbin/nologin

chown -R vmail:vmail /usr/local/vhosts/
chown -R vmail:dovecot /usr/local/etc/dovecot/
chmod -R o-rwx /usr/local/etc/dovecot/

touch /var/log/dovecot.log
chown vmail:vmail /var/log/dovecot.log

cat /usr/local/etc/dovecot/dovecot.conf

touch /usr/local/etc/dovecot/dovecot.conf

echo "auth_mechanisms = plain login
auth_verbose = yes
default_client_limit = 2560
default_process_limit = 512
dict {
  acl = mysql:/usr/local/etc/dovecot/dovecot-dict-sql.conf.ext
  quota = mysql:/usr/local/etc/dovecot/dovecot-dict-sql.conf.ext
}
log_path = /var/log/dovecot.log
mail_home = /usr/local/vhosts/mail/%d/%n
mail_location = maildir:/usr/local/vhosts/mail/%d/%n:LAYOUT=fs
mail_max_userip_connections = 20
mail_plugins = quota acl
mail_privileged_group = vmail
mail_shared_explicit_inbox = yes
managesieve_notify_capability = mailto
managesieve_sieve_capability = fileinto reject envelope encoded-character vacation subaddress comparator-i;ascii-numeric relational regex imap4flags copy include variables body enotify environment mailbox date index ihave duplicate mime foreverypart extracttext
mbox_write_locks = fcntl
namespace {
  inbox = no
  list = children
  location = maildir:/usr/local/vhosts/mail/%%d/%%n:LAYOUT=fs:INDEX=/usr/local/vhosts/indexes/%d/%n/shared/%%u:INDEXPVT=/usr/local/vhosts/indexes/%d/%n/shared/%%u
  prefix = shared/%%d/%%n/
  separator = /
  subscriptions = no
  type = shared
}
namespace inbox {
  inbox = yes
  list = yes
  location =
  mailbox Drafts {
    auto = subscribe
    special_use = \Drafts
  }
  mailbox Junk {
    auto = subscribe
    special_use = \Junk
  }
  mailbox Sent {
    auto = subscribe
    special_use = \Sent
  }
  mailbox Trash {
    auto = subscribe
    special_use = \Trash
  }
  prefix =
  separator = /
  type = private
}
passdb {
  args = /usr/local/etc/dovecot/dovecot-sql.conf.ext
  driver = sql
}
plugin {
  acl = vfile
  acl_shared_dict = proxy::acl
  quota = dict:User quota::proxy::quota
  quota_rule2 = Trash:storage=+100M
  sieve = /usr/local/vhosts/mail/%d/%n/.dovecot.sieve
  sieve_before = /usr/local/vhosts/sieve/before.d/
  sieve_dir = /usr/local/vhosts/mail/%d/%n
  sieve_global_dir = /usr/local/vhosts/sieve/%d
  sieve_global_path = /usr/local/vhosts/sieve/%d/default.sieve
}
protocols = imap lmtp sieve
service auth-worker {
  user = vmail
}
service auth {
  unix_listener /var/spool/postfix/private/auth {
    group = postfix
    mode = 0660
    user = postfix
  }
  unix_listener auth-userdb {
    mode = 0600
    user = vmail
  }
  user = dovecot
}
service dict {
  unix_listener dict {
    mode = 0600
    user = vmail
  }
}
service imap-login {
  inet_listener imap {
    port = 143
  }
}
service lmtp {
  unix_listener /var/spool/postfix/private/dovecot-lmtp {
    group = postfix
    mode = 0660
    user = postfix
  }
}
service managesieve-login {
  inet_listener sieve {
    port = 4190
  }
  process_min_avail = 0
  service_count = 1
  vsz_limit = 64 M
}
ssl_cert = </usr/local/etc/postfix/keys/server.crt
ssl_key =  </usr/local/etc/postfix/keys/server.key
userdb {
  args = /usr/local/etc/dovecot/dovecot-sql.conf.ext
  driver = sql
}
protocol lmtp {
  mail_plugins = quota acl sieve
}
protocol lda {
  mail_plugins = quota acl sieve acl
  postmaster_address = root
}
protocol imap {
  imap_client_workarounds = tb-extra-mailbox-sep
  mail_plugins = quota acl imap_quota imap_acl
}" >> /usr/local/etc/dovecot/dovecot.conf

touch /usr/local/etc/dovecot/dovecot-dict-sql.conf.ext

echo "connect = host=127.0.0.1 dbname=mailserver user=mailadmin password=< password >
map {
  pattern = priv/quota/storage
  table = quota2
  username_field = username
  value_field = bytes
}
 
map {
  pattern = priv/quota/messages
  table = quota2
  username_field = username
  value_field = messages
}
 
map {
  pattern = shared/shared-boxes/user/$to/$from
  table = user_shares
  value_field = dummy
  
  fields {
    from_user = $from
    to_user = $to
  }
}
  
map {
  pattern = shared/shared-boxes/anyone/$from
  table = anyone_shares
  value_field = dummy
  
  fields {
    from_user = $from
  }
}" >> /usr/local/etc/dovecot/dovecot-dict-sql.conf.ext

touch /usr/local/etc/dovecot/dovecot-sql.conf.ext

echo "driver = mysql
connect = host=127.0.0.1 dbname=mailserver user=mailuser password=< password >
default_pass_scheme = SHA512-CRYPT
user_query = SELECT CONCAT('*:messages=1000000:bytes=', quota) as quota_rule, 5000 AS uid, 5000 AS gid FROM mailbox WHERE username = '%u' AND active = '1'
password_query = SELECT username as user, password FROM mailbox WHERE username = '%u' AND active = '1'
iterate_query = SELECT username AS user FROM mailserver.mailbox" >> /usr/local/etc/dovecot/dovecot-sql.conf.ext

mv /usr/local/etc/postfix/main.cf{,.orig}
mv /usr/local/etc/postfix/master.cf{,.orig}
