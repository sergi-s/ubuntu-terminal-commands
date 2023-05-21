#!/bin/bash

source ./utils.sh

# Call the get_disk_space_before function to get the available disk space before executing the file
get_disk_space_before

sudo rm -rf /var/cache/apt/archives >/dev/null 2>&1
sudo apt-get clean >/dev/null 2>&1

# Call the get_disk_space_after function to get the available disk space after executing the file
get_disk_space_after "package manager cache"
