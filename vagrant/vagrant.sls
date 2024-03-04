# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

{% from 'flibsquoo/map.jinga' import fedora_template with context %}

include:
  - qvm.sys-firewall
  - vagrant.vagrant-template
  - vagrant.vagrant-guests

vagrant-prefs:
  qvm.vm:
    - name: vagrant
    - present:
      - template: vagrant-{{ fedora_template.fedora_version }}-template
      - label: purple
    - prefs:
      - include-in-backups: false
      - netvm: sys-firewall
      - template_for_dispvms: false
      - provides-network: true
      - template: vagrant-{{ fedora_template.fedora_version }}-template
    - features:
      - disable:
        - appmenus-dispvm
    - require:
      - qvm: sys-firewall
      - sls: vagrant.vagrant-template
      - sls: vagrant.vagrant-guests
    - tags:
      - add:
        - vagrant

vagrant_create:
  file.managed:
    - name: '/etc/qubes-rpc/vagrant_create'
    - source: salt://vagrant/files/vagrant_create
    - user: root
    - group: root
    - mode: 755

vagrant_destroy:
  file.managed:
    - name: '/etc/qubes-rpc/vagrant_destroy'
    - source: salt://vagrant/files/vagrant_destroy
    - user: root
    - group: root
    - mode: 755

vagrant_list:
  file.managed:
    - name: '/etc/qubes-rpc/vagrant_list'
    - source: salt://vagrant/files/vagrant_list
    - user: root
    - group: root
    - mode: 755

vagrant_start:
  file.managed:
    - name: '/etc/qubes-rpc/vagrant_start'
    - source: salt://vagrant/files/vagrant_start
    - user: root
    - group: root
    - mode: 755

vagrant_stop:
  file.managed:
    - name: '/etc/qubes-rpc/vagrant_stop'
    - source: salt://vagrant/files/vagrant_stop
    - user: root
    - group: root
    - mode: 755

vagrant_openfw:
  file.managed:
    - name: '/etc/qubes-rpc/vagrant_openfw'
    - source: salt://vagrant/files/vagrant_openfw
    - user: root
    - group: root
    - mode: 755

vagrant_qubes_policy:
  file.managed:
    - name: '/etc/qubes/policy.d/30-vagrant-qubes.policy'
    - contents: |
        vagrant_create	*	@tag:vagrant	@adminvm	allow
        vagrant_destroy	*	@tag:vagrant	@adminvm	allow
        vagrant_list	*	@tag:vagrant	@adminvm	allow
        vagrant_start	*	@tag:vagrant	@adminvm	allow
        vagrant_stop	*	@tag:vagrant	@adminvm	allow
        vagrant_openfw	*	@tag:vagrant	@adminvm	allow
    - user: root
    - group: root
    - mode: 644