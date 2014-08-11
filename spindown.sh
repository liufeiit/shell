#!/bin/sh
 
DISK=sda
TIMEOUT=600
 
if [ $# -ge 1 ] ; then
    DISK=$1
fi
if [ $# -ge 2 ] ; then
    TIMEOUT=$2
    TIMEOUT=$((TIMEOUT*60))
fi
 
status=`hdparm -C /dev/$DISK | grep -o standby`
if [ "$status" = "standby" ] ; then
    exit 0
fi
 
for i in `seq 1 $TIMEOUT` ; do
    io=`cat /proc/diskstats | grep "$DISK " | awk '{print $(NF-2)}'`
    if [ $io -gt 0 ] ; then
        exit 0
    fi
    sleep 1
done
 
logger "Sending standby command to /dev/$DISK"
sdparm -C stop /dev/$DISK > /dev/null
 
exit 0
