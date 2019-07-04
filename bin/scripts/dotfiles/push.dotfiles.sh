#!/bin/sh

BASE_DIR="$HOME/CS/Github/dotfiles"

# Sync dotfiles
echo "Syncing dotfiles..."
./sync.dotfiles.sh

# Go to BASE_DIR
cd BASE_DIR

# Stage all files
echo "Staging all changes..."
git add --all

# Commit all files
currentDate=`date`
echo "Committing files with commit msg: $currentDate"
git commit -m "$currentDate"

# Push commits
echo "Pushing to remote..."
git push origin master

echo "Successfully pushed files to remote"