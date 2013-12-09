#!/bin/bash
counter = 0
for ip in `cat $1`
do
    runCommand="cd ~/mdcc-1.0/bin/;./storage-server.sh $counter"
    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i hatem.pem ubuntu@${ip} ${runCommand} &
    let counter++
done
echo "Done"
