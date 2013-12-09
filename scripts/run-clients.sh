#!/bin/bash
runCommand='cd ~/workspace/PaxosCP3/Benchmark-YCSB;./run_MDCC.sh 10 50000 20 1000 0.5 0.5 > ~/mdcc-experiment-data'
for ip in `cat $1`
do
    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i hatem.pem ubuntu@${ip} ${runCommand} &
done
echo "Done"
