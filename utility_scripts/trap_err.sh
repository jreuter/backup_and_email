#!/usr/bin/env bash

function err_trap() {
    echo "ERROR: Command '$1' on line $2 failed with status $?." >&2
    exit 1
}
trap 'err_trap "$BASH_COMMAND" $LINENO $?' ERR
