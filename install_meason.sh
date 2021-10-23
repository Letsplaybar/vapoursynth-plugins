#!/bin/bash
cd ${1}
ninja -C build install
cd ${2}