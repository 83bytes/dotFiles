#!/usr/bin/env bash

set -euo pipefail


function dry_run {
     rsync  -rth --update --info=stats2 --progress /mnt/media/stuff1/   /media/PEOPLE\\sohomb/stuff1/  -n
     rsync  -rth --update --info=stats2 --progress  /mnt/media/stuff2/   /media/PEOPLE\\sohomb/stuff2/  -n
}

function do_it {
     rsync  -rth --update --info=stats2 --progress /mnt/media/stuff1/   /media/PEOPLE\\sohomb/stuff1/
     rsync  -rth --update --info=stats2 --progress /mnt/media/stuff2/   /media/PEOPLE\\sohomb/stuff2/
}

$1
