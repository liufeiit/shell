#!/bin/sh
echo "start..."
d=$(date "+%Y%m%d%H%M%S")
f=startTask.job-$d.txt
touch $f
for HH in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24; do
  today=$(date --date="-$HH hour" "+%Y%m%d%H%M%S")
  echo $today
  exec_service_url="http://www.ruoogle.com.cn:8080/novamanager/backDoor/msgService?date=$today"
  echo $exec_service_url
  curl $exec_service_url >> $f
done
echo "ok"
