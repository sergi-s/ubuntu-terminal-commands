#!/bin/bash

source ./utils.sh

# Call the get_disk_space_before function to get the available disk space before executing the file
get_disk_space_before

#Removes old revisions of snaps
#CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision" >/dev/null 2>&1
    done

# Call the get_disk_space_after function to get the available disk space after executing the file
get_disk_space_after "snap"
