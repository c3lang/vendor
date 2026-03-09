#!/usr/bin/env bash
set -e
shopt -s nullglob

mkdir -p temp

for lib in libraries/*.c3l; do
    name=$(basename "$lib")

    echo "Packaging $name"

    (
        cd "$lib"
        zip -r "../../temp/$name" . -x "*.DS_Store"
    )
done
