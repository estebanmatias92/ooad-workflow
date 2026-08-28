---
name: ooad-requirements
description: OOAD Requirements Engineering — Elicitation → Analysis/Negotiation → Specification → Validation. Produces IEEE830 SRS or US+Gherkin backlog + refined glossary + RTM. Reads docs/agents/workflow.md.
---

# OOAD Requirements — Requirements Engineering (RE)

Covers the 5 sub-phases of `requirements-engineering.md` (ES): `Elicitation → Analysis/Negotiation → Specification → Validation → Management (cross-cutting)`. See `requerimientos-y-tipos.md` (ES), `elicitacion-requerimientos.md` (ES), `analisis-negociacion-requerimientos.md` (ES), `especificacion-requerimientos.md` (ES), `criterios-aceptacion.md` (ES), `validacion-requerimientos.md` (ES), `gestion-requerimientos.md` (ES).

## Preconditions

- `docs/agents/workflow.md` with profile (RUP/Waterfall/Agile).
- `docs/01-discovery/PRD.md` exists (or equivalent vision).
- `CONTEXT.md` or `docs/01-discovery/glossary-draft.md` exists.

## Process

### 1. Elicitation (raw frictions)

Read `docs/01-discovery/*`. Classify each finding into 5 types (`requerimientos-y-tipos.md` ES):

- **Functional (FR)** — what the system does.
- **Non-Functional (NFR)** — quality attributes ISO25010 (`p95<200ms`, `99.9% uptime`, OWASP).
- **Constraints** — technological/legal.
- **Business Rules** — domain origin, non-negotiable.
- **Domain** — industry compliance.

Techniques: interview, JAD, observation, survey, prototype.

**Intermediate output:** `docs/02-requirements/raw-needs.md` listing `BR-001: ...`.

### 2. Analysis / Negotiation

- Prioritize with **MoSCoW** or **Kano** (`analisis-negociacion-requerimientos.md` ES).
- Resolve conflicts; refine glossary (`CONTEXT.md`).
- Produce **Conceptual Class Diagram (domain)** + **Context / System Boundary Diagram** (`docs/02-requirements/conceptual-model.puml`).

**DoD analysis:** no open conflicts, glossary validated, boundary agreed.

### 3. Specification — choose format by profile

| Profile | Required Format | Template | Artifact |
|---------|-----------------|----------|----------|
| **Waterfall** | **Heavy contractual IEEE830 SRS** (`especificacion-requerimientos.md: SRS` ES, `waterfall.md` ES) | `templates/srs-830.md` | `docs/02-requirements/SRS.md` with `FR-NNN`, `NFR-NNN`, traceability `PRD→FR→NFR`, metrics |
| **RUP** | **Detailed UCs** + hybrid SRS (UC-driven) (`rup.md` ES) | `templates/use-case-detailed.md` | `docs/02-requirements/use-cases/UC-001-*.md` + summarized SRS |
| **Agile** | **INVEST US + Gherkin AC** (`user-stories.md: As/Want/So + INVEST` ES, `criterios-aceptacion.md: Given/When/Then` ES) | `templates/us-gherkin.md` | `docs/02-requirements/backlog/US-001-*.md` with executable AC |

Hybrid allowed: NFR/constraints in `SRS` + FR in `US/UC`. Each FR/US references glossary term and `PRD`.

**Rules:**

- Each FR/UC/US has unique `ID`, priority, source, dependency, acceptance criterion.
- NFRs measurable with threshold.
- Traceability `PRD → FR/UC/US → Conceptual Class` in `RTM.csv`.

### 4. Validation

Apply Fagan checklist (`validacion-requerimientos.md` ES):

- [ ] Complete, Consistent, Unambiguous, Verifiable, Traceable, Correct, Boundary defined

Techniques: inspection, walkthrough, stakeholder review, prototype. Formalize **sign-off** (Waterfall/RUP) or **DoD per US** (Agile).

**Output:** `docs/02-requirements/validation.md` + signatures / minutes.

### 5. Management (cross-cutting)

Establish **versioned baseline** + **RTM** (`gestion-requerimientos.md` ES):

- `docs/02-requirements/RTM.csv` — traceability matrix.
- `docs/02-requirements/CHANGELOG-RE.md` — CCB: Request → impact → approve/reject → new baseline.
- `CONTEXT.md` living — glossary versioned per iteration.

### 6. Output Files

```
docs/02-requirements/
├── SRS.md                  (Waterfall/RUP) or
├── backlog/US-001-*.md     (Agile)
├── use-cases/UC-001-*.md   (RUP)
├── glossary.md             (refined → CONTEXT.md)
├── conceptual-model.puml   + .svg
├── context.puml
├── RTM.csv
└── validation.md
```

### 7. Red Flags

- SRS without measurable NFRs.
- US without Gherkin AC.
- Glossary with contradictory synonyms.
- Empty traceability matrix.
- Advancing to `ooad-architect` without signed validation (Waterfall/RUP).

### 8. Verify

- [ ] FR/NFR classified and with ID
- [ ] SRS or backlog complete per profile
- [ ] UC/US with Gherkin AC
- [ ] Conceptual model + context in PlantUML
- [ ] RTM traceable PRD→RE
- [ ] Validation approved
- [ ] Human approved artifacts before design
