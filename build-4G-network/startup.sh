#!/usr/bin/env bash
exec sudo service openvpn start &

while ! ping -c 1 -W 1 8.8.8.8; do
    echo "Just pinging google"
    sleep 1
done


## Running passed command
if [[ "$1" ]]; then
        eval "$@"
fi