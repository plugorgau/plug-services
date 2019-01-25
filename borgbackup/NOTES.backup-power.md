# Enable backups from power.plug.org.au
# on power:
#   ssh-keygen -R bayonet.plug.org.au /root/.ssh/known_hosts
#   ssh -i /root/bin/borg-power/ssh/id_ecdsa borg-power@bayonet.plug.org.au
#   No login necessary if key is restricted in authorized_keys
#   /etc/cron.daily/borgbackup is a link to backup script
# on bayonet:
#   adduser --home /srv/backup/borg-power borg-power
#   chown -R borg-power:borg-power /srv/backup/borg-power
#   No valid password set: /etc/shadow: borg-power:!:17921:0:99999:7:::
