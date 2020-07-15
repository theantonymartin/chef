#!/bin/bash

workstationip=10.10.62.241
serverip=10.10.60.237

i="1"
filename="$1"
temp=`wc -l < $1`
echo $temp
while [ $i -le $temp ]; do
  tempip=`cat "$1" | head -"$i" | tail -1`
  i=$(($i + 1))
 # echo hello $tempip
#   echo $line
  bash bootstrapnode.sh $tempip
  # echo "Over"
#   echo $line
done
