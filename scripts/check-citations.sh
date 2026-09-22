#!/bin/bash
# Citation validation script

set -e

echo "Checking for primary source citations in docs/CAUSE_IMPACT_MAP.md..."

if [ ! -f "docs/CAUSE_IMPACT_MAP.md" ]; then
    echo "⚠ docs/CAUSE_IMPACT_MAP.md not found — skipping"
    exit 0
fi

# Check for key primary sources
SOURCES=(
    "Friedman.*Schwartz"
    "Eichengreen"
    "Bernanke"
    "Temin"
    "Kindleberger"
    "Romer"
)

for source in "${SOURCES[@]}"; do
    if grep -qi "$source" docs/CAUSE_IMPACT_MAP.md; then
        echo "✅ Found reference to $source"
    else
        echo "⚠ No reference to $source found"
    fi
done

# Check citation format (author, year, page)
CITATION_COUNT=$(grep -cE '\([A-Za-z]+.*[0-9]{4}.*p\.' docs/CAUSE_IMPACT_MAP.md || echo "0")
echo "Citations with page references: $CITATION_COUNT"

exit 0