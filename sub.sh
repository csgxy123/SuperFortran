#!/bin/bash

if [ $# -eq 0 ] 
then
    echo "usage: sub.sh filename"
    exit 1
fi

echo "Test " $1

cp $1 $MEMBERWORK/ast111/.
cd $MEMBERWORK/ast111/
aprun ./$1
cd ~/SuperFortran/
