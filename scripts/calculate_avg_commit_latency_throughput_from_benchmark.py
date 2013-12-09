#!/usr/bin/python
import sys
import os
# finds the avg commit latency of commited transactions
count = 0
latency = 0
nTimes = 0
num = 0
while num < 15:
  commitFile = open("experimental-data/commit-results-out-"+str(num),"r")

  for line in commitFile.readlines():
	numbers = line.split(", ")
	latencyInstance=int(numbers[0])
	nTimes=int(numbers[1])	
	if latencyInstance <= 0:
		#print "hi"
		continue
	latency = latency + (latencyInstance*nTimes)
	count = count + nTimes

  avgLatency = latency / count
  num += 1
  if num % 3 == 0:
    print avgLatency, count
    count = 0
    latency = 0
    nTimes = 0
 
