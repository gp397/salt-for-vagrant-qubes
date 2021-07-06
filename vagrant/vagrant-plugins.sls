# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

vagrant_plugin_qubes:
  cmd.run:
    - name: vagrant plugin install vagrant-qubes
    - unless: vagrant plugin list | grep 'vagrant-qubes'
    - runas: user
