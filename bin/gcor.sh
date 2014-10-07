#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'gcor: needs a branch name'
    exit 0
fi

echo "Pulling from remote: $1"
git checkout --track origin/$1
