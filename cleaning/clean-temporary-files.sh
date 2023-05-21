#!/bin/bash

source ./utils.sh

# Call the get_disk_space_before function to get the available disk space before executing the file
get_disk_space_before

sudo rm -rf /tmp/* >/dev/null 2>&1
sudo rm -rf /var/tmp/* >/dev/null 2>&1

# Call the get_disk_space_after function to get the available disk space after executing the file
get_disk_space_after "temporary-files"
