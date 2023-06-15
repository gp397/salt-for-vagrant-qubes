# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

vagrant_pkgs:
  pkg.installed:
    - pkgs:
      - redhat-rpm-config
      - ruby-devel
      - libnsl
      - ncurses-compat-libs
      - vagrant

# VScode
vscode_repo:
  pkgrepo.managed:
    - humanname: 'Visual Studio Code'
    - baseurl: https://packages.microsoft.com/yumrepos/vscode
    - enabled: True
    - gpgcheck: 1
    - gpgkey: https://packages.microsoft.com/keys/microsoft.asc

vscode:
  pkg.installed:
    - name: code
    - require:
      - pkgrepo: vscode_repo

# Tools
enable_vagrant_networking:
  file.managed:
    - name: '/usr/bin/enable_vagrant_networking'
    - source: salt://vagrant/files/enable_vagrant_networking
    - user: root
    - group: root
    - mode: 755