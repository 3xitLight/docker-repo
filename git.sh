#!/bin/bash

REPO_ROOT=""
REPO_POOL=""
REPO_NAME=""

echo
echo "Updating repo database"
echo
repose ${REPO_ROOT} ${REPO_POOL} ${REPO_NAME} --rebuild --files
repose ${REPO_ROOT} ${REPO_POOL} ${REPO_NAME} --list
sleep 3

##
##
##

# checking if I have the latest files from github
echo
echo "Checking for newer files online first"
echo
git pull

# Below command will backup everything inside the project folder
git status
sleep 2

git add --all


# Give a comment to the commit if you want
echo
echo "####################################"
echo "Write your commit comment!"
echo "####################################"
echo
read input

# Committing to the local repository with a message containing the time details and commit text

git commit -m "$input"

# Push the local files to github

git push

echo
echo "################################################################"
echo "###################    Git Push Done      ######################"
echo "################################################################"
echo
echo
