#!/usr/bin/env bash

if [[ $# -lt 2 ]]; then
    echo "Usage: $0 DEST FILE..." >&2
    exit 1
fi

destination="$1"
shift

mkdir -p -- "$destination"

for file in "$@"
do
    cp -- "$file" "$destination/"
done
