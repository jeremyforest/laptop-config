#!/usr/bin/env bash
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

# Add the installation of the required ansible-galaxy dependencies
ansible-galaxy install -r requirements.yml

# Add the installation of external roles
ansible-galaxy role install -p roles hurricanehrndz.nerdfonts
