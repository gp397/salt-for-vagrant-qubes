#!/usr/bin/env bash

# Variables
# --------------------------------------------------------------#

SALT_PREFIX=/srv/salt
VM_TARGET=lab
DIR_TARGET=/home/user/vagrant_qubes/salt-for-vagrant-qubes
CONFIG_NAME=vagrant

# Script
# --------------------------------------------------------------#
qubesctl top.disable ${CONFIG_NAME}
rm ${SALT_PREFIX}/${CONFIG_NAME}.top
rm -rf ${SALT_PREFIX}/${CONFIG_NAME}

qvm-run --pass-io $VM_TARGET "cat ${DIR_TARGET}/${CONFIG_NAME}.top" > ${SALT_PREFIX}/${CONFIG_NAME}.top
mkdir -p ${SALT_PREFIX}/${CONFIG_NAME}/files

files=$(qvm-run --pass-io $VM_TARGET "find ${DIR_TARGET}/${CONFIG_NAME} -type f -printf \"%P\n\"")

for file in $files; do
  qvm-run --pass-io $VM_TARGET "cat ${DIR_TARGET}/${CONFIG_NAME}/${file}" > ${SALT_PREFIX}/${CONFIG_NAME}/${file}
done

qubesctl top.enable ${CONFIG_NAME}