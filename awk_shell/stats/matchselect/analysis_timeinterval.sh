#!/bin/bash

timeinterval=0
awk -F"," '
{
	time=$1;
	split($13,param,"&");
	for(p in param)
	{
		if(match(param[p],"queue_channel="))
		{
			split(param[p],v,"=");
			channel[v[2]]++
		}
	}
}
END{
	for(c in channel)
	{
		print c, channel[c]
	}
}' $1
