#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Usage: hide.sh FILE" >&2
    exit 1
fi

file_path="$1"

directories=$(dirname "$file_path")
file=$(basename "$file_path")

hidden_file_path="${directories}/.${file}"

mv -i "$file_path" "$hidden_file_path"
