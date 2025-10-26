#!/bin/bash
# need .creds file with GITHUB_USER and GITHUB_TOKEN
CREDS_FILE="$(dirname "$0")/.creds"

if [ ! -f "$CREDS_FILE" ]; then
  echo "ERROR: .creds file not found at $CREDS_FILE"
  echo "Create it with two lines:"
  echo "GITHUB_USER=\"yourusername\""
  echo "GITHUB_TOKEN=\"ghp_xxxxxxxxxxxxxxxxx\""
  exit 1
fi

source "$CREDS_FILE"

if [ -z "$GITHUB_USER" ] || [ -z "$GITHUB_TOKEN" ]; then
  echo "ERROR: Missing GITHUB_USER or GITHUB_TOKEN in $CREDS_FILE"
  exit 1
fi

git config --global credential.helper store
git credential approve <<EOF
protocol=https
host=github.com
username=$GITHUB_USER
password=$GITHUB_TOKEN
EOF
