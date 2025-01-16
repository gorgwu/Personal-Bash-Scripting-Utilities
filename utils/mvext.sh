#!/usr/bin/env bash

if [ $# -eq 1 ]; then
    arg="$1"
    for curr_file in *."$arg"; do
        if [[ "$curr_file" == *."$arg" ]]; then
            mv "$curr_file" "${curr_file%.$arg}"
        fi
    done
else
    old_arg="$1"
    new_arg="$2"
    for curr_file in *."$old_arg"; do
        if [[ "$curr_file" == *."$old_arg" ]]; then
            mv "$curr_file" "${curr_file%.$old_arg}.$new_arg"
        fi
    done
fi
