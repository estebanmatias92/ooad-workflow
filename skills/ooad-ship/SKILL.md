---
name: ooad-ship
description: Continuous Delivery (Humble/Farley) + SRE (Google) — ship via CI/CD pipeline, prod checklist, rollback & changelog. Use after verify has no blockers.
disable-model-invocation: true
---

# OOAD Ship — Deployment / Maintenance

Ships verified increment to production with **checklist, runbooks, rollback, changelog, pipeline**. Closes SDLC `Deployment → Maintenance`. See `references/ooad-vocabulary.md`.

## Preconditions

- `ooad-verify` without blockers; `qa-report.md` exists.
- `CHANGELOG.md` exists (or will be created).

## Process

### 1. Prepare delivery

- **Release Notes**: commits + `RTM.csv` → `RELEASE_NOTES.md` (which `FR/UC` delivered).
- **Prod Checklist**: `docs/06-deploy/prod-checklist.md` (`templates/prod-checklist.md`) — migrations, env vars, secrets, feature flags.
- **Runbooks**: `docs/06-deploy/runbooks/<service>.md` — operate/debug.
- **Rollback**: versioned `scripts/rollback-<version>.sh` + backup, tested on staging (Humble `Rollback` pattern).

**Done when:** `RELEASE_NOTES.md`, `prod-checklist.md`, runbooks and `rollback-*.sh` exist and rollback works on staging.

### 2. Pipeline — Continuous Delivery (Humble/Farley)

Ensure `Build → Test → Staging → Prod` (`CI/CD`):

```yaml
# .github/workflows/ci.yml
build → test (unit+integration+e2e Gherkin) → staging (smoke) → prod (manual gate in RUP/Waterfall, auto in Agile)
```

IaC if needed (`Dockerfile`, `infra/*.tf`). **Done when:** workflow file exists and staging deploy is green.

### 3. Deploy

- **RUP (Jacobson)**: Transition — per increment, beta with pilot users.
- **Waterfall (Royce)**: Big-bang after final QA, planned window.
- **Agile (Schwaber)**: Continuous per sprint, feature flags (`Blue-Green / Canary — Fowler`).

**Done when:** deployed version matches `RELEASE_NOTES.md`; health checks green.

### 4. Post-deploy

- **CHANGELOG.md** (`Keep a Changelog + SemVer + Conventional Commits`): `feat/fix/breaking`.
- **Tech debt**: `docs/06-deploy/tech-debt.md`.
- **Reversal ADR** if needed: `docs/03-architecture/adrs/000N-revert-*.md`.
- **Monitoring (SRE — Beyer/Jones)**: `SLI/SLO/SLA`, dashboards, blameless post-mortem; `DORA` metrics if tracked.

**Done when:** `CHANGELOG.md` updated, tech debt logged, dashboards show `SLI/SLO`.

## Reference

### Verify

- [ ] Prod checklist + rollback tested on staging
- [ ] `RELEASE_NOTES.md` traced `FR/UC`; `CHANGELOG.md` SemVer
- [ ] Pipeline green on staging; runbooks + rollback versioned
- [ ] Monitoring / alerts configured (SLI/SLO)
