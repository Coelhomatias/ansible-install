#/usr/bin/bash
# Install ansible
echo "Installing ansible"
sudo apt-get install ansible -y

echo "Running the ansible playbook. Please enter your sudo password when prompted."
ansible-playbook playbook.yml -K