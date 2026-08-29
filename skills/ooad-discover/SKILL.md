---
name: ooad-discover
description: RUP Inception (Kruchten) + Vision (Moore) + MoSCoW (Clegg) Discovery — produce living PRD with KPIs/personas. Use when repo has no PRD or vision must be rebuilt.
disable-model-invocation: true
---

# OOAD Discover — Discovery

Transforms vague charter into **PRD** with vision, KPIs, personas and scope boundary. Feeds RE. See `references/ooad-vocabulary.md` (RUP Inception, Vision, MoSCoW, C4).

## Preconditions

- `docs/agents/workflow.md` exists (profile chosen).
- Minimal charter/description (1 paragraph suffices).

## Process

### 1. Explore

- Read `docs/agents/workflow.md` (profile) and `docs/agents/domain.md` (glossary location).
- Read `CONTEXT.md` if present; draft will be created here otherwise.

**Done when:** profile and existing `CONTEXT.md` state are known.

### 2. Interview — only if underspecified

If idea lacks Who/Why/How-measured/Out-of-scope, ask 1 hypothesis-bearing question at a time:

- Who is the user? Why now? What measurable success? What is out of scope?

Do not block if user wants speed — generate draft with listed assumptions.

**Done when:** every PRD section has either evidence or an explicit assumption.

### 3. Produce artifacts

| Artifact | Path | Profile |
|----------|------|---------|
| **PRD** | `docs/01-discovery/PRD.md` (`templates/prd.md`) | All: Waterfall=complete signed, RUP=Vision+KPIs, Agile=1-page living |
| **User Personas** | `docs/01-discovery/personas.md` | RUP/Agile yes, Waterfall sometimes |
| **Draft Glossary** | `docs/01-discovery/glossary-draft.md` → `CONTEXT.md` | All draft here, refined in `ooad-requirements` |
| **Tentative C4 Context** | `docs/01-discovery/context-tentative.puml` (L1 — Simon Brown) | Optional here, required in RE |

**Done when:** `PRD.md` contains Vision, Users, KPIs (measurable), Features (MoSCoW), Out-of-scope, Assumptions/Risks, Open Questions — and glossary draft has no contradictory terms vs existing `CONTEXT.md`.

**Verify before advancing:**

- [ ] PRD has vision + KPIs with target + out-of-scope + listed assumptions (not silently filled)
- [ ] Glossary draft consistent; every new term referenced by at least one PRD feature
- [ ] Human approved `PRD.md` (Waterfall: pre-signed; RUP/Agile: reviewed). Do not advance to `ooad-requirements` without approval.

## Reference

### Gates by profile

- **RUP**: Vision reviewed with stakeholder; glossary draft without critical ambiguity.
- **Waterfall**: Complete PRD pre-signed before RE.
- **Agile**: 1-page PRD + initial 5–10 `INVEST` US prioritized.
