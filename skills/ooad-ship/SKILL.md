---
name: ooad-ship
description: Entrega OOAD — deployment, runbooks, changelog, pipeline. Cierra el SDLC (Deployment + Maintenance). Lee docs/agents/workflow.md.
---

# OOAD Ship — Deployment / Maintenance

## Objetivo

Llevar el incremento verificado a producción con **checklist, runbooks, rollback, changelog y pipeline CI/CD**. Ver `devops-continuous-delivery.md`, `artefactos-por-fase-y-metodologia.md:121 Deployment`, `software-development-life-cycle.md: Deployment→Maintenance`.

## Precondición

- `ooad-verify` sin bloqueantes.
- `CHANGELOG.md` y `docs/05-qa/reporte-qa.md` existen.

## Proceso

### 1. Prepara entrega

- **Release Notes**: desde commits + `RTM.csv` → `RELEASE_NOTES.md` (qué RF/CU entregados).
- **Checklist Prod**: `docs/06-deploy/checklist-prod.md` — migraciones, env vars, secrets, feature flags.
- **Runbooks**: `docs/06-deploy/runbooks/<servicio>.md` — cómo operar/depurar.
- **Rollback plan**: script versionado `scripts/rollback-<version>.sh` + backup.

### 2. Pipeline

Asegura `CI/CD Build→Test→Staging→Prod` (`devops-continuous-delivery.md`):

```yaml
# .github/workflows/ci.yml o equivalente
build → test (unit+integration+e2e Gherkin) → staging (smoke) → prod (manual gate en RUP/Waterfall, auto en Ágil)
```

IaC si aplica (`Dockerfile`, `infra/*.tf`).

### 3. Ejecuta deploy

- **RUP**: Transition — deploy por incremento, beta con usuarios piloto.
- **Waterfall**: big-bang tras QA final, ventana planificada.
- **Ágil**: continuo, por sprint, con feature flags.

### 4. Post-deploy

- **CHANGELOG.md** (`docs/agents/workflow.md: Maintenance`) — `feat/fix/breaking`.
- **Log deuda técnica**: `docs/06-deploy/deuda-tecnica.md`.
- **ADRs de reversión** si se revierte decisión (`docs/03-architecture/adrs/000N-revert-*.md`).
- **Monitoreo**: SLI/SLO/SLA, dashboards, post-mortem blameless.

### 5. Verifica

- [ ] Checklist prod + rollback probado
- [ ] Release Notes trazables a RF/CU
- [ ] Pipeline CI/CD verde en staging
- [ ] CHANGELOG actualizado
- [ ] Runbooks + rollback versionados
- [ ] Monitoreo / alertas configuradas
