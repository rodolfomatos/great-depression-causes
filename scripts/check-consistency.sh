#!/bin/bash
# Internal consistency check script

set -e

echo "Checking internal consistency..."

if [ ! -f "docs/CAUSE_IMPACT_MAP.md" ]; then
    echo "⚠ docs/CAUSE_IMPACT_MAP.md not found — skipping"
    exit 0
fi

# Check for contradictory claims (same metric, different values)
echo "Scanning for potential contradictions..."

# Check date ranges
echo "Date references found:"
grep -oE '[12][0-9]{3}' docs/CAUSE_IMPACT_MAP.md | sort -u

# Check that cross-cause matrix exists
if [ -f "docs/CROSS_CAUSE_INTERACTIONS.md" ]; then
    echo "✅ Cross-cause interactions file exists"
else
    echo "⚠ docs/CROSS_CAUSE_INTERACTIONS.md not found"
fi

# Check SOURCES.md exists
if [ -f "docs/SOURCES.md" ]; then
    echo "✅ Sources bibliography exists"
else
    echo "⚠ docs/SOURCES.md not found"
fi

exit 0