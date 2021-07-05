# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

include:
  - qvm.sys-firewall
  - vagrant.vagrant-template

vagrant-prefs:
  qvm.vm:
    - name: vagrant
    - present:
      - template: vagrant-template
      - label: purple
    - prefs:
      - include-in-backups: false
      - netvm: sys-firewall
      - template_for_dispvms: false
      - provides-network: true
    - features:
      - disable:
        - appmenus-dispvm
    - require:
      - qvm: sys-firewall
      - sls: vagrant.vagrant-template
    - tags:
      - add:
        - vagrant

vagrant_create:
  file.managed:
    - name: '/etc/qubes-rpc/vagrant_create'
    - contents: |
        #!/bin/bash
        
        read class label template vcpus memory netvm
        
        /usr/bin/qvm-create --class ${class} --label ${label} --template ${template} --property vcpus=${vcpus} --property memory=${memory} --property netvm=${netvm} $1
    - user: root
    - group: root
    - mode: 755

vagrant_create_policy:
  file.managed:
    - name: '/etc/qubes-rpc/policy/vagrant_create'
    - contents: |
        @tag:vagrant dom0 allow
        @anyvm @anyvm deny
    - user: root
    - group: root
    - mode: 644

vagrant_destroy:
  file.managed:
    - name: '/etc/qubes-rpc/vagrant_destroy'
    - contents: |
        #!/bin/bash
        
        /usr/bin/qvm-remove -f $1
    - user: root
    - group: root
    - mode: 755

vagrant_destroy_policy:
  file.managed:
    - name: '/etc/qubes-rpc/policy/vagrant_destroy'
    - contents: |
        @tag:vagrant dom0 allow
        @anyvm @anyvm deny
    - user: root
    - group: root
    - mode: 644

vagrant_list:
  file.managed:
    - name: '/etc/qubes-rpc/vagrant_list'
    - contents: |
        #!/bin/bash
        
        /usr/bin/qvm-ls --raw-data --fields=name,state,netvm,ip,class,template $1
    - user: root
    - group: root
    - mode: 755

vagrant_list_policy:
  file.managed:
    - name: '/etc/qubes-rpc/policy/vagrant_list'
    - contents: |
        @tag:vagrant dom0 allow
        @anyvm @anyvm deny
    - user: root
    - group: root
    - mode: 644

vagrant_start:
  file.managed:
    - name: '/etc/qubes-rpc/vagrant_start'
    - contents: |
        #!/bin/bash
        
        /usr/bin/qvm-start $1
    - user: root
    - group: root
    - mode: 755

vagrant_start_policy:
  file.managed:
    - name: '/etc/qubes-rpc/policy/vagrant_start'
    - contents: |
        @tag:vagrant dom0 allow
        @anyvm @anyvm deny
    - user: root
    - group: root
    - mode: 644

vagrant_stop:
  file.managed:
    - name: '/etc/qubes-rpc/vagrant_stop'
    - contents: |
        #!/bin/bash
        
        /usr/bin/qvm-shutdown $1
    - user: root
    - group: root
    - mode: 755

vagrant_stop_policy:
  file.managed:
    - name: '/etc/qubes-rpc/policy/vagrant_stop'
    - contents: |
        @tag:vagrant dom0 allow
        @anyvm @anyvm deny
    - user: root
    - group: root
    - mode: 644
