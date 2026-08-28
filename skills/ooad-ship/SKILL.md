---
name: ooad-ship
description: OOAD Delivery — deployment, runbooks, changelog, pipeline. Closes the SDLC (Deployment + Maintenance). Reads docs/agents/workflow.md.
---

# OOAD Ship — Deployment / Maintenance

## Objective

Ship the verified increment to production with **checklist, runbooks, rollback, changelog and CI/CD pipeline**. See `devops-continuous-delivery.md` (ES), `artefactos-por-fase-y-metodologia.md:121 Deployment` (ES), `software-development-life-cycle.md: Deployment→Maintenance` (ES).

## Preconditions

- `ooad-verify` without blockers.
- `CHANGELOG.md` and `docs/05-qa/qa-report.md` exist.

## Process

### 1. Prepare Delivery

- **Release Notes**: from commits + `RTM.csv` → `RELEASE_NOTES.md` (which FR/UC delivered).
- **Prod Checklist**: `docs/06-deploy/prod-checklist.md` — migrations, env vars, secrets, feature flags.
- **Runbooks**: `docs/06-deploy/runbooks/<service>.md` — how to operate/debug.
- **Rollback plan**: versioned script `scripts/rollback-<version>.sh` + backup.

### 2. Pipeline

Ensure `CI/CD Build→Test→Staging→Prod` (`devops-continuous-delivery.md` ES):

```yaml
# .github/workflows/ci.yml or equivalent
build → test (unit+integration+e2e Gherkin) → staging (smoke) → prod (manual gate in RUP/Waterfall, auto in Agile)
```

IaC if applicable (`Dockerfile`, `infra/*.tf`).

### 3. Execute Deploy

- **RUP**: Transition — deploy per increment, beta with pilot users.
- **Waterfall**: big-bang after final QA, planned window.
- **Agile**: continuous, per sprint, with feature flags.

### 4. Post-deploy

- **CHANGELOG.md** (`docs/agents/workflow.md: Maintenance`) — `feat/fix/breaking`.
- **Technical debt log**: `docs/06-deploy/tech-debt.md`.
- **Reversal ADRs** if decision reverted (`docs/03-architecture/adrs/000N-revert-*.md`).
- **Monitoring**: SLI/SLO/SLA, dashboards, blameless post-mortem.

### 5. Verify

- [ ] Prod checklist + rollback tested
- [ ] Release Notes traceable to FR/UC
- [ ] CI/CD pipeline green on staging
- [ ] CHANGELOG updated
- [ ] Runbooks + rollback versioned
- [ ] Monitoring / alerts configured
