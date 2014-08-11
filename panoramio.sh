#!/bin/sh
 
delay=0
timeout=10
retry=2
 
usage()
{
	echo "Usage: `basename $0` userid"
	exit 1
}
 
[ $# -ne 1 ] && usage
 
global_index=1
page=1
while true ; do
	echo "[INFO] Processing page $page"
	wget -q -O .tmp http://www.panoramio.com/user/$1?photo_page=$page
	if [ $? -ne 0 ] ; then
		echo "[WARNING] Can not get content of page $page"
		break
	fi
 
	if [ -z "$total" ] ; then
		total=`grep -iE '<a href="\/user\/.*\/stats' .tmp | head -n 1 | sed 's/.*stats">//;s/<.*//'`
	fi
	imgs=`grep -ioE '<a href="\/photo\/[0-9]*"$' .tmp | sed 's/.*\///;s/"//'`
	alts=`grep -ioE '^              >..*<\/a>$' .tmp | sed 's/<.*//;s/.*>//'`
 
	index=1
	for img in $imgs ; do
		url=http://static.panoramio.com/photos/original/$img.jpg
		alt=`{ for alt in $alts ; do echo $alt ; done } | head -n $index | tail -n 1`
		file=`echo $global_index | awk '{printf "%03d", $0}'`_$alt.jpg
		index=$((index+1))
		global_index=$((global_index+1))
 
		if [ -f $file ] ; then
			continue
		fi
 
		echo "[INFO] Downloading $url"
		wget -q --tries=$retry --timeout=$timeout -O "$file" "$url"
		if [ $? -ne 0 ] ; then
			rm -f "$file"
			echo "[WARNING] Failed to download $url to $file"
		fi
		sleep $delay
	done
 
	if [ $global_index -gt $total ] ; then
		break
	fi	
 
	page=$((page+1))
done
 
rm -f .tmp
 
exit 0
