---
name: ooad-discover
description: OOAD Discovery phase — produces PRD, Vision and draft glossary. First skill in the RUP/Waterfall/Agile workflow. Reads docs/agents/workflow.md for profile gating.
---

# OOAD Discover — Discovery / Research

## Objective

Transform a vague idea or initial charter into a **PRD** with vision, KPIs, personas and scope boundary. Feeds the RE phase. See `product-requirements-document.md` (ES), `lean-startup.md` (ES), `glosario-dominio.md` (ES), `artefactos-por-fase-y-metodologia.md:72 Discovery` (ES).

## When to Use

- Repo newly configured with `setup-ooad` without PRD.
- New initiative/product before writing SRS/US.
- Brownfield: when lost vision must be rebuilt.

**Do not use for:** one-line fix, typo, refactor without scope change.

## Preconditions

- `docs/agents/workflow.md` exists (profile chosen).
- Minimal stakeholder charter/description (even 1 paragraph).

## Process

### 1. Explore

- Read `docs/agents/workflow.md` (profile) and `docs/agents/domain.md` (where glossary goes).
- Read `CONTEXT.md` if it exists; otherwise draft will be created here.
- Review `elicitacion-requerimientos.md: interview/JAD/observation techniques` (ES).

### 2. Interview (if context missing)

If idea is underspecified, apply minimal `interview-me` (1 question at a time with hypothesis):

- Who is the user? Why now? What measurable success? What is out of scope?

Do not block if user wants speed — generate draft with listed assumptions.

### 3. Produce Artifacts

| Artifact | Path | Profile |
|----------|------|---------|
| **PRD** | `docs/01-discovery/PRD.md` (template `templates/prd.md`) | All: Waterfall=complete signed, RUP=Vision+KPIs, Agile=1-page living |
| **Vision Statement** | section inside PRD | RUP required (Inception) |
| **User Personas** | `docs/01-discovery/personas.md` | RUP/Agile yes, Waterfall sometimes |
| **Draft Glossary** | `docs/01-discovery/glossary-draft.md` → then `CONTEXT.md` | All draft here, refined in `ooad-requirements` |
| **Tentative Context Diagram** | `docs/01-discovery/context-tentative.puml` | Optional in Discovery, required in RE |

Templates: `templates/prd.md`, `templates/glossary.md`.

**Minimum PRD sections:**

```
# PRD: [Name]
## Vision / Elevator pitch
## Users / Personas
## KPIs / Success criteria (measurable)
## Features (Waterfall: complete narrative; Agile: prioritized MoSCoW list)
## Out of scope
## Assumptions / Initial Risks
## Open questions
```

### 4. Gates by Profile

- **RUP**: Vision reviewed with stakeholder; draft glossary without critical ambiguity.
- **Waterfall**: Complete PRD reviewed and pre-signed before RE.
- **Agile**: 1-page PRD reviewed; initial backlog with 5-10 prioritized US.

### 5. Verify

- [ ] PRD covers vision + KPIs + out-of-scope + assumptions
- [ ] Draft glossary without contradictory terms vs existing `CONTEXT.md`
- [ ] Assumptions listed explicitly (not silently filled)
- [ ] Human reviewed and approved

Do not advance to `ooad-requirements` without approval.
