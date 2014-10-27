#!/bin/bash

if [ $# -eq 0 ]; then
	echo "sh $0 days"
	exit 1
fi

rm result.sql
for i in $(seq $1 1 0 ); do
  date=`date -d "$i days" +%Y-%m-%d`
  echo "select '$date', a.*, b.*, c.* from (select count(*) as 'Total' from nova_device where createdAt < '$date 23:59:59' and createdAt > '$date') as a, (select count(*) as 'iOS' from nova_device where type = 0 and  createdAt < '$date 23:59:59' and createdAt > '$date') as b, (select count(*) as 'Android' from nova_device where type = 1 and  createdAt < '$date 23:59:59' and createdAt > '$date') as c;" >> result.sql
done

mysql -u nova -p'!QAZ3edc%TGB' -h mysql_slave ruooglenova < result.sql
