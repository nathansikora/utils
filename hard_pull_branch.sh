#!/bin/bash
# Usage: ./hard_pull.sh [repo_path]

REPO_PATH="${1:-.}"  # default to current directory
cd "$REPO_PATH" || { echo "Cannot access $REPO_PATH"; exit 1; }

# Ensure it's a git repo
if [ ! -d ".git" ]; then
  echo "Not a git repository: $REPO_PATH"
  exit 1
fi

# Get current branch name
BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "Checking for updates on branch: $BRANCH"

# Fetch latest info from origin
git fetch origin "$BRANCH"

# Compare local and remote
LOCAL=$(git rev-parse "$BRANCH")
REMOTE=$(git rev-parse "origin/$BRANCH")

if [ "$LOCAL" != "$REMOTE" ]; then
  echo "Changes detected — resetting to origin/$BRANCH"
  git reset --hard "origin/$BRANCH"
  echo "Repository updated."
  exit 2
else
  echo "Already up to date."
  exit 0
fi
