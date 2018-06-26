#!/bin/bash


file_num=`find /home/lwang/zl/shell/ssh/result -type f | wc -l`
right_num=2

while [ 1 ]
do
	echo "hello world"
	sleep 1
	if [ $file_num -eq $right_num ]
	then
		break	
	fi
done
