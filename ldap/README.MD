NOTES
# Check out https://tylersguides.com/articles/backup-restore-openldap/

# How to backup existing LDAP?
slapcat -n 0 -l config.ldif
slapcat -n 1 -l data.ldif
Transport safely to server, keeping in mind sensitivity of data

# How to restore from LDAP backup?
Do an Ansible run to install slapd and ldap-utils
Read and then run restoreLDAP.sh
