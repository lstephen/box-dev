#!/bin/bash

function as_root {
    echo 'packer' | sudo -S $@
}


if [[ -z `blkid /dev/sdb` ]]
then
    as_root mkfs.ext4 -F /dev/sdb
fi

as_root mkdir -p /var/cache/apt/archives
as_root mount /dev/sdb /var/cache/apt/archives

as_root apt-get install --no-install-recommends -y python-pip python-dev gcc
as_root pip install ansible

ansible-playbook -v -i /home/packer/ansible/hosts /home/packer/ansible/playbook.yml


