#!/bin/bash

./build-all.sh

if [ $? -eq 0 ]; then
    docker push afdaniele/rpi-ros-blockly-backend:latest
fi
