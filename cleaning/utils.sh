#!/bin/bash

# Define a function to get the available disk space before executing a file
get_disk_space_before() {
    start=$(df -h / | awk 'NR==2{print $4}')
    #   echo "Available disk space before executing file: $start"
}

# Define a function to get the available disk space after executing a file
get_disk_space_after() {
    end=$(df -h / | awk 'NR==2{print $4}')
    difference=$(echo "$end - $start" | bc)
    echo -e "\033[32m $1 Freed $difference of disk space.\033[0m"
}
