# Makefile — great-depression-causes

.PHONY: setup check doctor verify clean help

# Default target
help:
	@echo "Available targets:"
	@echo "  setup   - Initialize repository (already done)"
	@echo "  check   - Validate citations, completeness, internal consistency"
	@echo "  doctor  - Verify repo structure, git status, GitHub remote"
	@echo "  verify  - Run full validation gates"
	@echo "  clean   - Remove generated files"

setup:
	@echo "Repository already initialized"
	@echo "Run 'make check' to validate"

check:
	@echo "=== Citation Validation ==="
	@bash scripts/check-citations.sh || true
	@echo ""
	@echo "=== Completeness Check ==="
	@bash scripts/check-completeness.sh || true
	@echo ""
	@echo "=== Internal Consistency ==="
	@bash scripts/check-consistency.sh || true

doctor:
	@echo "=== Repository Structure ==="
	@find . -type f -name "*.md" | head -20
	@echo ""
	@echo "=== Git Status ==="
	@git status --short
	@echo ""
	@echo "=== GitHub Remote ==="
	@git remote -v || echo "No remote configured"

verify:
	@echo "=== Full Validation Gates ==="
	@echo "Gate 1: ≥3 quantified metrics per cause"
	@bash scripts/verify-metrics.sh || exit 1
	@echo "Gate 2: Primary source citations"
	@bash scripts/verify-citations.sh || exit 1
	@echo "Gate 3: Cross-cause matrix complete"
	@bash scripts/verify-matrix.sh || exit 1
	@echo "Gate 4: No orphan claims"
	@bash scripts/verify-orphans.sh || exit 1
	@echo "Gate 5: GitHub push successful"
	@bash scripts/verify-github.sh || exit 1
	@echo ""
	@echo "✅ All validation gates passed"

clean:
	@rm -f docs/*.tmp
	@echo "Cleaned temporary files"

# GitHub operations
github-push:
	@git push -u origin main

github-create:
	@gh repo create rodolfomatos/great-depression-causes --public --source=. --remote=origin --push