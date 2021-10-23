#!/bin/bash
cd ${1}
./autogen.sh
./configure
make -j4
cd ${2}