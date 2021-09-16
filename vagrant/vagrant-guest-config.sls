# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

# sshd
sshd_pkg:
  pkg.installed:
    - pkgs:
      - openssh-server

sshd_service:
  service.enabled:
    - name: sshd

# LSB
# Needed for various scripts in my lab
lsb_pkg:
  pkg.installed:
    - pkgs:
      - redhat-lsb-core

# puppet - needed for networking script
# centos need to add repo, fedora 33 has a version of puppet but puppetlabs don't so don't add repo
{% if grains['os']|lower == 'centos' %}
puppet_repo:
  pkg.installed:
    - sources:
      - puppet6-release: https://yum.puppet.com/puppet6-release-el-{{ grains['osmajorrelease']}}.noarch.rpm
{% endif %}

puppet_pkg:
  pkg.installed:
    - pkgs:
      - puppet

# Vagrant User, shh key etc.
vagrant_user:
  user.present:
    - name: vagrant
    - fullname: vagrant
    - usergroup: True
    - groups:
      - qubes
    - password: $5$MwR3DP1o1B5acwgo$rgED.p2W56jCW9xdd.VIOO.wXP7H2ekt9hM5vQzrj/D

vagrant_insecure_ssh_key:
  ssh_auth.present:
    - user: vagrant
    - enc: ssh-rsa
    - comment: vagrant insecure public key
    - config: '/etc/skel/.ssh/authorized_keys'
    - names:
      - AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==