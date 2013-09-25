#!/bin/bash

LOCALBACKUPDIR="/home/eyeless/bash"

SSHUSER=root

SSHSERVER=192.168.1.112

SSHBACKUPROOT=/root

rsync -avz -e 'ssh' ${SSHUSER}@${SSHSERVER}:{SSHBACKUPROOT} {LOCALBACKUPDIR}

if [ $? -eq 0] || logger 'RSYNC BACKUP : DONE' || logger 'RSYNC BACKUP : FAILED!' 
then 
	echo "All dione success"
	else
	echo "Rsync failed"
fi

exit 0
