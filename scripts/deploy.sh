#!/bin/bash

SETUP_DIR=/home/vaibhav/work/alquam/mdcc/setup
mvn clean install -o

cp -v core/target/*.jar $SETUP_DIR/node1/lib
cp -v core/target/*.jar $SETUP_DIR/node2/lib
cp -v core/target/*.jar $SETUP_DIR/node3/lib
cp -v core/target/*.jar $SETUP_DIR/node4/lib
cp -v core/target/*.jar $SETUP_DIR/node5/lib

