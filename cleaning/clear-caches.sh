source ./utils.sh

# Call the get_disk_space_before function to get the available disk space before executing the file
get_disk_space_before

sudo apt-get clean >/dev/null 2>&1
yarn cache clean >/dev/null 2>&1
npm cache clean --force >/dev/null 2>&1
npm cache rm --force >/dev/null 2>&1
npm cache verify >/dev/null 2>&1

rm -rf ~/.local/share/Trash/* >/dev/null 2>&1
rm -rf ~/.cache/* >/dev/null 2>&1


# Call the get_disk_space_after function to get the available disk space after executing the file
get_disk_space_after "cache"
