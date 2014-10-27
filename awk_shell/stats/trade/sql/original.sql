select  * from

    (
		select '2014-10-08' as '日期',count(*) as '总数'
		from (
				select * from nova_user_trade as q where q.tradeStatus = 1 and q.createdAt < '2014-10-08 23:59:59' and q.createdAt >= '2014-10-08'
			) 
		as w1
	)as q1,

	(

		select sum(payAmount) as '金额' from nova_user_trade where tradeStatus = 1 and createdAt < '2014-10-08 23:59:59' and createdAt >= '2014-10-08'

	)as q5,

	(
		select (count(*)) as 'Android'
		from  nova_user_version b, (select * from (select * from nova_user_trade where tradeStatus = 1 and createdAt < '2014-10-08 23:59:59' and createdAt >= '2014-10-08') as t1) 
		as t1
		where t1.userId = b.userId and b.deviceType = 1
	)as q2,

	(
		select (count(*)) as 'iOS'
		from  nova_user_version b, (select * from (select * from nova_user_trade where tradeStatus = 1 and createdAt < '2014-10-08 23:59:59' and createdAt >= '2014-10-08') as t1) 
		as t1
		where t1.userId = b.userId and b.deviceType = 0
	)as q4,

	(
select
	count(
	case  
		when tradeFrom=1 then 1 else null end) as '支付宝',

	count( 
	case  
		when tradeFrom=2 then 1 else null end) as 'appstore',

	count( 
	case  
		when tradeFrom=3 then 1 else null end) as '银联',

	count( 
	case  
		when tradeFrom=4 then 1 else null end) as '快用',

	count( 
	case  
		when tradeFrom=5 then 1 else null end) as 'sand'

	from nova_user_trade 
	where  tradeStatus = 1 and createdAt < '2014-10-08 23:59:59' and createdAt >= '2014-10-08'
	) as q3;
