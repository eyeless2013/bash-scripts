#!/bin/bash

FTP="$(which vsftpd)"
CMD=""
AUTHFILE="/root/.ftp


if [ -f $AUTHFILE ] ; then 
  # use the file for auth
  CMD="$FTP -m -R -f $AUTHFILE $myf $remotedir $localdir"
else
  echo "*** To terminate at any point hit [ CTRL + C ] ***"
  read -p "Enter ftpserver name : " myf
  read -p "Enter ftp username : " myu
  read -s -p "Enter ftp password : " myp
  echo ""
  read -p "Enter ftp remote directory [/] : " remotedir
  read -p "Enter local directory to upload path [.] : " localdir
  [ "$remotedir" == "" ] && remotedir="/" || :
  [ "$localdir" == "" ] && localdir="." || :
  CMD="$FTP -m -R -u $myu -p $myp $myf $remotedir $localdir"
fi
 
$CMD
