#!/bin/bash
echo "build config ${1}" > /dev/stderr
cd ${1}
chmod +x configure
./configure
make -j4
cd ${2}