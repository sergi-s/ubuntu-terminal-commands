#!/bin/bash

# Install zsh
sudo apt-get update
sudo apt-get install -y zsh

# Set zsh as the default shell
chsh -s $(which zsh)

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
