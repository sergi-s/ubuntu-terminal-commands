#!/bin/bash

source ./utils.sh

# Call the get_disk_space_before function to get the available disk space before executing the file
get_disk_space_before

for file in $(find . -maxdepth 1 -type f -name "*.sh"); do
    if [ "$file" != "$0" ]; then
        bash "$file"
    fi
done

# Call the get_disk_space_after function to get the available disk space after executing the file
get_disk_space_after "Total"
