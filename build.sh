#!/bin/bash

set -e
mkdir -p build/
cd yaml/
configs=("teckin-sp22-rtl8710bn-2mb-788k")
for config in ${configs[@]}; do
	esphome compile ${config}.yaml
	cp .esphome/build/${config}/.pioenvs/${config}/firmware.uf2 ../build/${config}-$1.uf2
	cp .esphome/build/${config}/.pioenvs/${config}/*.ota.rbl ../build/ || true
	cp .esphome/build/${config}/.pioenvs/${config}/*.ota.ug.bin ../build/ || true
done
