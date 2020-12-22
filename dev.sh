#!/bin/bash
set -ex
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

exec="./test.sh $@"
cmd="nodemon \
    -w . \
    -e yaml,sh,cfg -x sh -- -c 'time $exec'"
eval $cmd
