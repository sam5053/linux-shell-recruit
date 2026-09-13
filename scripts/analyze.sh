#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 FILE" >&2
    exit 1
fi

log_file="$1"

if [[ ! -f "$log_file" ]]; then
    echo "Error: file not found: $log_file" >&2
    exit 1
fi

error_count=$(grep -c 'ERROR' -- "$log_file")

top_code=$(
    grep 'ERROR' -- "$log_file" |
        grep -o 'code=[^[:space:]]*' |
        cut -d= -f2 |
        sort |
        uniq -c |
        sort -nr |
        head -n 1 |
        awk '{print $2}'
)

printf 'Total ERROR: %s\n' "$error_count"
printf 'Top Code: %s\n' "$top_code"
