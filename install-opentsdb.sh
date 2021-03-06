#!/bin/bash

wget https://github.com/OpenTSDB/opentsdb/releases/download/v2.0.0RC2/opentsdb-2.0.0.tar.gz
tar xzf opentsdb-2.0.0.tar.gz
cd opentsdb-2.0.0
patch -p1 < ../opentsdb-protobuf.patch
patch -p0 < ../opentsdb.patch
rm third_party/hbase/asynchbase-1.4.1.jar*
cp ../asynchbase-1.5.0-rc2.jar* third_party/hbase/
./bootstrap
./build.sh
cd ..
