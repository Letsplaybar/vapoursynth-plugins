#!/bin/bash
echo "install meason ${1}" > /dev/stderr
cd ${1}
ninja -C build install
cd ${2}