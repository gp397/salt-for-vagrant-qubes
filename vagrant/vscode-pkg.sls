# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

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