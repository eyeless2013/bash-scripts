#!/bin/bash

mysql="/usr/bin/mysql"
muser="root"
mpass="afrja12"
mhost="localhost"

echo "----------------------------------------"
echo "Create database, user and add grants"
echo "----------------------------------------"
sleep 1

db="123"
#echo "Enter database name: "
#read db
#echo "Enter user name:"
#read user
#echo "Enter pass for user:"
#read -s pass


#if [ $# -eq 3 ];	then
# 	echo "It's OK, continue"
#	else
#	echo "You enter not enough args. Exit1"
#	exit 1
#fi

echo "-------------------------------------------"
echo "Continue"

mysqlq="${mysql} -u "${muser}" -h "{mhost}" -p"${mpass}" -e 'CREATE DATABASE $db '"


