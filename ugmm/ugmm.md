@byron @pdefante

Byron was able to install ugmm.deb on bayonet.
had to remove php-auth pkg but it was in jessie but not stretch

Stoped nginx just for testing and setup apache2.
had to edit apache2 virtual domains/static links etc.
access logs show bayonet.plug.org.au/ugmm/ is being hit,
and redirects to bayonet.plug.org.au/ugmm/memberself/ but the page doesn't load
(possibly due to php-auth not being installed)

install notes
apt-get install --no-install-recommends php php-fpm devscripts debhelper smarty3 apache2
add mirror to sources for jessie pkgs
apt-get install --no-install-recommends php-auth/jessie
git clone https://github.com/plugorgau/ugmm.git

this is missing accoring to apache logs https://github.com/plugorgau/ugmm/blob/master/www/PLUG/ldapconnection.inc.php
https://github.com/plugorgau/ugmm/blob/master/www/PLUG/ldapconnection.inc.php.example


TODO: remove ugmm.md notes from .../plugorgau.github.io/blob/master/ugmm.md

====
@wings @nug

- Build bayonet
- stop nginx
- remove nginx
- sudo apt install libapache2-mod-php
- sudo apt install --no-install-recommends php php-fpm devscripts debhelper smarty3 apache2
- Build the package
- Install the package
- Missing php5, so update dep in debian/control
- Bump version number in debian/changelog to 0.6.0
- Install missing packages - sudo apt install libjs-jquery-ui php-net-ldap2

- Add repo for php-auth
/etc/apt/sources.list.d/jessie.list:deb http://cdn-aws.deb.debian.org/debian jessie main

- Remove plug-ugmm
sudo apt remove plug-ugmm

- Install further dependencies
sudo apt install php-pear php-xml php7.0-xml libjs-jquery-ui php-net-ldap2

- Remove repo for php-auth

- For later usage, ignore for now
NOTICE: Not enabling PHP 7.0 FPM by default.
NOTICE: To enable PHP 7.0 FPM in Apache2 do:
NOTICE: a2enmod proxy_fcgi setenvif
NOTICE: a2enconf php7.0-fpm

- Remove php-auth dependency in debian/control
- Update changelog
- Build package
- Install package

- Move plug-ugmm.conf from old conf.d (Apache 2.2.22) to sites-available (Apache 2.4+)
- Update changelog
- Rewrite plug-ugmm.conf to explicitly have + or - where appropriate
- Enable rewrite - a2enmod rewrite
- Remove conditional when requiring smarty, as old bug
- Change to smarty3 in require
