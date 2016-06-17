#!/usr/bin/env bash

# Bless some files in files.pharo.org so that they are not forgotten!
# Below is a list of directories which contain automatically generated
# files (typically generated by a continuous integration server). To
# prevent Jenkins from overriding some important files (for example
# the releases), we can copy these important files to a blessed/
# sub-directory. This script helps me do that.

set -e

SERVER=files.pharo.org
BASEDIR=/appli/files.pharo.org

DIRECTORIES=("vm/src/vm-unix-sources" "platform/launcher")

# answer=$(menu "What do you want to do with it?" "$something"
# "$somethingelse" "$anotherthing")
#
# if [[ $answer = $something ]]; then
function menu {
    prompt="$1"
    shift
    choices=("$@")
    echo "$prompt " >&2
    select choice in "${choices[@]}"; do
	[[ $choice ]] && break
    done
    echo $choice
}

# if confirm "Do you want to do that?"; then
#   ...
# fi
function confirm {
    read -p "$1 (Y/n) " answer
    answer=${answer:-"Y"}
    if [ "$answer" = "Y" ]; then
	return 0;
    else
	return 1;
    fi
}

directory=$(menu \
    "Select the directory with the file to bless" \
    ${DIRECTORIES[*]})

declare -a files
while read -d '' -r file; do
    files+=($(basename "$file"))
done < <(ssh "$SERVER" find "$BASEDIR/$directory" \
    -maxdepth 1 -type f -not -name README -not -name '*.md5sum' -print0 | sort --reverse)

echo

file=$(menu \
    "Select a file you want to bless in this directory" \
    ${files[*]})


if ssh "$SERVER" test -f "$BASEDIR/$directory/blessed/$file"; then
    echo "A file with the same name is already blessed!"
    exit 1
fi

if confirm "Are you sure you want to bless $file?"; then
    ssh "$SERVER" sh <<EOF
sudo su --login --command "cp --no-clobber \"$BASEDIR/$directory/$file\" \"$BASEDIR/$directory/blessed\"" filepharosync
sudo su --login --command "cp --no-clobber \"$BASEDIR/$directory/$file.md5sum\" \"$BASEDIR/$directory/blessed\"" filepharosync
EOF
else
    echo "Abort requested"
    exit 1
fi
