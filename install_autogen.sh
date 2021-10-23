#!/bin/bash
echo "autogen/config install ${1}" > /dev/stderr
cd ${1}
make install
cd ${2}