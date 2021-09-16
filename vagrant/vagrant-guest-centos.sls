# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

{% from 'vagrant/map.jinga' import centos_template with context %}

vagrant-guest-centos:
  qvm.clone:
    - name: vagrant-guest-centos
    - source: {{ centos_template.template_name }}
    - label: black

vagrant-guest-centos-prefs:
  qvm.vm:
    - name: vagrant-guest-centos
    - prefs:
      - include-in-backups: false