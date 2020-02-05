#!/usr/bin/env bash

rm -f Makefile.coq Makefile.HoTT

#   This is a modification of the original configuration file to only
#   build the HoTT files and to be able to configure the directory
#   in which the HoTT library can be found.

dir1=${1:-$PWD}

if command -v $dir1/hoqc >/dev/null 2>&1
then
    sed -i "8s@.*@COQC = \"$dir1/hoqc\"@" _HoTTProject
    sed -i "9s@.*@COQTOP = \"$dir1/hoqtop\"@" _HoTTProject
    sed -i "10s@.*@COQDEP = \"$dir1/hoqdep\"@" _HoTTProject
    coq_makefile -f _HoTTProject -o Makefile.HoTT
else
    echo "Error: hoqc not found in $dir1"
fi
