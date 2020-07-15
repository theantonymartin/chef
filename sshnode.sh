#!/bin/sh
nodeip=$1
wsip=$2
serverip=$3

oldIFS=$IFS
IFS='.'
read -ra ADDR <<<"$nodeip"
node='ip'
for i in "${ADDR[@]}"; #accessing each element of array  
do  
node="$node-$i"  
done
# echo $node
# echo $1

read -ra ADDR <<<"$wsip"
ws='ip'
for i in "${ADDR[@]}"; #accessing each element of array  
do  
ws="$ws-$i"  
done
# echo $ws

read -ra ADDR <<<"$serverip"
ms='ip'
for i in "${ADDR[@]}"; #accessing each element of array  
do  
ms="$ms-$i"  
done
IFS=oldIFS

node="$1\ $node"
ws="$2\ $ws"
ms="$3\ $ms"

# echo $node $ws $ms

if ssh ubuntu@$1 "sudo sed -i "2i$node" /etc/hosts; sudo sed -i "3i$ws" /etc/hosts; sudo sed -i "4i$ms" /etc/hosts; exit" ; then
	echo "Done $1"
else
	echo "Could not ssh into $1"
fi
