#!/bin/bash
cd $(dirname $0)
source "utility_scripts/trap_err.sh"
source "bash_variables.sh"

touch "output"

for i in "${source_paths[@]}"; do
    echo "Backing up $i"
    echo -e "\nBacking up $i" >> output
    if [ -n "${local_user}" ]; then
        sudo su -c "rsync -avsW ${rsync_options} -e \"${shell_option}\" \"${login}:${source_base_path}/${i}\" \"${destination_path}\"" ${local_user} >> output
    else
        rsync -avsW ${rsync_options} -e "${shell_option}" "${login}:${source_base_path}/${i}" "${destination_path}" >> output
    fi
done

echo "Sending email"
./utility_scripts/email.php

rm output

