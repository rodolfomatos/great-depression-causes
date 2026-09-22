#!/bin/bash
# Verify primary source citations

set -e

if [ ! -f "docs/CAUSE_IMPACT_MAP.md" ]; then
    echo "❌ docs/CAUSE_IMPACT_MAP.md not found"
    exit 1
fi

# Check for at least one primary source per cause
CAUSES=(
    "Stock Market Crash"
    "Banking Cris"
    "Federal Reserve"
    "Gold Standard"
    "Smoot-Hawley"
    "Inequality"
    "Agricultural"
)

PRIMARY_SOURCES=(
    "Friedman"
    "Schwartz"
    "Eichengreen"
    "Bernanke"
    "Temin"
    "Kindleberger"
    "Romer"
)

ALL_PASS=1

for cause in "${CAUSES[@]}"; do
    SECTION=$(grep -A 100 -i "$cause" docs/CAUSE_IMPACT_MAP.md | head -100)
    HAS_PRIMARY=0
    for source in "${PRIMARY_SOURCES[@]}"; do
        if echo "$SECTION" | grep -qi "$source"; then
            HAS_PRIMARY=1
            break
        fi
    done
    if [ "$HAS_PRIMARY" -eq 1 ]; then
        echo "✅ $cause: has primary source citation"
    else
        echo "❌ $cause: missing primary source citation"
        ALL_PASS=0
    fi
done

if [ "$ALL_PASS" -eq 1 ]; then
    exit 0
else
    exit 1
fi