# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

enable_vagrant_networking:
  file.managed:
    - name: '/usr/bin/enable_vagrant_networking'
    - source: salt://vagrant/files/enable_vagrant_networking
    - user: root
    - group: root
    - mode: 755
