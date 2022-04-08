# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

{% from 'vagrant/map.jinga' import template_list with context %}

{% for template in template_list %}
vagrant-guest-{{template}}:
  qvm.clone:
    - name: vagrant-guest-{{template}}
    - source: {{template}}
    - label: black

vagrant-guest-{{template}}-prefs:
  qvm.vm:
    - name: vagrant-guest-{{template}}
    - prefs:
      - include-in-backups: false
{% endfor %}