---
name: ooad-build
description: Clean Architecture (Robert C. Martin) + TDD (Kent Beck) RED→GREEN + OpenAPI — vertical slice by UC/US in 4 layers. Use after architecture is approved.
disable-model-invocation: true
---

# OOAD Build — Implementation

Writes code in Clean layers + TDD satisfying RE and architecture, traced `FR/UC/US`. See `references/ooad-vocabulary.md`. Length is earned (Clean 4 + TDD + OpenAPI + GRASP guardrails are graded artifacts) — do not thin to pure delegation.

## Preconditions

- `docs/02-requirements/` validated.
- `docs/03-architecture/` approved (C4/UML + ADRs).
- `docs/agents/workflow.md` + `docs/agents/architecture.md`.

## Process

### 1. Prepare environment

Per stack chosen in `ooad-architect`:

| Stack | Files |
|-------|-------|
| python-venv | `requirements.txt + .gitignore` |
| python-nix | `flake.nix + .envrc` |
| node | `package.json + tsconfig` |
| any | `README.md + .gitignore` |

Reuse prior infra if exists. **Done when:** `build` and `lint` commands run without error.

### 2. Slice vertically — by UC/US, not horizontal

One slice = `Entity + UseCase + Adapter Repo + Controller` that compiles and passes tests. Example:

```
Slice 1: UC-001 Create account → TDD → green → commit
Slice 2: UC-002 Login (Strategy for encryption) → TDD → commit
```

**Done when:** slice leaves system compilable and suite green.

### 3. Code — SOLID (Martin) + GRASP (Larman) + RDD (Wirfs-Brock) + GoF (Gamma) only when ADR-justified

- **Trace**: each module header `// FR-001 / UC-001 [GRASP-pattern] — title` or `# FR-001 [GRASP-pattern]` (e.g. `// FR-001 / UC-001 [Creator] Order.create()`). The pattern tag is a Mission claim — it must match the `Mission:` in `references/ooad-vocabulary.md`, or the reviewer challenges it.
- **GRASP guardrails**: Controller logic lives in `usecases/`, never in `frameworks/`; creation follows Creator (aggregate root creates its parts); behavior on type codes uses Polymorphism; cross-layer helpers are explicit Pure Fabrications with a cohesion note; every Protected Variation cites its GoF in the ADR.
- **Clean 4 Layers**:
  ```
  src/
  ├── entities/        (Enterprise Rules)
  ├── usecases/        (Application Rules)
  ├── adapters/        (gateways, repo, presenter)
  └── frameworks/      (web, db, config)
  ```
  Dependencies only inward. Never `entities → frameworks`.
- **Clean Code**: descriptive names, short functions, no duplication.

**Done when:** every new class has trace comment with GRASP pattern and single responsibility; import graph respects Dependency Rule.

### 4. TDD loop per slice (Kent Beck) — RED → GREEN → REFACTOR

```bash
# RED: failing test (unit in entities/usecases, integration in adapters)
pytest tests/test_create_user.py -v   # must fail
# GREEN: minimal code to pass
# REFACTOR: clean, tests stay green
pytest && npm test / go test ./...
```

Prefer `real > fake > stub > mock` (mock only at slow boundaries). One test per behavior, not per private method.

**Done when:** failing test existed before code, passes after, and stays green after refactor.

### 5. API spec (if REST)

Contract-first `openapi.yaml` in `docs/03-architecture/` or `api/`, generated before/alongside controller.

**Done when:** `openapi.yaml` validates and matches controller routes.

### 6. Do not edit upstream

Do not modify `docs/02-requirements/` or `docs/03-architecture/` without approval. On inconsistency, ask.

## Reference

### Verify

- [ ] Every class traced `FR/UC/US [GRASP-pattern]`; Controller in `usecases/`; Dependency Rule green (`dependency-cruiser` or review)
- [ ] TDD: test failed before, passes after; suite green
- [ ] `build + lint` green; `openapi.yaml` valid if API exists
- [ ] Atomic commit per slice `feat: UC-001 CreateUser entity+usecase`

### Gates by profile

- **RUP**: Construction iterates slices; each iteration delivers executable increment.
- **Waterfall**: Build after complete design.
- **Agile**: Build per sprint, slice = US, CI per push.
