#!/bin/bash

source ./utils.sh

# Call the get_disk_space_before function to get the available disk space before executing the file
get_disk_space_before


sudo apt-get clean >/dev/null 2>&1
sudo apt-get autoclean >/dev/null 2>&1
sudo apt-get autoremove >/dev/null 2>&1

# Call the get_disk_space_after function to get the available disk space after executing the file
get_disk_space_after "apt cache"
