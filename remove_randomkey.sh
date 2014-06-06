#!/bin/bash
for(( j=0; j<10000; j++ )); do

for(( i=0; i<300; i++ )); do

	a=`redis-cli randomkey`
	echo $a
	if [ ${#a} -lt 18 ]; then
		echo "NO"
	else 
		b=`echo $a|awk '{print substr($a,1,17)}'`
		echo "b=$b"
		if [ "$b" = "nova:look:profile" ]; then
			echo "YES"
			redis-cli del $a
		else
			echo "NO"
		fi
	fi
done
	sleep 10
done
