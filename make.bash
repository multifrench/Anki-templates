#!/bin/bash

for file in $(find . -type f -name '*.less'); do
    parent_dir=$(dirname $file);
    if [ $parent_dir = "." ] || [ $parent_dir = "./less" ]; then
        continue;
    fi 
    filename_without_extension=$(basename $file .less);
    output_filename="$parent_dir/$filename_without_extension.css";
    lessc $file $output_filename;
done
