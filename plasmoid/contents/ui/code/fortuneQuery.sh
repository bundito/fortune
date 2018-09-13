#!/bin/bash

# test for presence of sqlite3
if command -v sqlite3 &>/dev/null; then
	#success, we can proceed
	
	sql="SELECT message FROM fortunes WHERE group_id IN ($1) ORDER BY RANDOM() LIMIT 1"
	#echo $sql;
	#echo "1 = $1"
	#echo "2 = $2"
	#echo "3 = $3"
	echo $sql > $2/query.sql
	result=$(sqlite3 $2/fortune.db < $2/query.sql)
	printf "$result\n"



else
	echo "sqlite3 not found. Please install it from your distribution."
fi
