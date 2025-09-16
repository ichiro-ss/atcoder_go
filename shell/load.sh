#!/bin/bash

sendfile="main.go"

dir=$(cat ./contest)
echo -e CONTEST: $dir
echo -n QUESTION?
read q
cp -i _result/_$dir/$q/$sendfile $sendfile
