# SaltStack Formula for Vagrant::Qubes

This is not fully thought through or fully secured, use it at your own risk!

This is a [Saltstack](https://saltstack.com) Formula intended to help build a setup for [vagrant-qubes](https://github.com/gp397/vagrant-qubes).

When learning how to do this I have taken many ideas from https://github.com/SkypLabs/my-qubes-os-formula.  It would not have been pssible for me to do this without your help!

This is the result of me trying to learn about Qubes' RPC policies, Ruby, SaltStack and Vagrant plugin development all at the same time.  As a result it is heavily experimental but so far is enabling me to learn and is working after a fashion.

This is not fully thought through or fully secured, use it at your own risk!

## Installation
Read the code first, this needs to be in your dom0, if you don't understand it or trust it, don't install it.

Edit copy-from-vm-to-dom0.sh and update the following config

```
VM_TARGET=lab
DIR_TARGET=/home/user/vagrant_qubes/salt-for-vagrant-qubes
```

Copy this script into root's homedir in dom0 and make it executable.

```
# qvm-run --pass-io <VM containing the formula> 'cat <folder containing the formula>/copy-from-vm-to-dom0.sh' > copy-from-vm-to-dom0.sh
# chmod 755 copy-from-vm-to-dom0.sh
```

This will enable you to easily copy the code you have just pulled from github to dom0 into /srv/salt and enable the top file.

Then in dom0, as root

```
qubesctl --all state.highstate
```

This will:
- Create a template based on fedora-33 (you can change that in the code)
- Install vagrant and VSCode into it
- Create a ProxyVM "vagrant"
- Install my vagrant-qubes plugin into it
- Setup Qubes-RPC, with a tag based policy to enable the vagrant-qubes to call functions in dom0

## TODO

There is a lot to do, in no particular order:
- Add sanity checking, input validation etc. to the Qubes-RPC scripts
- Actually think about security properly

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gp397/salt-for-vagrant-qubes. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/gp397/salt-for-vagrant-qubes/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Vagrant::Qubes project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/gp397/salt-for-vagrant-qubes/blob/master/CODE_OF_CONDUCT.md).
