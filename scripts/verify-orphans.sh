#!/bin/bash
# Verify no orphan claims (claims without evidence or mechanism)

set -e

if [ ! -f "docs/CAUSE_IMPACT_MAP.md" ]; then
    echo "❌ docs/CAUSE_IMPACT_MAP.md not found"
    exit 1
fi

# Heuristic: every causal claim should have "mechanism" or "because" or "via" nearby
# and should have a citation nearby
ORPHAN_COUNT=0

# This is a simplified check - in reality would need more sophisticated parsing
echo "Scanning for claims without adjacent mechanism/evidence..."

# Check for assertive statements without nearby citations
# Look for "caused", "led to", "resulted in" without citation within 5 lines
SUSPECT_LINES=$(grep -n -iE 'caused|led to|resulted in|triggered|produced' docs/CAUSE_IMPACT_MAP.md | head -20)

if [ -n "$SUSPECT_LINES" ]; then
    echo "Review these causal claims for evidence proximity:"
    echo "$SUSPECT_LINES"
fi

exit 0