#!/bin/bash

wget https://github.com/OpenTSDB/opentsdb/releases/download/v2.0.0RC2/opentsdb-2.0.0.tar.gz
tar xzf opentsdb-2.0.0.tar.gz
cd opentsdb-2.0.0
patch -p1 < ../scripts/ci/opentsdb-protobuf.patch
./build.sh
patch -p0 < ../scripts/ci/opentsdb-conf.patch
cp ../scripts/ci/asynchbase-1.4.1.jar build/third_party/hbase/
cd ..
