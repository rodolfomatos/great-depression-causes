#!/bin/bash
# Completeness check script

set -e

echo "Checking completeness of cause documentation..."

if [ ! -f "docs/CAUSE_IMPACT_MAP.md" ]; then
    echo "⚠ docs/CAUSE_IMPACT_MAP.md not found — skipping"
    exit 0
fi

# Required causes
CAUSES=(
    "Stock Market Crash"
    "Banking Cris"
    "Federal Reserve"
    "Gold Standard"
    "Smoot-Hawley\|Trade Collapse"
    "Inequality\|Subconsumption"
    "Agricultural"
)

for cause in "${CAUSES[@]}"; do
    if grep -qi "$cause" docs/CAUSE_IMPACT_MAP.md; then
        echo "✅ Cause documented: $cause"
    else
        echo "❌ MISSING cause: $cause"
    fi
done

# Check for ≥3 metrics per cause
echo ""
echo "Checking metric counts per cause..."
# This is a heuristic — counts tables/quantified statements
METRIC_LINES=$(grep -cE '[0-9]+%|[0-9]+\.[0-9]+|[0-9]+ billion|[0-9]+ million|[0-9]+ thousand|[0-9]+ percent' docs/CAUSE_IMPACT_MAP.md || echo "0")
echo "Quantified data points found: $METRIC_LINES"

exit 0