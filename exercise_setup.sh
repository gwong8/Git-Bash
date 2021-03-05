#!/bin/bash

# Create exercise folder
echo -e "\n############## Create exercise folder ##############"
rm -rf git-exercise
mkdir git-exercise
cp johndoe-work.sh git-exercise
cd git-exercise

# Setup remote repository
echo -e "\n############## Setup remote repository ##############"
git init remote-repo
cd remote-repo
echo -e "# Remote repository" > README.md
echo -e "### Python ### \n__pycache__/" > .gitignore
git add .
git commit -m "Add README.md and .gitignore"
git checkout HEAD~0 # Switch to detached head before exit
cd ..

### You - Local ###
# Clone remote repository to local
echo -e "\n############## You - Local ##############"
echo "############## Clone remote repository to local ##############"
git clone remote-repo local-repo
cd local-repo

# Setup simple local alias
echo -e "\n############## Setup simple local alias #############"
git config --local alias.ll '!ls -al'
git ll # test alias

# Add report and py scripts
echo -e "\n############## Add report and py scripts ##############"
echo "First draft" > report.txt
echo 'print("automation script\n")' > signal.py
echo "import signal" > automation.py
python3 automation.py
git add .
git commit -m "Add report and automation scripts"
git push # update remote-repo
cd ..

### John Doe ###
# Work done on remote
echo -e "\n############## John Doe's work on remote ##############"
source johndoe-work.sh

### You - Local ###
# Make changes to report
echo -e "\n############## Make changes to report ##############"
cd local-repo
echo "Second draft" > report.txt
git commit -am "Modify report content (second draft)"

# Push local work
echo -e "\n############## Push local work ##############"
git push # update remote-repo; error caused by John's work

# Error during push so fetch, merge, then push
echo -e "\n############## Error during push so fetch, merge, then push ##############"
echo "############## Fetch remote ##############"
git fetch # update local-repo
git log --all --oneline --graph # log shows divergence due to John's work

echo -e "\n############## Three-way-merge ##############"
git merge origin/master -m "Merge" # three-way-merge
git tag v1.0 master # tag master as release v1.0
git log --all --oneline --graph

echo -e "\n############## Push to remote ##############"
git push # fast-forward merge
git push origin v1.0 # push tag to remote
git status
git log --all --oneline --graph
cd ..

# Remote-repo log
echo -e "\n############## Remote-repo log ##############"
cd remote-repo
git status
git log --all --oneline --graph
cd ..