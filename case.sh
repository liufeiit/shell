#!/bin/sh

echo '$0 = ' $0
echo '$1 = ' $1
echo '$2 = ' $2


echo '$0: '$0
echo "pwd: "`pwd`
echo "scriptPath1: "$(cd `dirname $0`; pwd)
echo "scriptPath2: "$(dirname $(readlink -f $0))

