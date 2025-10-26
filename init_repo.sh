#!/bin/bash
# Usage: ./clone_branch.sh <repo_url> <branch_name> [target_directory]

REPO_URL="$1"
BRANCH_NAME="$2"
TARGET_DIR="$3"

# Check arguments
if [ -z "$REPO_URL" ] || [ -z "$BRANCH_NAME" ]; then
  echo "Usage: $0 <repo_url> <branch_name> [target_directory]"
  exit 1
fi

# If no target directory specified, use repo name
if [ -z "$TARGET_DIR" ]; then
  TARGET_DIR=$(basename "$REPO_URL" .git)
fi

# Clone the repo
echo "Cloning $REPO_URL into $TARGET_DIR ..."
git clone --branch "$BRANCH_NAME" --single-branch "$REPO_URL" "$TARGET_DIR"

# Go into the repo directory
cd "$TARGET_DIR" || exit 1

# Confirm current branch
echo "Now in $(pwd)"
git status
