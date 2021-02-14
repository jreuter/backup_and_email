#!/bin/bash
cd $(dirname $0)
source "utility_scripts/trap_err.sh"
source "b2_variables.sh"

touch b2_output
for i in "${source_paths[@]}"; do
    echo "Backing up $i" >> b2_output
    ./b2-linux authorize-account ${key_id} ${application_key}
    ./b2-linux sync "${source_base_path}/${i}" "${destination_path}/${i}"
done

echo "Sending email"
./utility_scripts/b2email.php
rm b2_output
