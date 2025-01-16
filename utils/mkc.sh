#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    exit 0
fi

str="$1"

upper_str=$(echo "$str" | tr "a-z" "A-Z")

h_file="${str}.h"
echo "#ifndef ${upper_str}_H" > $h_file
echo "#define ${upper_str}_H" >> $h_file
echo "" >> $h_file
echo "#endif" >> $h_file

c_file="${str}.c"
echo "#include \"${str}.h\"" > $c_file
