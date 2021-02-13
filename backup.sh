#!/bin/bash
cd $(dirname $0)
source "utility_scripts/trap_err.sh"
source "bash_variables.sh"

for i in "${source_paths[@]}"; do
    echo "Backing up $i"
    if [ -n "${local_user}" ]; then
        sudo su -c "rsync -avzs ${rsync_options} -e \"${shell_option}\" \"${login}:${source_base_path}/${i}\" \"${destination_path}\"" ${local_user}
    else
        rsync -avzs ${rsync_options} -e "${shell_option}" "${login}:${source_base_path}/${i}" "${destination_path}"
    fi
done

echo "Sending email"
./utility_scripts/email.php
