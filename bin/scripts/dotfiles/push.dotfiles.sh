#!/bin/sh

# Getting the currently executing script directory
CURR_DIR="$(cd "$(dirname "$0")" && pwd)"

# Sourcing .env file
. $CURR_DIR/.env

# Setting REPO LOCAL BASE DIR
BASE_DIR=$DF_LOCAL_REPO_PATH

# Sync dotfiles
echo "Syncing dotfiles..."
$CURR_DIR/sync.dotfiles.sh

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