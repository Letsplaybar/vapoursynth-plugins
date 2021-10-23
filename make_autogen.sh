#!/bin/bash
echo "build autogen ${1}" > /dev/stderr
cd ${1}
./autogen.sh
./configure
make -j4
cd ${2}