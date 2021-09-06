# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

{% from 'vagrant/map.jinga' import fedora_template with context %}

vagrant-guest-template:
  qvm.clone:
    - name: vagrant-guest-template
    - source: {{ fedora_template.template_name }}
    - label: black

vagrant-guest-template-prefs:
  qvm.vm:
    - name: vagrant-guest-template
    - prefs:
      - include-in-backups: false