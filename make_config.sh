#!/bin/bash
cd ${1}
chmod +x configure
./configure
make -j4
cd ${2}