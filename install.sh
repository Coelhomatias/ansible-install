#/usr/bin/bash

echo "Installing Ansible collections from requirements.yml..."
ansible-galaxy collection install -r ~/arch-ansible/requirements.yml

echo "Running the ansible playbook. Please enter your sudo password when prompted."
ansible-playbook ~/arch-ansible/playbook.yml --ask-vault-pass -vvv