#!/bin/awk -f
BEGIN{
FS=","
}
{
	index=($1","code);
	data[index] += $2;
}
END{
	j=0;
	for(i in data){
		date="";
		if(j==0){
			split(i, dcv, ",");
                	date=dcv[1];
		}		
	}
	line=(date","data[i]);
	print line;
	j++;
}
