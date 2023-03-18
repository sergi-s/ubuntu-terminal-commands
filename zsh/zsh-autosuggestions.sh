#!/bin/bash

# Install zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Enable zsh-autosuggestions plugin
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/g' ~/.zshrc

# Reload the shell
source ~/.zshrc
