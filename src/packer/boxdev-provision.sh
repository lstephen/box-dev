#!/bin/bash

set -e

function as_root {
    echo 'packer' | sudo -S $@
}

as_root apt-get update
as_root apt-get install --no-install-recommends -y python-pip python-dev gcc
as_root pip install ansible

ansible-playbook -v -i /home/packer/ansible/hosts /home/packer/ansible/playbook.yml


