#!/usr/bin/env bash

set -euo pipefail

# r recursive
# a archive mode (preserves a bunch of things)
# t time (covered in "a" already)
# h human readable


function dry_run {
     rsync  -rthai --update --info=progress2 --progress /mnt/media/stuff1/   /media/PEOPLE\\sohomb/stuff1/  -n
     rsync  -rthai --update --info=progress2 --progress  /mnt/media/stuff2/   /media/PEOPLE\\sohomb/stuff2/  -n
}

function do_it {
     rsync  -rthai --update --info=progress2 --progress /mnt/media/stuff1/   /media/PEOPLE\\sohomb/stuff1/
     rsync  -rthai --update --info=progress2 --progress /mnt/media/stuff2/   /media/PEOPLE\\sohomb/stuff2/
}

$1
