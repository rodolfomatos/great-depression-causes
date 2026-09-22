# REQUIREMENTS.md — great-depression-causes

## Functional Requirements

### FR-1: Cause Documentation
For each of the 7+ major causes:
- **FR-1.1**: Mechanism description using standard economic theory terminology
- **FR-1.2**: ≥3 quantified impact metrics with years and units
- **FR-1.3**: Primary source citation (author, work, year, page/chapter)
- **FR-1.4**: Counterfactual assessment (what if this cause absent?)
- **FR-1.5**: Interaction effects with ≥2 other causes

### FR-2: Cross-Cause Interaction Matrix
- **FR-2.1**: N×N matrix (N = number of causes) showing amplification/dampening
- **FR-2.2**: Each cell contains mechanism + evidence or "no direct link"
- **FR-2.3**: Feedback loops identified and documented as distinct cycles

### FR-3: Source Traceability
- **FR-3.1**: Annotated bibliography in SOURCES.md
- **FR-3.2**: Claim-to-source mapping (which claim cites which source)
- **FR-3.3**: Primary sources prioritized; secondary only when primary unavailable

### FR-4: Repository Infrastructure
- **FR-4.1**: GitHub repository at https://github.com/rodolfomatos/great-depression-causes
- **FR-4.2**: Git history with meaningful commits
- **FR-4.3**: `make check`, `make doctor`, `make verify` commands functional

## Non-Functional Requirements

### NFR-1: Rigor
- No causal claim without quantitative backing
- No correlation-causation conflation
- Counterfactual reasoning explicit for every cause

### NFR-2: Completeness
- All 7+ standard causes covered (stock crash, banking crises, Fed policy, gold standard, trade collapse, inequality, agricultural depression)
- No gaps in transmission chain from cause → mechanism → impact

### NFR-3: Maintainability
- Structured markdown with consistent schema
- Machine-parsable tables where appropriate
- Version-controlled with clear commit messages

### NFR-4: Accessibility
- Assumes no prior economic history knowledge
- Defines all technical terms on first use
- Context provided for each data point

## Acceptance Criteria Summary
| ID | Criterion | Gate |
|----|-----------|------|
| AC-1 | 7+ causes documented with ≥3 metrics each | BLOCKER |
| AC-2 | All claims have mechanism + evidence + primary citation | BLOCKER |
| AC-3 | Cross-cause matrix 100% populated | BLOCKER |
| AC-4 | Zero orphan claims | BLOCKER |
| AC-5 | GitHub repo live and pushed | BLOCKER |
| AC-6 | `make verify` passes | BLOCKER |