#!/bin/bash
set -e
source "variables.sh"

for i in "${paths[@]}"; do
    echo "Backing up $i"
    rsync -avzP -e "${shell_option}" $login:$base_path/$i /media/data/backup2/
done
