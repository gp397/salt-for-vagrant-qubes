# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

{% set apvar = salt['grains.filter_by'] ( {
  'Fedora': {
    'lsbpkg': 'redhat-lsb-core',
    'sshpkg': 'openssh-server',
    'sshsvc': 'sshd',
  },
  'Ubuntu': {
    'lsbpkg': 'lsb-core',
    'sshpkg': 'openssh-server',
    'sshsvc': 'sshd',
  },
}, grain='os', default = 'Fedora') %}

# LSB
lsb_pkg:
  pkg.installed:
    - pkgs:
      - {{ apvar.lsbpkg }}

# sshd
sshd_pkg:
  pkg.installed:
    - pkgs:
      - {{ apvar.sshpkg }}
      - puppet

sshd_service:
  service.enabled:
    - name: {{ apvar.sshsvc }}

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