#!/bin/bash


cd ~/inbox/user_access


targetDir=/var/log/nova/

rsync -av app01:$targetDir/* original_log_from_servers/app01/
rsync -av app02:$targetDir/* original_log_from_servers/app02/
rsync -av app03:$targetDir/* original_log_from_servers/app03/

echo "Copy Finished..."


#sort local files
today=$(date +%Y-%m-%d)
if [ -x "$today.log" ]; then  
rm $today.log
fi  

if [ "$today"x = "2013-11-28"x ]; then
	sort original_log_from_servers/app01/$today.log original_log_from_servers/ruoogle03/$today.log original_log_from_servers/ruoogle03/$today.log original_log_from_servers/ruoogle04/$today.log original_log_from_servers/app02/$today.log original_log_from_servers/app03/$today.log >$today.log		
else
	sort original_log_from_servers/app01/$today.log original_log_from_servers/app02/$today.log original_log_from_servers/app03/$today.log >$today.log

fi
sed -i '1i  timestamp,userId,actionType,actionName,appType,accessIP,gender,inDateTime,outDateTime,usedTime,errorCode,vesion,servername' $today.log

echo "Sort Finished..."
