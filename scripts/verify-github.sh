#!/bin/bash
# Verify GitHub push successful

set -e

# Check if remote exists
if ! git remote | grep -q origin; then
    echo "❌ No 'origin' remote configured"
    exit 1
fi

# Check if we can reach GitHub
if git ls-remote origin HEAD >/dev/null 2>&1; then
    echo "✅ GitHub remote accessible"
    REMOTE_URL=$(git remote get-url origin)
    echo "   Remote: $REMOTE_URL"
else
    echo "❌ Cannot reach GitHub remote"
    exit 1
fi

# Check if local commits are pushed
LOCAL_HEAD=$(git rev-parse HEAD)
REMOTE_HEAD=$(git ls-remote origin HEAD | cut -f1)

if [ "$LOCAL_HEAD" = "$REMOTE_HEAD" ]; then
    echo "✅ Local and remote HEAD match"
    exit 0
else
    echo "⚠ Local and remote HEAD differ"
    echo "   Local:  $LOCAL_HEAD"
    echo "   Remote: $REMOTE_HEAD"
    echo "   Run 'make github-push' to sync"
    exit 1
fi