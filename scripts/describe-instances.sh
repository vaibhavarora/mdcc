#!/bin/bash
rm tmp/description
counter=0
arr=(us-east-1 us-west-2 us-west-1 eu-west-1 ap-southeast-1)
for instances in `cat $1`
do
  reg=${arr[$counter]}
  ec2-describe-instances $instances -K vaibhav.pem -C cert.pem --region $reg | grep INSTANCE | grep running >> tmp/description
  let counter++
done

cat tmp/description | awk '{print $4}' > launched.hosts
