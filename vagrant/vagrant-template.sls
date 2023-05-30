# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

vagrant-template:
  qvm.clone:
    - name: vagrant-template
    - source: fedora-37
    - label: black

vagrant-template-prefs:
  qvm.vm:
    - name: vagrant-template
    - prefs:
      - include-in-backups: false