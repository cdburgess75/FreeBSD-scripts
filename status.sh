#!/bin/bash

configFile="/root/v1/v1.config"
logFile="$(cat $configFile | awk '/LogFile/ {print $2}')"
serial="$(/usr/sbin/system_profiler SPHardwareDataType | /usr/bin/awk '/Serial\ Number\ \(system\)/ {print $NF}')"

