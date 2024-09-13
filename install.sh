#/usr/bin/bash

# Check if ansible is installed, if not, install it
if ! [ -x "$(command -v ansible)" ]; then
  echo 'Warning: ansible is not installed.' >&2
  echo 'Installing ansible...'
  sudo apt-get update
  sudo apt-get install software-properties-common
  sudo apt-add-repository --yes --update ppa:ansible/ansible
  sudo apt-get install ansible -y
fi

# Check if zsh is installed, if not, install it
if ! [ -x "$(command -v zsh)" ]; then
  echo 'Warning: zsh is not installed.' >&2
  echo 'Installing zsh...'
  sudo apt-get update
  sudo apt-get install zsh -y
fi

# Check if zsh is the default shell, if not, set it as the default shell
# After changing the shell, exit wsl
if [[ $SHELL != "/usr/bin/zsh" ]]; then
  echo 'Setting zsh as the default shell...'
  chsh -s $(which zsh)
  echo 'Please exit WSL and open it again to apply the changes.'
  exit
fi

echo "Running the ansible playbook. Please enter your sudo password when prompted."
ansible-playbook playbook.yml -K

echo "Installing node LTS..."
nvm install --lts --latest-npm

echo "Done!"