#!/bin/bash

# TODO: Loads of error checking and boundary condition checks.

if [ "" == "$1" ]; then
    echo "Usage: depploy-to <branch>";
    exit;
fi

print_header() {
    echo -e "\033[1;32m###\033[0m \033[34m$1\033[0m"
}

print_progress() {
    echo -e "\033[1;32m### ->\033[0m \033[34m$1\033[0m"
}

print_header "Deploying to $1"

print_progress "Switching to $1"
git checkout -q -B $1 origin/$1

print_progress "Pulling latest changes"
git pull

print_progress "Merging master"
git merge master

print_progress "Pushing changes upstream"
git push origin $1

print_progress "Switching back to master"
git checkout master

print_progress "All done"
