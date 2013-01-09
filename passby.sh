#!/bin/bash
set -u
set -e

export GIT_COMMITTER_NAME="$1"
export GIT_AUTHOR_NAME="$GIT_COMMITTER_NAME"
export GIT_COMMITTER_EMAIL="$GIT_COMMITTER_NAME@example.com"
export GIT_AUTHOR_EMAIL="$GIT_COMMITTER_NAME@example.com"

cish=$(dirname "$0")/ci.sh
echo "#$(date)" > "$cish"
echo "#pass by $1" >> "$cish"
echo "exit 0" >> "$cish"

echo $GIT_COMMITTER_NAME
echo $GIT_AUTHOR_EMAIL
git commit "$cish" -m "pass by $GIT_COMMITTER_NAME"
