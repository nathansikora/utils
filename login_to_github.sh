#!/bin/bash
# need .creds file with GITHUB_USER and GITHUB_TOKEN
CREDS_FILE="$(dirname "$0")/.creds"

if [ ! -f "$CREDS_FILE" ]; then
  echo "❌ ERROR: .creds file not found at $CREDS_FILE"
  echo "Create it with two lines:"
  echo "GITHUB_USER=yourusername"
  echo "GITHUB_TOKEN=ghp_xxxxxxxxxxxxxxxxx"
  exit 1
fi

source "$CREDS_FILE"

if [ -z "$GITHUB_USER" ] || [ -z "$GITHUB_TOKEN" ]; then
  echo "❌ ERROR: Missing GITHUB_USER or GITHUB_TOKEN in $CREDS_FILE"
  exit 1
fi

REMOTE_URL=$(git remote get-url origin)
if [[ "$REMOTE_URL" != *"@"* ]]; then
  TOKEN_URL="https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/${REMOTE_URL#https://github.com/}"
  git remote set-url origin "$TOKEN_URL"
  echo "🔑 Updated remote URL to use token authentication."
fi
