#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "Usage: avglcn.sh FILE1 [FILE]..." >&2
    exit 1
fi

total=$(wc -l "$@" | tail -n 1 | ./triml.sh | cut -d ' ' -f 1)

average=$((total / $#))

echo "$average"
