---
name: ooad-requirements
description: IEEE 29148 (ex-830) SRS + Use Cases (Cockburn) + INVEST/Gherkin (Wake/North) + Fagan (Fagan) — Elicitation→Validation with RTM. Use after PRD/Vision exists.
disable-model-invocation: true
---

# OOAD Requirements — Requirements Engineering

Covers 5 sub-phases: `Elicitation → Analysis/Negotiation → Specification → Validation → Management`. See `references/ooad-vocabulary.md` (IEEE 29148, UC, INVEST, Gherkin/BDD, Fagan, RTM, MoSCoW/Kano, ISO 25010).

## Preconditions

- `docs/agents/workflow.md` with profile (RUP/Waterfall/Agile).
- `docs/01-discovery/PRD.md` exists.
- `CONTEXT.md` or `docs/01-discovery/glossary-draft.md` exists.

## Process

### 1. Elicitation — raw frictions

Read `docs/01-discovery/*`. Classify into 5 types:

- **FR** — what system does. **NFR** — quality (`ISO 25010`, `p95<200ms`). **Constraints** — tech/legal. **Business Rules (BR)** — domain, non-negotiable. **Domain compliance**.

Techniques: interview, JAD, observation, survey, prototype.

**Done when:** `docs/02-requirements/raw-needs.md` lists every finding with ID `FR-NNN/NFR-NNN/BR-NNN` and source PRD reference.

### 2. Analysis / Negotiation

- Prioritize with **MoSCoW (Dai Clegg)** or **Kano (Noriaki Kano)**; resolve conflicts; refine `CONTEXT.md`.
- Produce **Conceptual Class Diagram** + **System Boundary / C4 Context** (`docs/02-requirements/conceptual-model.puml`, `context.puml`).

**Done when:** no open conflicts; glossary validated; system boundary agreed; model renders via `plantuml -tsvg`.

### 3. Specification — choose format by profile

| Profile | Required Format | Template | Artifact |
|---------|-----------------|----------|----------|
| **Waterfall (Royce)** | Heavy `SRS IEEE 29148` contractual | `templates/srs-830.md` | `docs/02-requirements/SRS.md` (`FR-NNN`, `NFR-NNN`, `PRD→FR→NFR` traceability, metrics) |
| **RUP (Jacobson)** | Detailed UCs + hybrid SRS (UC-driven) | `templates/use-case-detailed.md` | `docs/02-requirements/use-cases/UC-001-*.md` + summarized SRS |
| **Agile (Schwaber / Wake / North)** | `INVEST (Wake)` US + `Gherkin/BDD (North)` AC `Given/When/Then` | `templates/us-gherkin.md` | `docs/02-requirements/backlog/US-001-*.md` with executable AC |

Hybrid allowed: NFR/constraints in `SRS` + FR in `US/UC`. Every FR/US references glossary term + `PRD`.

Rules: unique `ID`, priority, source, dependency, acceptance criterion per item. NFRs measurable with threshold. Traceability `PRD → FR/UC/US → Conceptual Class` in `RTM.csv`.

**Done when:** all FR/NFR have IDs and measurable criteria; every UC/US has `Given/When/Then` AC; `RTM.csv` covers `PRD → FR/UC/US → Class`.

### 4. Validation — Fagan Inspection (Michael Fagan)

Apply checklist: complete, consistent, unambiguous, verifiable, traceable, correct, boundary defined. Techniques: inspection, walkthrough, stakeholder review, prototype. Formalize **sign-off** (Waterfall/RUP) or **DoD per US** (Agile).

**Done when:** `docs/02-requirements/validation.md` exists with signatures/minutes and zero open Fagan defects.

### 5. Management — baseline + RTM

Versioned baseline + `RTM.csv` traceability; `CHANGELOG-RE.md` (CCB: Request → impact → approve/reject → new baseline); `CONTEXT.md` living per iteration.

**Done when:** `RTM.csv` + `CHANGELOG-RE.md` committed; baseline tagged; human approved all artifacts before `ooad-architect`.

## Reference

### Output files

```
docs/02-requirements/
├── SRS.md                  (Waterfall/RUP)
├── backlog/US-001-*.md     (Agile)
├── use-cases/UC-001-*.md   (RUP)
├── glossary.md → CONTEXT.md
├── conceptual-model.puml + .svg
├── context.puml
├── RTM.csv
└── validation.md
```

### Red flags — do not advance if:

SRS without measurable NFRs; US without Gherkin AC; glossary with contradictory synonyms; empty RTM; validation not signed (Waterfall/RUP).

### Verify

- [ ] Every FR/NFR classified, with ID and verifiable criterion
- [ ] SRS or backlog complete per profile; every UC/US has Gherkin AC
- [ ] Conceptual model + context render; `plantuml -tsvg` green
- [ ] RTM `PRD→RE` fully traced; Fagan passed with sign-off
