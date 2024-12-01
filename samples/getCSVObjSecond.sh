#!/bin/bash

dir=$(dirname "$(realpath "$0")")
echo "a,b"
for f in $(ls $dir/secondModel/*.sol | sort -V); do
    num=$(basename "$f" | grep -oE '[0-9]+')
    obj=$(grep "OBJECTIVE" "$f" | grep -oE '[0-1]\.[0-9]+')

    if [[ -z "$obj" ]]; then
        obj="0.00"
    fi

    echo "$obj,$num"
done

