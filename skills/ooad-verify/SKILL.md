---
name: ooad-verify
description: BDD/Gherkin (Dan North) + Test Pyramid (Mike Cohn) 80/15/5 — derive Given/When/Then from SRS/UC/US, RTM-traced. Use after at least one build slice is green.
disable-model-invocation: true
---

# OOAD Verify — Testing

Derives **test plan** from RE artifacts (SRS/UC/US + Gherkin AC), not code. Complements `ooad-build` TDD. See `references/ooad-vocabulary.md`.

## Preconditions

- `docs/02-requirements/` + `docs/03-architecture/` exist.
- `src/` has at least one green slice from `ooad-build`.

## Process

### 1. Derive executable cases — one per behavior

From each `FR/UC/US+AC`:

| RE Source | Case File | Technique (ISTQB) |
|-----------|-----------|-------------------|
| Functional FR + UC flow | `cases/UC-001-happy.feature` | Equivalence partitioning, boundary values |
| NFR performance | `perf/NFR-003-p95.feature` | Load test `p95<200ms` |
| Business rule | `cases/BR-001-rule.feature` | Decision table |
| Gherkin AC from US | already executable | `Given/When/Then` direct |

Gherkin rules: one behavior per scenario, concrete data, no UI, cover happy/edge/error/null.

Example:

```gherkin
Feature: UC-001 Create account
  Scenario: Successful registration with valid email
    Given an unregistered user with email "a@b.com"
    When they request to create account with valid data
    Then the account is "pending verification"
    And FR-001 is recorded in RTM as covered
```

**Done when:** every FR/UC/US maps to ≥1 `*.feature` file; each feature has happy+edge+error+null scenarios.

### 2. Lay out pyramid (Mike Cohn 80/15/5)

```
tests/
├── unit/           # entities/usecases 80%
├── integration/    # adapters+db 15%
├── e2e/            # UC flow 5%
└── cases/          # UC-xxx.feature, NFR-xxx.feature

docs/05-qa/
├── test-plan.md         (strategy, levels, entry/exit)
├── test-cases.md        (FR→case→result matrix)
├── qa-report.md
└── bug-report.md
```

**Done when:** directory structure exists and `docs/05-qa/test-plan.md` (`templates/test-plan.md`) has entry/exit criteria.

### 3. Execute

```bash
pytest tests/unit --cov          # ≥80%
pytest tests/integration
behave tests/cases/  # or cucumber / pytest-bdd
```

Validate white-box (coverage, branches), black-box (partitioning), UAT with stakeholder.

**Done when:** suite green, coverage ≥80%, no blocking bug, `qa-report.md` with trace `FR→case` in `RTM.csv`.

## Reference

### Gates by profile

- **Waterfall (Royce)**: Complete test plan upfront, formal evidence.
- **RUP (Jacobson)**: Plan per iteration, incremental automation.
- **Agile (Schwaber)**: Emergent per sprint, all automated in CI.

### Verify

- [ ] Every `FR/UC/US` has Gherkin case; pyramid 80/15/5 respected
- [ ] Cases cover happy/edge/error/null; automated suite green
- [ ] `RTM.csv` `FR→case` traced; `qa-report.md` has no blockers
