#!/bin/bash
# setup-tools.sh - Check and install essential development tools
# Location: /home/porter/.config/setup-tools.sh

# Install fish
sudo apt install software-properties-common
sudo add-apt-repository ppa:fish-shell/release-4
sudo apt update
sudo apt install fish 

set -Ux EDITOR (which fish)

# sudo snap install nvim tmux fzf grep unzip --classic
