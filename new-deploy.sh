#!/bin/bash

#########################
# date created:
#
# use:
##########################

# a script for easy site deploymend from submodule
# make it executable with chmod +x deploy.sh

# Set the English locale for the `date` command.
export LC_TIME=en_US.UTF-8

# The commit message.
MESSAGE="Site rebuild $(date)"

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Remove old files in public
pushd public
git rm -rf *
popd

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then MESSAGE="$1"
fi
git commit -m "$MESSAGE"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
