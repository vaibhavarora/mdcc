#!/bin/bash
./describe-instances.sh tmp/servers.instances
mv launched.hosts servers.txt
./configure.sh servers.txt
./configure-clients.sh servers.txt clients.txt
./copy-mdcc-jar-servers.sh servers.txt
 ./run-servers.sh servers.txt
