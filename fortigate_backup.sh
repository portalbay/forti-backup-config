#!/bin/bash

path="/project_path/fortigate"

user=$(/bin/cat $path/.creds | cut -f 1 -d ,)
pass=$(/bin/cat $path/.creds | cut -f 2 -d ,)

echo $user,$pass


while read line; do

	site=`echo $line | cut -f1 -d,`
	ip=`echo $line | cut -f2 -d,`
	today=`date +%Y-%m-%d.%H:%M:%S`

	echo $site,$ip

	`/usr/bin/python $path/fortigate.py $user $pass $ip $path/config_backup/$site/$site-$today` 

done<$path/routers.dat

#find  /project_path/fortigate/config_backup/ -mtime +180 #-exec rm -f {} \;
