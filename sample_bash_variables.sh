#!/usr/bin/env bash

declare shell_option="ssh -p 22"
declare login="username@your_server.example.com"
declare local_user="username"
declare rsync_options="--bwlimit=1024 --delete-after"
declare destination_path="/media/data/backup/"
declare source_base_path="/media/data"
declare -a source_paths=("test1"
                         "test2"
                        )
