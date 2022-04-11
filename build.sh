#!/bin/sh -l

set -e # if a command fails it stops the execution
set -u # script fails if trying to access to an undefined variable


mkdir output

find . ! -regex '.*/output' ! -regex '.' -exec cp -r '{}' output \;

find ./output -type f ! -name "*.md" -and ! -name "*.ipynb" -delete

cd output/

path="${PWD}"
echo $path

sed -i "s~GITHUB-URL~$path~g" README.md

cd ..

