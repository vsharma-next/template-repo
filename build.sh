#!/bin/sh -l

set -e # if a command fails it stops the execution
set -u # script fails if trying to access to an undefined variable


mkdir output

#find . ! -regex '.*/output' ! -regex '.' -not -path '*/.*' -exec cp -r '{}' output \;

#find . -not -path './output' -not -path '.' -not -path '*/.*'

find . -maxdepth 1 -not -path './output' -not -path '.' -not -path '*/.*' -exec cp -r '{}' output/ \;

find ./output -type f ! -name "*.md" -and ! -name "*.ipynb" -delete

cd output/

path="${1}"
echo $path

sed -i "s~GITHUB-URL~$path~g" README.md

more README.md

cd ..

