#!/bin/bash

sendfile="main.go"

echo -e CONTEST?
read dir
echo -n QUESTION?
read q
mkdir -p _result/_$dir/$q
mv -i main.go _result/_$dir/$q
git add _result/_$dir/$q/$sendfile
git commit -m "$dir $q"
cp -i _template/$sendfile ./$sendfile
