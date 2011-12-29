#!/bin/bash

# Copyright (C) 2012 by Ruben Vermeersch <ruben@savanne.be>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

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
