#!/bin/sh

for i in 1 2 3 4 5; do echo $i; done

read -p "please input a number : " n
a=$[$n%2]
case $a in 
1)
echo "The number $n is odd"
;;
0)
echo "The number $n is even"
;;
esac

if [ -d /home/lf ] ; then echo "/home/lf is dir." ; fi

if [ -f /home/lf/charm.txt ] ; then echo "/home/lf/charm.txt is file." ; fi

echo "Enter A = "
read A
echo "Enter B = "
read B
sum=$[$A+$B]
echo "sum is $sum"

today=$(date "+%Y-%m-%d %H:%M:%S")
yesterday=$(date -d yesterday +%Y-%m-%d)

y1=$(date -d "+1 day" "+%Y-%m-%d")

yy1=$(date -d "+ month" "+%Y-%m-%d")
yy2=$(date -d "+ year" "+%Y-%m-%d")

echo "today : ${today}"
echo "yesterday : ${yesterday}"
echo "y1 : ${y1}"
echo "yy1 : ${yy1}"
echo "yy2 : ${yy2}"

echo '$?='$?
echo '$#='$#
name=0001
name="刘飞"
echo "hello ${name}"
echo ${#name}
echo ${name:0:1}

echo "Is it morning? Please answer yes or no."

read YES_OR_NO

if [ "$YES_OR_NO" = "yes" ]; then
	echo "Good morning!"
elif [ "$YES_OR_NO" = "no" ]; then
	echo "Good afternoon!"
else
	echo "Sorry, $YES_OR_NO not recognized. Enter yes or no."
	exit 1
fi

echo "Enter Number."
read val 

test "$val" -gt 1 -a "$val" -lt 100 && (echo "enter number (1, 100).")
test "$val" -gt 100 && "$val" -lt 1000 && (echo "enter number (100, 1000).")

echo "Is it morning? Please answer yes or no."
read YN

case "$YN" in yes|y|Yes|YES)
	echo "Good morning!"
	;;
     [nN]*)
	echo "Good afternoon!"
	;;
     *)
	echo "Sorry, $YN not recognized. Enter yes or no."
	exit 1
	;;
esac

for skill in Ada Action Java; do
	echo "${skill}Script"
done

echo "Enter password:"
count=1
read TRY
while [ "$TRY" != "liufei1229" ];do
	if [ "$TRY" = "exit" ]; then
		echo "exit..."
		break;
	fi
	echo "Sorry, try again, Enter password : "
	echo "try times : ${count}"
	read TRY
	count=$(($count+1))	
done

is_directory()
{
 DIR_NAME=$1
 if [ ! -d $DIR_NAME ]; then
   return 1
 else
   return 0
 fi
}

for DIR in "$@"; do
  if is_directory "$DIR"
    then :
  else
    echo "$DIR doesn't exist. Creating it now..."
    mkdir $DIR > /home/lf/cron/echo.txt 2>&1
    if [ $? -ne 0 ]; then
      echo "Cannot create directory $DIR"
      exit 1
    fi
   fi
done

echo $(whoami)

test "$(whoami)" != "root" && (echo you are using a non-privileged account; exit 1)

exit 0
