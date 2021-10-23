#!/bin/bash
cd ${1}
chmod +x configure
./configure --enable-shared
make -j4
cd ${2}