#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 source_directory destination_directory interval_secs max_backups"
    exit 1
fi

# Assign provided arguments to variables
src_dir="$1"
dest_dir="$2"
interval_secs="$3"
max_backups="$4"

# Infinite loop
while true; do
    ls -Rl "$src_dir" > current_status.txt
    changed=$(diff current_status.txt last_status.txt | wc -l)
    echo "$changed"
    if [ "$changed" -eq 0 ]; then
        echo "Not changed"
    else
        echo "Changed"
        new_dir=$(date +'%Y%m%d-%H%M%S')
        mkdir "$dest_dir/$new_dir"
        cp -r "$src_dir/" "$dest_dir/$new_dir/"
        cat current_status.txt > last_status.txt
        count=$(ls "$dest_dir" | wc -l)
        if [ "$count" -eq "$max_backups" ]; then
            find "$dest_dir" -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 ls -td | tail -n 1 | xargs rm -r
        fi
    fi
    sleep "$interval_secs"
done