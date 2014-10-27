#/bin/bash

if [ $# -eq 0 ]; then
	echo "Usage:sh $0 [filename|today|yesterday|days] version"
	exit 1
fi

DIRPATH="../../user_access"
if [ $1 = "today" ];then
        DATE=`date +%Y-%m-%d`
        FILENAME=$DATE.log
elif [ $1 = "yesterday" ]; then

        DATE=`date -d "yesterday"  +%Y-%m-%d`
        FILENAME=$DATE.log
elif [ `echo $1|cut -c1-5` = "2014-" ]; then
        FILENAME=$1
else
        DATE=`date -d "$1 days"  +%Y-%m-%d`
        FILENAME=$DATE.log
fi

FILENAME=$DIRPATH/$FILENAME

VERSION=""

if [ $# -eq 2 ]; then
	VERSION=$2
fi

awk -F "," -v n_version="$VERSION" '{
		if($11=="-7001"){

			split($13,param,"&");
			for(p in param){

				split(param[p],ppp,"=");
				if(ppp[1]=="version"){

					version[ppp[2]]++;
					#统计对应版本的接口调用类型

					if(n_version==ppp[2]){
						api[$4]++;
					}
				}

			}
		}
}END{
	for(v in version){
		print v, version[v]
	}
	for(a in api){
		print a, api[a]
	}
}' $FILENAME
