#!/bin/sh -l

set -e # if a command fails it stops the execution
set -u # script fails if trying to access to an undefined variable

mkdir output

find . -maxdepth 1 -not -path './output' -not -path '.' -not -path '*/.*' -exec cp -r '{}' output/ \;
find ./output -type f ! -name "*.md" -and ! -name "*.ipynb" -and ! -name "*.png" -delete

cd output/

path="${1}"
pathA=$(echo "$path" | sed "s/git/https/")
echo $pathA

sed -i "s~GITHUB-URL~$pathA~g" README.md

more README.md

cd ..

