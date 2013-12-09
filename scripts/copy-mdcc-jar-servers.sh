#!/bin/bash
counter = 0
for ip in `cat $1`
do
    scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i hatem.pem core/target/mdcc-core-1.0.jar ubuntu@${ip}:~/mdcc-1.0/lib/
    scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i hatem.pem log4j.properties ubuntu@${ip}:~/mdcc-1.0/lib/
done
echo "Done"
