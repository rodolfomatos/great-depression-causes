# CLAUDE.md — Operational Contract: great-depression-causes

## Project Intent
Produce an exhaustive, rigorously documented cause-impact mapping of the Great Depression (1929-1939) suitable for publication as a reference repository. Every causal claim must be traceable to primary economic history sources with quantitative evidence.

## Non-Goals
- Policy response analysis (New Deal, international recovery programs)
- Political history narrative
- Country-specific case studies beyond transmission mechanisms
- Post-1939 analysis

## Critical Files
- `docs/CAUSE_IMPACT_MAP.md` — primary output (cause → mechanism → impact → evidence)
- `docs/SOURCES.md` — annotated bibliography with claim-to-source mapping
- `docs/CROSS_CAUSE_INTERACTIONS.md` — feedback loop analysis
- `aes/tickets/T001-*.md` — AES phase outputs

## Never Do
- Make causal claims without quantitative backing
- Conflate correlation with causation
- Use secondary sources when primary available
- Omit counterfactual reasoning (what would have happened without cause X)
- Skip the two-agent critic/implementor protocol

## Evidence Required
For each cause-impact link:
1. Mechanism description (economic theory)
2. Quantitative magnitude (data points with years)
3. Primary source citation (author, work, year, page/chapter)
4. Counterfactual assessment
5. Interaction effects with other causes

## Commands
- `make setup` — initialize repo (already done)
- `make check` — validate citations, completeness, internal consistency
- `make doctor` — verify repo structure, git status, GitHub remote
- `make verify` — run full validation gates

## Quality Gates (BLOCKER)
- Every cause has ≥3 quantified impact metrics
- Every claim cites primary source (Friedman & Schwartz, Eichengreen, Bernanke, Temin, Kindleberger, Romer, etc.)
- Cross-cause interaction matrix complete
- No orphan claims (claims without evidence or mechanism)
- Repository pushes to GitHub successfully