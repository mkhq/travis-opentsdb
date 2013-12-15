#!/bin/bash

cd hbase-0.96.0-hadoop2

./bin/start-hbase.sh

echo "Waiting for hbase to start..."
sleep 10

echo "HBase logs"
cat logs/*

cd ..
