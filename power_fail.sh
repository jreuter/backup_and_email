#!/bin/bash
cd $(dirname $0)
source "utility_scripts/trap_err.sh"
#source "bash_variables.sh"

touch "ups-output"

MESSAGE="Warning: The $EVENT event has occurred for a while, system will be shutdown immediately!"

RUNTIME=""

if [ ! -z "$REMAINING_RUNTIME" ]; then
        RUNTIME="Remaining Runtime: $REMAINING_RUNTIME Seconds"
fi

DATA=(
"========================================================"
"   $SUBJECT"
"========================================================"
""
""
"$MESSAGE"
"Time: $DATE"
""
""
"UPS Model Name: $MODEL_NAME"
"Battery Capacity: $BATTERY_CAPACITY %"
"$RUNTIME"
)

echo $DATA >> ups-output

pwrstat -status >> ups-output

echo "Sending email"
./utility_scripts/ups-email.php

rm ups-output

