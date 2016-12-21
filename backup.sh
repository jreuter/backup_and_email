#!/bin/bash
source "utility_scripts/trap_err.sh"
source "utility_scripts/root_guard.sh"
source "variables.sh"

for i in "${paths[@]}"; do
    echo "Backing up $i"
    if [ -n "${local_user}" ]; then
        sudo su -c "rsync -avzP -e \"${shell_option}\" ${login}:${base_path}/${i} /media/data/backup2/" ${local_user}
    else
        rsync -avzP -e "${shell_option}" ${login}:${base_path}/${i} /media/data/backup2/
    fi
done
