#!/bin/bash

HOST_IP=10.30.50.223

./expect.exp $HOST_IP
./scp.exp

cd /home/lwang/zl/shell/ssh

tail -n 6 *.txt > last6.ini

line1=`sed -n "1p" last6.ini`
line2=`sed -n "2p" last6.ini`
line3=`sed -n "3p" last6.ini`
line4=`sed -n "4p" last6.ini`
line5=`sed -n "5p" last6.ini`
line6=`sed -n "6p" last6.ini`

IP_NUM1=${line1:21:13}
IP_NUM2=${line2:21:13}
IP_NUM3=${line3:21:13}
IP_NUM4=${line4:21:13}
IP_NUM5=${line5:21:13}
IP_NUM6=${line6:21:13}


echo $IP_NUM1
echo $IP_NUM2
echo $IP_NUM3
echo $IP_NUM4
echo $IP_NUM5

./login_core.exp $HOST_IP $IP_NUM1
./login_core.exp $HOST_IP $IP_NUM2
./login_core.exp $HOST_IP $IP_NUM3
./login_core.exp $HOST_IP $IP_NUM4
./login_core.exp $HOST_IP $IP_NUM5
./login_core.exp $HOST_IP $IP_NUM6

while [ 1 ]
do
	./core_scp.exp $HOST_IP $IP_NUM1 1
    ./core_scp.exp $HOST_IP $IP_NUM2 2
    ./core_scp.exp $HOST_IP $IP_NUM3 3
    ./core_scp.exp $HOST_IP $IP_NUM4 4
    ./core_scp.exp $HOST_IP $IP_NUM5 5
    ./core_scp.exp $HOST_IP $IP_NUM6 6

file_num=`find /home/lwang/zl/shell/ssh/result -type f | wc -l`
right_num=6

./scp_log.exp

if [ $file_num -eq $right_num ]
then
	break
fi


#./scp_log.exp


done
