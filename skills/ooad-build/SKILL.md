---
name: ooad-build
description: OOAD Implementation — Clean 4 Layers + TDD + OpenAPI/Migrations. Builds from docs/03-architecture, traced to FR/UC/US. Reads docs/agents/workflow.md.
---

# OOAD Build — Implementation

## Objective

Write code in Clean layers + TDD tests that satisfy RE and architecture artifacts, traced to requirements. See `xp.md: TDD/CI/Refactoring` (ES), `artefactos-por-fase-y-metodologia.md: Implementation` (ES), `software-development-life-cycle.md:Implementation` (ES).

## Preconditions

- `docs/02-requirements/` validated.
- `docs/03-architecture/` approved (C4/UML + ADRs).
- `docs/agents/workflow.md` + `docs/agents/architecture.md`.

## Process

### 1. Prepare Environment

Per stack (chosen in `ooad-architect`):

| Stack | Files |
|-------|-------|
| python-venv | `requirements.txt + .gitignore` |
| python-nix | `flake.nix + .envrc` |
| node | `package.json + tsconfig` |
| any | `README.md + .gitignore` |

Reuse prior infra if it exists (idempotency). See `templates/gitignore-template.md`.

### 2. Slicing — by UC/US, not massive horizontal

Do not build all DB, then all API, then all UI. Vertical slice per UC/US but respecting Clean layers:

```
Slice 1: UC-001 Create account (Entity User + UseCase CreateUser + Adapter Repo + Controller) → TDD → green → commit
Slice 2: UC-002 Login (UseCase Auth + Strategy for encryption) → TDD → commit
```

Each slice leaves the system compilable and tests green.

### 3. Coding Rules

1.  **Trace**: each module/class starts with comment `// FR-001 / UC-001 — title` or `# FR-001`.
2.  **Clean 4 Layers** (default):
    ```
    src/
    ├── entities/        # Enterprise Business Rules (pure domain)
    ├── usecases/        # Application Business Rules (use cases)
    ├── adapters/        # Interface Adapters (repo, presenter, gateway)
    └── frameworks/      # Frameworks & Drivers (web, db, config)
    ```
    Dependencies only inward. Never `entities` imports `frameworks`.

3.  **SOLID + GRASP + GoF**: single responsibility per class; assign responsibility to information expert; use GoF only when justified by ADR.
4.  **Clean Code**: descriptive names, short functions, no duplication.
5.  **TDD**: `RED → GREEN → REFACTOR`. One test per behavior, not per private method. See `criterios-aceptacion.md: Gherkin` (ES).

### 4. TDD Loop per Slice

```bash
# RED: write failing test (unit in entities/usecases, integration in adapters)
pytest tests/test_create_user.py -v   # should fail
# GREEN: minimal code to pass
# REFACTOR: clean up, tests stay green
# VERIFY: run suite
pytest && npm test / go test ./...
```

Prefer `real implementation > fake > stub > mock` (mock only at slow boundaries).

### 5. API Specification

If REST API exists: `openapi.yaml` (contract-first) in `docs/03-architecture/` or `api/` — generate before or alongside controller.

### 6. Do Not Edit Upstream Artifacts

Do not modify `docs/02-requirements/` nor `docs/03-architecture/` without approval. If inconsistency, ask.

### 7. Verify

- [ ] Each class traceable to FR/UC/US
- [ ] Clean dependency rule respected
- [ ] TDD: test fails before, passes after
- [ ] Suite green (`pytest`, `go test`, `npm test` per stack)
- [ ] Build + lint ok
- [ ] OpenAPI if applicable
- [ ] Atomic commit per slice (`feat: UC-001 CreateUser entity+usecase`)

### 8. Gates by Profile

- **RUP**: Construction iterates slices; each iteration delivers executable increment.
- **Waterfall**: Build at the end, after complete design.
- **Agile**: Build per sprint, slice = US, CI runs per push.
