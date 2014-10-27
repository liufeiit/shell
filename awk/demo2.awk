#!/bin/bash

awk -F "," '
BEGIN{
	print "begin awk test"
}

{
	split($3, param, "&"); 
	for(p in param)
	{
		if(match(param[p], "lf"))
		{
			split(param[p], v, "="); 
			channel[v[2]]++;
		}
	}
}

END{
	for(c in channel)
	{ 
		print c, channel[c]; 
	}
}' $1



