#!/bin/bash

echo " Hello, this script is back-up"
echo " mysql databases with mysqldump"

MYSQL="$(which mysql)"
MYSQLDUMP="$(which mysqldump)"
GZIP="$(which gzip)"

DEST="/root/mysql"

DATE="$(date +"%d-%m-%Y"+"%T")"

FILE=" "
DBS=" "


echo "List of Databases"
echo "Enter user name:"
read $USER

read -s -p "Enter password:" $PASS

DBS="$($MYSQL -u $USER -p$PASS -Bse 'show databases')"
echo $DBS

IGGY="mysql"

for db in $DBS
do
        FILE="$DEST/$db.$DATE.gz"
        $MYSQLDUMP -u $USER -p$PASS --lock-all-tables $db | $GZIP -5 > $FILE
done

