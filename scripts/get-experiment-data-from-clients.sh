#!/bin/bash
counter=0
for ip in `cat $1`
do
    scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i vaibhav.pem ubuntu@${ip}:~/workspace/PaxosCP3/Benchmark-YCSB/benchmark_results.out experimental-data/results-out-${counter}
    grep "COMMIT" experimental-data/results-out-${counter} | grep "Return" | cut -f 2 -d "=" > experimental-data/commit-results-out-${counter}
    grep "Throughput" experimental-data/results-out-${counter} |  cut -f 3 -d "," > experimental-data/throughput-results-out-${counter}
    let counter++
done
echo "Done"
