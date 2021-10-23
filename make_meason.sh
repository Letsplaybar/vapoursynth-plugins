#!/bin/bash
echo "build meason ${1}" > /dev/stderr
cd ${1}
meson build
ninja -C build
cd ${2}