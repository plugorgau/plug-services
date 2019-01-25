#!/bin/bash -xe

#root@power
mkdir ~/ldap-backup-stuff || true
cd ~/ldap-backup-stuff || true
chmod 700 .
slapcat -n0 > config.ldif
slapcat -n1 > data.ldif
scp -pr -i /root/bin/borg-power/ssh/id_ecdsa ~/ldap-backup-stuff borg-power@bayonet.plug.org.au:/tmp/

# move to bayonet:/root/ldap-import
