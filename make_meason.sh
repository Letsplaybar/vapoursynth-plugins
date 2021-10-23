#!/bin/bash
cd ${1}
meson build
ninja -C build
cd ${2}