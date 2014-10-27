#!/bin/bash

DATE=""
if [ $1 = "today" ];then
        DATE=`date +%Y-%m-%d`
elif [ $1 = "yesterday" ]; then

        DATE=`date -d "yesterday"  +%Y-%m-%d`
elif [ `echo $1|cut -c1-5` = "2014-" ]; then
		DATE=`echo $1|cut -c1-10`
fi

if [ -f "member.sql" ]; then
	rm member.sql
fi

if [ "$DATE" = "" ]; then

	for i in $(seq $1 0 ); do
		date=`date -d "$i days" +%Y-%m-%d`
		echo "select concat('$date,',count(*)) from nova_user_vip_recharge where rechargedAt > '$date'  and rechargedAt < '$date 99';" >> member.sql
	done

else
	date=$DATE
	echo "select concat('$date,',count(*)) from nova_user_vip_recharge where rechargedAt > '$date'  and rechargedAt < '$date 99';" >> member.sql
fi

