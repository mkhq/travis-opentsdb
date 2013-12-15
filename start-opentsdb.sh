#!/bin/bash

cd opentsdb-2.0.0
# create hbase tables
echo "Test the hbase shell"
echo "create 't3', 'f1'" | JRUBY_OPTS= JRUBY_HOME= ../hbase-0.96.0-hadoop2/bin/hbase shell -d

echo "Create hbase tables"
env JRUBY_OPTS= JRUBY_HOME= COMPRESSION=NONE HBASE_HOME=../hbase-0.96.0-hadoop2 ./src/create_table.sh

echo "Create tables wait..."
sleep 10

echo "Create temp cache dir"
tsdtmp=${TMPDIR-'/tmp'}/tsd
mkdir -p "$tsdtmp"
./build/tsdb tsd --port=4242 --staticroot=build/staticroot --cachedir="$tsdtmp" --config=src/opentsdb.conf &
echo $! > /tmp/opentsdb.pid
cd ..