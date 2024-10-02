#!/usr/bin/env bash

# Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found, installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew and install Ansible
brew update
brew install ansible

# Add the installation of the required ansible-galaxy dependencies
ansible-galaxy install -r requirements.yml

# Add the installation of external roles
ansible-galaxy role install -p roles hurricanehrndz.nerdfonts

