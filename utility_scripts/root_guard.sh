#!/usr/bin/env bash

if [[ $UID -ne 0 ]]; then
    echo "Error: must be run as root." >&2
    exit 1
fi
