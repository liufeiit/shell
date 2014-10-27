#!/bin/bash
awk -F ","
"BEGIN
{
print name, count
}
{
if($2 == 900){item[$1]++}
}
END
{
for(i in item){
print i, item[i]
}
}" $1
