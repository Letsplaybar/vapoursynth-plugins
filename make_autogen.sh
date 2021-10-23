#!/bin/bash
cd ${1}
./autogen.sh
./configure --enable-shared
make -j4
cd ${2}