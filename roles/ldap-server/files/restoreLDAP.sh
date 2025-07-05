#!/bin/bash
# Used to restore LDAP backups to a new server
# Put your LDAP backups in /root/ldap-import/ before running this
# script.

# Do an Ansible run to install slapd and ldap-utils
#ansible-playbook site.yml -i inventory

service slapd stop

# Now we need to prepare the config dir and restore config
# Move existing config dir (/etc/ldap/slapd.d) somewhere safe
mv /etc/ldap/slapd.d /etc/ldap/slapd.d.`date '+%Y-%m-%d'`
# Make a config dir (/etc/ldap/slapd.d)
mkdir /etc/ldap/slapd.d
# Restore our config backup
slapadd -n 0 -F /etc/ldap/slapd.d -l /root/ldap-import/config.ldif
# Fix permissions
chown -R openldap:openldap /etc/ldap/slapd.d
# Now we need to prepare the data dir and restore data
# Move existing data dir (/var/lib/ldap) somewhere safe
mv /var/lib/ldap /var/lib/ldap`date '+%Y-%m-%d'`
# Make a data dir (/var/lib/ldap)
mkdir /var/lib/ldap
# Restore our data backup
slapadd -n 1 -F /etc/ldap/slapd.d -l /root/ldap-import/data.ldif
# Fix permissions
chown -R openldap:openldap /var/lib/ldap

service slapd start
