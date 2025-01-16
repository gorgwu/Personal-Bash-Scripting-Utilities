#!/usr/bin/env bash

source ./Q3.sh

calc() {
    awk "BEGIN { print $* }";
}

if [ $# -eq 1 ]; then
    filename="$1"
else
    filename="grades"
fi

my_array=($(tail -n +2 "$filename" | cut -f3))

sum=""

for index in "${!my_array[@]}"; do

    my_array[$index]=$(letter2gp "${my_array[$index]}")

    if [ $index -eq 0 ]; then
        sum="${my_array[$index]}"
    else
        sum="$sum + ${my_array[$index]}"
    fi
done

sum="($sum) / ${#my_array[@]}"

calc "$sum"
