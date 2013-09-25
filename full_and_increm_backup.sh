#!/bin/bash

BACKUP_ROOT_DIR="home var etc"

DATE=$(date +"%a")

DEV="/dev/sda3"

TAR_ARGS=""
TAR=/bin/tar
MT=/bin/mt
MKDIR=/bin/mkdir

full_backup () {
	local old=$(pwd)
	cd /
	$TAR $TAR_ARGS -cvpf $DEV $BACKUP_ROOT_DIR
	$MT -f $DEV rewind
	$MT -f $DEV offline
	cd $old
	}
partial_backup(){
	local old=$(pwd)
	cd /
	$TAR $TAR_ARGS -cvpf $TAPE -N "$(date -d '1 day ago')" $BACKUP_ROOT_DIR
	$MT -f $TAPE rewind
	$MT -f $TAPE offline
	cd $old
}

verify_backup_dirs () {
	local s=0
	for d in $BACKUP_ROOT_DIR
	do
		if [ ! -d /$d];
		then
		echo "Error : /$d directory does not exist!"
		s=1
		fi
	done
	[ $s -eq 1 ] && exit 1


verify_backup_dirs

case $NOW in
	Mon) full_backup;;
	Tue|Wed|Thu|Fri) partial_backup;;
	*)) ;;
esac
