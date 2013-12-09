#!/bin/bash
#This launches n instances of mdcc Amis in 5 different data centers. can be used both as clients and servers 
# pass in number of instances required in each data center
mv tmp/servers.instances tmp/servers.instances.old
ec2-run-instances ami-3305515a -K vaibhav.pem -C cert.pem -k vaibhav -n $1 -t c1.xlarge -z us-east-1a | awk '{if (NR>1) {print $2}}' >> tmp/servers.instances
ec2-run-instances ami-7efa644e -K vaibhav.pem -C cert.pem -k vaibhav -n $1 -t c1.xlarge --region us-west-2 | awk '{if (NR>1) {print $2}}' >> tmp/servers.instances
ec2-run-instances ami-6c3c0829 -K vaibhav.pem -C cert.pem -k vaibhav -n $1 -t c1.xlarge --region us-west-1 | awk '{if (NR>1) {print $2}}' >> tmp/servers.instances
ec2-run-instances ami-2209ee55 -K vaibhav.pem -C cert.pem -k vaibhav -n $1 -t c1.xlarge --region eu-west-1 | awk '{if (NR>1) {print $2}}' >> tmp/servers.instances
ec2-run-instances ami-7c115b2e -K vaibhav.pem -C cert.pem -k vaibhav -n $1 -t c1.xlarge --region ap-southeast-1 | awk '{if (NR>1) {print $2}}' >> tmp/servers.instances

