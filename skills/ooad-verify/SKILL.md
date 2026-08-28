---
name: ooad-verify
description: OOAD Verification — test plan, Gherkin, QA reports. Derives test cases from SRS/UC/US + architecture. Complements TDD from ooad-build.
---

# OOAD Verify — Testing / QA

## Objective

Derive and execute the **test plan** from RE artifacts (SRS/UC/US + Gherkin AC), not from code. Verify black-box/white-box, integration and UAT. See `artefactos-por-fase-y-metodologia.md:112 Testing` (ES), `validacion-requerimientos.md` (ES), `criterios-aceptacion.md` (ES).

## Preconditions

- `docs/02-requirements/` + `docs/03-architecture/` exist.
- `src/` build green (at least one slice from `ooad-build`).

## Process

### 1. Derive Test Cases

From each `FR/UC/US+AC`:

| RE Source | Test Case | Technique |
|-----------|-----------|-----------|
| Functional FR + UC flow | `cases/UC-001-happy.feature` | Equivalence partitioning, boundary values |
| NFR performance | `perf/NFR-003-p95.feature` | Load test, p95<200ms |
| Business rule | `cases/BR-001-rule.feature` | Decision table |
| Gherkin AC from US | already executable case | `Given/When/Then` direct |

Gherkin template (`criterios-aceptacion.md` ES):

```gherkin
Feature: UC-001 Create account
  Scenario: Successful registration with valid email
    Given an unregistered user with email "a@b.com"
    When they request to create account with valid data
    Then the account is in state "pending verification"
    And FR-001 is recorded in RTM as covered

  Scenario: Duplicate email
    Given an existing user with email "a@b.com"
    When they request to create account with same email
    Then the system rejects with error "email already exists"
```

**Gherkin rules:** one behavior per scenario, concrete data, no UI, cover happy/edge/error/null.

### 2. Write Structure

```
tests/
├── unit/           # entities/usecases (TDD, pyramid 80%)
├── integration/    # adapters + db (15%)
├── e2e/            # complete UC flow (5%)
└── cases/
    ├── UC-001-happy.feature
    └── NFR-003.feature

docs/05-qa/
├── test-plan.md         (strategy, levels, entry/exit criteria)
├── test-cases.md        (FR→case→result matrix)
├── qa-report.md
└── bug-report.md        (issue tracker)
```

### 3. Execute

```bash
pytest tests/unit --cov
pytest tests/integration
behave tests/cases/        # or cucumber / pytest-bdd
```

Validate: white-box (coverage, branches), black-box (partitioning), UAT with stakeholder.

### 4. Gates by Profile

- **Waterfall**: Complete test plan upfront, formal, documentary evidence.
- **RUP**: Plan per iteration, incremental automation.
- **Agile**: Emergent plan per sprint, all automated in CI/CD, evidence in pipeline.

### 5. Verify

- [ ] Each FR/UC/US has at least 1 Gherkin case
- [ ] Pyramid respected (80/15/5)
- [ ] Cases cover happy + edge + error + null
- [ ] Automated suite green
- [ ] QA report without blockers
- [ ] Traceability `FR→case` in RTM
