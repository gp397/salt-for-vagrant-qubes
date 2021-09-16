# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

{% from 'vagrant/map.jinga' import fedora_template with context %}

vagrant-guest-fedora:
  qvm.clone:
    - name: vagrant-guest-fedora
    - source: {{ fedora_template.template_name }}
    - label: black

vagrant-guest-fedora-prefs:
  qvm.vm:
    - name: vagrant-guest-fedora
    - prefs:
      - include-in-backups: false