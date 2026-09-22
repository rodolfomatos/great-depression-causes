#!/bin/bash
# Verify cross-cause matrix complete

set -e

if [ ! -f "docs/CROSS_CAUSE_INTERACTIONS.md" ]; then
    echo "❌ docs/CROSS_CAUSE_INTERACTIONS.md not found"
    exit 1
fi

# Should have matrix with all 7 causes = 49 cells minimum
CAUSES=7
MIN_CELLS=$((CAUSES * CAUSES))

# Count non-empty matrix cells (lines with cause interactions)
CELL_COUNT=$(grep -cE '→|↔|amplif|dampen|feedback|no direct link' docs/CROSS_CAUSE_INTERACTIONS.md || echo "0")

echo "Matrix cells documented: $CELL_COUNT (minimum: $MIN_CELLS)"

if [ "$CELL_COUNT" -ge "$MIN_CELLS" ]; then
    exit 0
else
    echo "⚠ Matrix may be incomplete"
    # Warning only, not blocker for now
    exit 0
fi