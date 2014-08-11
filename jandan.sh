#!/bin/sh
 
delay=0
timeout=10
retry=2
 
usage()
{
	echo "Usage: `basename $0` frompage topage"
	exit 1
}
 
[ $# -ne 2 ] && usage
[ $1 -le 0 ] || [ $2 -le 0 ] || [ $1 -gt $2 ] && usage
 
page=$1
while [ $page -le $2 ] ; do
	echo "[INFO] Downloading page $page ..."
 
	imgs=`wget -q -O - http://jandan.net/ooxx/page-$page | grep -ioE '<img src="http.*\.(jpg|gif)" */>' | sed 's/<[Ii][Mm][Gg].*[Ss][Rr][Cc]\s*=\s*"*//;s/[" ].*//'`
	[ -z "$imgs" ] && {
		echo "[WARNING] Failed to get image list of page $page"
		page=$((page+1))
		continue
	}	   
 
	index=1
	for img in $imgs ; do
		wget -q --tries=$retry --timeout=$timeout -O "$page-$index.${img##*.}" "$img"
		if [ $? -ne 0 ] ; then
			rm -f "$page-$index.${img##*.}"
			echo "[WARNING] Failed to download $img"
		else
			index=$((index+1))
		fi
	done
 
	page=$((page+1))
	[ $page -le $2 ] && sleep $delay
done
 
exit 0
