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

print_error() {
    echo -e "\033[1;31m### ->\033[0m \033[34m$1\033[0m"
}

print_header "Deploying to $1"

if [ -d "node_modules" ]; then
    git ls-files --others -i --exclude-standard | grep -q ^node_modules
    ignored=$?
    if [ $ignored -gt 0 ]; then
        print_error "node_modules exists but is not in .gitignore, aborting!"
        exit
    fi
fi

print_progress "Switching to $1"
git checkout -q -B $1 origin/$1 | grep -v 'set up to track remote branch'

print_progress "Pulling latest changes"
git pull -q

print_progress "Merging master"
git merge -q master

print_progress "Pushing changes upstream"
git push -q

print_progress "Switching back to master"
git checkout -q master

print_progress "All done"
