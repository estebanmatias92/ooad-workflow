# AGENTS — ooad-workflow

> Repo de **skills** OOAD (no de producto). Pack agnóstico al stack del consumidor; este repo solo distribuye skills/templates/references.

## Stack

Sin stack definido (agnóstico). No hay `package.json`, `pyproject` ni runtime asumido. Ver `README.md` para instalación vía symlink global.

## Estructura

- `skills/` — 7 skills: `setup-ooad`, `ooad-discover`, `ooad-requirements`, `ooad-architect`, `ooad-build`, `ooad-verify`, `ooad-ship`
- `templates/` — 15 plantillas (PRD, SRS-830, CU, US-Gherkin, C4/UML, ADR-MADR, etc.)
- `references/` — `artefactos-matrix.md`, `definition-of-done.md`
- `docs/` — vacío en el pack (lo genera `setup-ooad` en repos consumidores)
- `.tmp/` — handoffs/scratch local, ignorado por `.gitignore`

## Workflow consumidor

```bash
/setup-ooad      # elige RUP*/Waterfall/Ágil + tracker + arquitectura
/ooad-discover   # PRD + Vision
/ooad-requirements
/ooad-architect
/ooad-build
/ooad-verify
/ooad-ship
```

Cada skill lee `docs/agents/workflow.md` del repo consumidor para gating por perfil (`templates/workflow.md`).

## Convenciones

- Commits en español o inglés, prefijo `docs:` para scaffold (`docs: scaffold ooad-workflow RUP/Clean4`)
- No versionar `.tmp/` ni `.scratch/`
- Symlink global: `~/.config/opencode/skills/ooad-workflow → $(pwd)` (ver `README.md:34`)

## Agent skills

Skills expuestas vía symlink global. Ver `skills/setup-ooad/SKILL.md` para bootstrap de repos consumidores.

### Issue tracker

Este pack no trackea issues propias aquí (pack de distribución). Repos consumidores eligen GitHub/GitLab/Local en `setup-ooad`. Ver `templates/issue-tracker-*.md`.

### Domain docs

Single-context en repos consumidores (`CONTEXT.md + docs/adr/`). Ver `templates/domain.md`.

## Referencias

- `systems-analysis-ooad-paradigm.md`
- `artefactos-por-fase-y-metodologia.md`
- `README.md`
