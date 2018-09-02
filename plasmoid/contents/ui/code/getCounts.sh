#!/bin/bash

result=$(sqlite3 $1/fortune.db < $1/count.sql)

printf "$result\n"
