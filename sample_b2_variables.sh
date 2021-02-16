#!/usr/bin/env bash

declare key_id=""
declare application_key=""
declare destination_path="b2://big-nas-backup"
declare source_base_path="/media/big_nas"
declare -a source_paths=("test1"
                         "test2"
                        )
