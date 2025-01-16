#!/usr/bin/env bash

source ./Q3.sh

calc() { 
    awk "BEGIN { print $*}"; 
}

if [ $# -eq 0 ]; then
    echo "USAGE: g4yr.sh yr [gradefile]"
    exit 1
fi

if [ $# -gt 2 ]; then
    echo "g4yr.sh: expecting one or two arguments, ignoring extra arguments"
fi


my_file="grades"
if [ $# -ge 2 ]; then
    my_file="$2"
fi

if [ ! -f "$my_file" ]; then
    echo "g4yr.sh: $my_file is not a regular file"
    exit 2
fi
if [ ! -r "$my_file" ]; then
    echo "g4yr.sh: $my_file is not readable"
    exit 2
fi

my_year="$1"
year_up=$((my_year + 1))

my_array=($(grep -E "$my_year F|$year_up W|$year_up S" "$my_file" | cut -f3))
if [ ${#my_array[@]} -eq 0 ]; then
    exit 0
fi

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
