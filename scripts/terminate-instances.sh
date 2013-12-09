#!/bin/bash
counter=0
arr=(us-east-1 us-west-2 us-west-1 eu-west-1 ap-southeast-1)
for instanceID in `cat $1`
do
  reg=${arr[$counter]}
  ec2-terminate-instances $instanceID -K vaibhav.pem -C cert.pem --region $reg
  # This logic is for teminating 1 instance in 1 region. Has to changed if we are launching multiple servers in each region
  let counter++
done
