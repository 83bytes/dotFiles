#!/usr/bin/env bash

set -uo pipefail


## USAGE
## ./backup_media dry_run SRC DEST
## ./backup_media do_it SRC DEST


# TODO
# maybe create a list of source and destination mappings so that file from local directories are copied onto the NAS

# Note: This is not a backup solution, but a "make a secure copy" solution

# r recursive
# a archive mode (preserves a bunch of things)
# t time (covered in "a" already)
# h human readable
# i itemize changes

NAS_IP="192.168.1.5"
NAS_PATH="/mnt/rrusty"

function check_for_nas {
     echo "Checking for NAS at $NAS_IP and mount at $NAS_PATH"

     ping $NAS_IP -c 1 -w 1 > /dev/null
     if [ $? -ne 0 ]
     then
          echo "NAS not present at $NAS_IP"
          exit 1
     fi

     grep "$NAS_PATH" /etc/mtab > /dev/null
     if [ $? -ne 0 ]
     then
          echo "NAS Present but not mounted at $NAS_PATH"
          echo "Mount and Retry"
          exit 1
     fi

     echo "*** NAS found at $NAS_IP and mounted at $NAS_PATH ***"
}


# mapping
# /home/sohom/work_space -> mnt/rrusty/work/work_personal

## src dst
function dry_run {
     if [ "$3"  != "--no-dry-run" ];
     then
          echo "DRY RUN:  src: $1  dst: $2"
          rsync  -rthai --update --info=progress2 --progress -n "$1" "$2"
     elif [ "$3" == "--no-dry-run" ];
     then
          echo "NO DRY RUN:  src: $1  dst: $2"
          rsync  -rthai --update --info=progress2 --progress "$1" "$2"
     fi
}

function do_it {
     dry_run "$1" "$2" --no-dry-run
}

check_for_nas
$1 "$2" "$3" ""