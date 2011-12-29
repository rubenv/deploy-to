# Git deployment utility script.

  Merges the master branch to another branch and pushes it.

  Developed by Flow Pilots: http://www.flowpilots.com/

## Usage
  
  You can install the latest version via npm:
  
    $ npm install -g deploy-to

  Go to your git repository and invoke the script:

    $ cd /path/to/my/repo
    $ deploy-to production

  This will:
  
  1. Check that node\_modules is in .gitignore (if present).
  2. Switch to the target branch.
  3. Pull the latest version of that branch.
  4. Merge the master branch into this branch.
  5. Push the branch.

  In this case it would merge any changes from master onto the production
  branch and push them upstream. Add git hooks to the server to perform further
  deployment steps.

## Rationale

  At Flow Pilots, we develop our work on a master branch. Deployment to servers
  happens using git commit hooks on the deployment and staging branches. This
  script makes deployment a command-line one-liner.
    
## License 

    (The MIT License)

    Copyright (C) 2012 by Ruben Vermeersch <ruben@savanne.be>

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
