#!/bin/bash
cd $(dirname $0)
source "utility_scripts/trap_err.sh"
source "bash_variables.sh"

for i in "${paths[@]}"; do
    echo "Backing up $i"
    if [ -n "${local_user}" ]; then
        sudo su -c "rsync -avzP -e \"${shell_option}\" ${login}:${base_path}/${i} /media/data/backup2/" ${local_user}
    else
        rsync -avzP -e "${shell_option}" ${login}:${base_path}/${i} /media/data/backup2/
    fi
done

echo "Sending email"
./utility_scripts/email.php
