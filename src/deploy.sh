#!/bin/bash

# TODO: Loads of error checking and boundary condition checks.

if [ "" == "$1" ]; then
    echo "Usage: depploy-to <branch>";
    exit;
fi

git checkout $1
git pull
git merge master
git push origin $1
