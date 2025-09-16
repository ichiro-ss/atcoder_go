#!/bin/bash

sendfile="main.go"

dir=$(cat ./contest)
echo -e CONTEST: $dir
mkdir -p _result/_$dir/$1
mv -i $sendfile _result/_$dir/$1
git add _result/_$dir/$1/$sendfile
git commit -m "$dir $1"
cp -i _template/$sendfile ./$sendfile
