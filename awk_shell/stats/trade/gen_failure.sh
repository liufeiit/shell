#!/bin/bash

DATE=""
if [ $1 = "today" ];then
        DATE=`date +%Y-%m-%d`
elif [ $1 = "yesterday" ]; then

        DATE=`date -d "yesterday"  +%Y-%m-%d`
elif [ `echo $1|cut -c1-5` = "2014-" ]; then
		DATE=`echo $1|cut -c1-10`
fi

rm trade_failure.sql

if [ "$DATE" = "" ]; then

	for i in $(seq $1 0 ); do
		date=`date -d "$i days" +%Y-%m-%d`
		echo "select * from ( select '$date' as '日期',count(*) as '失败总数' from ( select * from nova_user_trade as q where q.tradeStatus = 1 and q.createdAt < '$date 23:59:59' and q.createdAt >= '$date' ) as w1 )as q1, ( select sum(payAmount) as '金额' from nova_user_trade where tradeStatus = 1 and createdAt < '$date 23:59:59' and createdAt >= '$date' )as q5, ( select (count(*)) as 'Android' from nova_user_version b, (select * from (select * from nova_user_trade where tradeStatus = 1 and createdAt < '$date 23:59:59' and createdAt >= '$date') as t1) as t1 where t1.userId = b.userId and b.deviceType = 1 )as q2, ( select (count(*)) as 'iOS' from nova_user_version b, (select * from (select * from nova_user_trade where tradeStatus = 1 and createdAt < '$date 23:59:59' and createdAt >= '$date') as t1) as t1 where t1.userId = b.userId and b.deviceType = 0 )as q4, ( select count( case when tradeFrom=1 then 1 else null end) as '支付宝', count( case when tradeFrom=2 then 1 else null end) as 'appstore', count( case when tradeFrom=3 then 1 else null end) as '银联', count( case when tradeFrom=4 then 1 else null end) as '快用', count( case when tradeFrom=5 then 1 else null end) as 'sand' from nova_user_trade where tradeStatus = 1 and createdAt < '$date 23:59:59' and createdAt >= '$date' ) as q3;" >> trade_failure.sql
	done

else
	date=$DATE
	echo "select * from ( select '$date' as '日期',count(*) as '失败总数' from ( select * from nova_user_trade as q where q.tradeStatus = 1 and q.createdAt < '$date 23:59:59' and q.createdAt >= '$date' ) as w1 )as q1, ( select sum(payAmount) as '金额' from nova_user_trade where tradeStatus = 1 and createdAt < '$date 23:59:59' and createdAt >= '$date' )as q5, ( select (count(*)) as 'Android' from nova_user_version b, (select * from (select * from nova_user_trade where tradeStatus = 1 and createdAt < '$date 23:59:59' and createdAt >= '$date') as t1) as t1 where t1.userId = b.userId and b.deviceType = 1 )as q2, ( select (count(*)) as 'iOS' from nova_user_version b, (select * from (select * from nova_user_trade where tradeStatus = 1 and createdAt < '$date 23:59:59' and createdAt >= '$date') as t1) as t1 where t1.userId = b.userId and b.deviceType = 0 )as q4, ( select count( case when tradeFrom=1 then 1 else null end) as '支付宝', count( case when tradeFrom=2 then 1 else null end) as 'appstore', count( case when tradeFrom=3 then 1 else null end) as '银联', count( case when tradeFrom=4 then 1 else null end) as '快用', count( case when tradeFrom=5 then 1 else null end) as 'sand' from nova_user_trade where tradeStatus = 1 and createdAt < '$date 23:59:59' and createdAt >= '$date' ) as q3;" >> trade_failure.sql
fi

