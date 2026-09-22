#!/bin/bash
# Verify ≥3 quantified metrics per cause

set -e

if [ ! -f "docs/CAUSE_IMPACT_MAP.md" ]; then
    echo "❌ docs/CAUSE_IMPACT_MAP.md not found"
    exit 1
fi

CAUSES=(
    "Stock Market Crash"
    "Banking Cris"
    "Federal Reserve"
    "Gold Standard"
    "Smoot-Hawley"
    "Inequality"
    "Agricultural"
)

ALL_PASS=1

for cause in "${CAUSES[@]}"; do
    # Count metrics in the cause section (lines between this cause and next cause)
    # This is a simplified check
    METRICS=$(grep -A 50 -i "$cause" docs/CAUSE_IMPACT_MAP.md | grep -cE '[0-9]+%|\$[0-9]|[0-9]+ (billion|million|percent|points?)' || echo "0")
    if [ "$METRICS" -ge 3 ]; then
        echo "✅ $cause: $METRICS metrics"
    else
        echo "❌ $cause: only $METRICS metrics (need ≥3)"
        ALL_PASS=0
    fi
done

if [ "$ALL_PASS" -eq 1 ]; then
    exit 0
else
    exit 1
fi