plug-services
=============

Deploy PLUG services via Ansible

Getting Started
===============

Requirements
------------
* Control Machine running Ansible 2.2+ and sshpass

* Client machines running Ubuntu 16.04+ or Debian 8+ (we only officially support Debian 9 right now)

* Access to the secrets repo (for now)

Usage
-----

First-time usage:
* Install Ansible 2.2+ and sshpass on your workstation

* (Optionally) Enter a Projects folder to keep it contained

* Clone the plug-services repositories

`git clone https://github.com/plugorgau/plug-services.git`

`git clone git@github.com:plugorgau/plug-services-secrets.git`

* Follow the instructions for [the plug-services-secrets repository](https://github.com/plugorgau/plug-services-secrets)

Bootstrapping new nodes:

To bootstrap a new node, use the bootstrap keypair when creating it, ensure it is listed in the bootstrap inventory file (bootstrap), then run the below command replacing "user" with the initial user - this should be something like "ubuntu" or "admin". If your user requires a password for login or sudo access, add --ask-pass and --ask-become-pass as appropriate.

` ansible-playbook bootstrap.yml -u user -i bootstrap `

Performing a standard run:

Once keys are in place, running the playbook is simple.

` ansible-playbook site.yml -i inventory `

You may also find it handy to do a "dry run" using Ansible's check mode:

` ansible-playbook site.yml -i inventory --check `
