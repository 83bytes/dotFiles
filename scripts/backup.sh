#!/bin/bash

# This thing has to be manually triggered with sudo permissions and it
# will copy all important files over to the backup dir and then
# unmount it

mount /dev/sda6 /mnt/backup

srcDir1="/home/sohom/work_space/"
srcDir2="/mnt/media/pics"
srcDir3="/home/sohom/Documents/"


backupDir="/mnt/backup/"

rsync -ar --delete $srcDir1 $backupDir/workSpaceBackup && echo "workspace done"
rsync -ar --delete $srcDir2 $backupDir/picsBackup && echo "pics done"
rsync -ar --delete $srcDir3 --exclude='files' $backupDir/documentsBackup && echo "documents done"

umount /dev/sda6
