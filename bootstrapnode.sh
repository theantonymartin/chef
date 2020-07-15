#!/bin/sh
cd ~/chef-repo/.chef

oldIFS=$IFS
IFS='.'
read -ra ADDR <<<"$1"
hn='ip'
for i in "${ADDR[@]}"; #accessing each element of array
do
hn="$hn-$i"
done
IFS=oldIFS
echo hello $hn
knife bootstrap $1 --ssh-user ubuntu --sudo --node-name $hn
knife client list
