#!/bin/bash
dir=$(cat ./contest)
echo -e CONTEST: $dir

rm -rf test
echo http://$dir.contest.atcoder.jp/tasks/$dir"_"$1
oj download http://$dir.contest.atcoder.jp/tasks/$dir"_"$1
cp test/sample-1.in input
