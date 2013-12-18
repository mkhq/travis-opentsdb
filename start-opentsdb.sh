#!/bin/bash

cd opentsdb-2.0.0
# create hbase tables
echo "Create hbase tables"
env JRUBY_OPTS= ../hbase-0.96.0-hadoop2/bin/hbase shell ../create-opentsdb-tables.sh

echo "Create tables wait..."
sleep 10

echo "Create temp cache dir"
tsdtmp=${TMPDIR-'/tmp'}/tsd
mkdir -p "$tsdtmp"
./build/tsdb tsd --port=4242 --staticroot=build/staticroot --cachedir="$tsdtmp" --config=src/opentsdb.conf &
echo $! > /tmp/opentsdb.pid

echo "Waiting for opentsdb to start"
sleep 10
cd ..
