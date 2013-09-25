#!/bin/bash

mysql=/usr/bin/mysql

echo "Checking MySQL Replication status"

check_IO () {
	$mysql -u root -p -e 'show slave status\G
