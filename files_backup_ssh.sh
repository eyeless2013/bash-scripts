#!/bin/bash

SSH="$(which ssh)"

  echo "*** To terminate at any point hit [ CTRL + C ] ***"
  read -p "Enter ssh username : " user
  read -p "Enter ssh host : " host
  read -s -p "Enter ssh password : " pass
  echo ""
#  read -p "Enter remote directory [/] : " remotedir
#  read -p "Enter local directory to upload path [.] : " localdir
#  [ "$remotedir" == "" ] && remotedir="/" || :
#  [ "$localdir" == "" ] && localdir="." || :
   echo "Connect to remote host:"
ssh $user@$host  


