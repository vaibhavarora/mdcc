#!/usr/bin/python
import sys
import os
# finds the avg commit latency of commited transactions
avgThroughput = 0
num = 0
while num < 15:
  commitFile = open("experimental-data/throughput-results-out-"+str(num),"r")

  for line in commitFile.readlines():
	numbers = line.strip()
	throughput=float(numbers)
	avgThroughput = avgThroughput + throughput

  num += 1
  if num % 3 == 0:
    avgThroughput = avgThroughput / 3
    print avgThroughput
    avgThroughput = 0
 
