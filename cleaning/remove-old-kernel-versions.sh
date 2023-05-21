# #!/bin/bash

# source ./utils.sh

# # Call the get_disk_space_before function to get the available disk space before executing the file
# get_disk_space_before

# sudo apt-get purge $(dpkg -l 'linux-*' | awk '/^ii/{print $2}' | grep -E '[0-9]+\.[0-9]+\.[0-9]+-[0-9]+' | grep -v "$(uname -r)") >/dev/null 2>&1

# # Call the get_disk_space_after function to get the available disk space after executing the file
# get_disk_space_after "old kernels"


