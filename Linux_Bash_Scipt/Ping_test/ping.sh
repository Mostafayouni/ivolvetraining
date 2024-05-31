#!/bin/bash

subnet="192.168.8"
for host in {0..250}; do
    ip="$subnet.$host"
    if ping -c 1 "$ip" &> /dev/null; then
        echo "Server $ip is up and running."
    else
        echo "Server $ip is unreachable."
    fi
done
