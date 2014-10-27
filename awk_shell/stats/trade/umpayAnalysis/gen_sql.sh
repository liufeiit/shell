#!/bin/bash

for i in $(seq 100 -1 1 ); do
	date=`date -d "-$i days" +%Y-%m-%d`
	echo $date
        echo "select concat('$date,',count(*)) from nova_user_trade where tradeStatus = 1 and createdAt < '$date 99' and createdAt >= '$date';" >> trade.sql	

done
