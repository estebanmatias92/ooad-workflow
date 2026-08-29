---
name: ooad-architect
description: C4 (Simon Brown) + UML + GoF (Gamma) + Clean Architecture (Robert C. Martin) + ADR-MADR — design with Dependency Rule. Use after RE baseline exists.
disable-model-invocation: true
---

# OOAD Architect — Design

Transforms validated RE into **architecture**: C4/UML, data model, GoF selection, Clean 4 Layers layout with ADR-MADR. See `references/ooad-vocabulary.md`.

## Preconditions

- `docs/02-requirements/` baselined (SRS or backlog).
- `docs/agents/workflow.md` + `docs/agents/architecture.md`.
- `CONTEXT.md` + `conceptual-model.puml` exist.

## Process

### 1. Review RE

Read `docs/02-requirements/SRS.md` or `backlog/US-*.md + UC-*.md` + `RTM.csv` + `conceptual-model.puml` + `context.puml`.

**Done when:** every FR/UC/US is mapped to a conceptual class in `RTM.csv` and all NFRs that drive architecture are highlighted.

### 2. Propose architecture — do not proceed without human approval

Propose:

- **Style**: Clean 4 Layers (`Entities → Use Cases → Interface Adapters → Frameworks`) default; alternatives `MVC (Reenskaug)` or `Hexagonal (Cockburn)` per `docs/agents/architecture.md`.
- **C4 (Simon Brown)**: L1 Context, L2 Container, L3 Component (per size).
- **UML (OMG)**: `class-diagram.puml`, `sequence-diagram.puml` per critical UC, `state-diagram.puml` if applicable.
- **Data model**: ER → relational schema + normalization.
- **GoF (Gamma et al.)**: selection matrix `Factory/Singleton | Adapter/Decorator/Proxy/Composite | Observer/Strategy/State/Command` — justify each (problem solved, discarded alternative).
- **Modules/packages**: responsibility per package.
- **Dependency Rule (Martin)**: imports point inward (`Frameworks → Adapters → UseCases → Entities`); flag violations.

**Done when:** user explicitly approves style, C4 levels, and GoF choices (ask: architecture OK? preferred pattern? add/remove?).

### 3. Produce artifacts (after approval)

```
docs/03-architecture/
├── c4-context.puml / c4-container.puml
├── class-diagram.puml       (→ .svg)
├── sequence-diagram-UC-001.puml
├── data-model-er.puml
├── adrs/
│   ├── 0001-clean-4-layer-architecture.md  (MADR — Starke)
│   ├── 0002-strategy-for-rules.md
│   └── 0003-orm-vs-sql.md
└── README.md
```

MADR format: Context → Decision → Consequences → Alternatives. Templates: `templates/adr-madr.md`, `templates/c4.puml`, `templates/class-diagram.puml`. Pre-render `plantuml -tsvg docs/03-architecture/*.puml`.

**Done when:** all PUML render to SVG; each ADR has Context/Decision/Consequences/Alternatives and references a motivating `NFR-xxx`; `RTM.csv` updated with `FR→Class→ADR`.

### 4. Update scaffold README

Create/update `docs/03-architecture/README.md` embedding SVGs:

```markdown
![C4 Context](c4-context.svg)
![Classes](class-diagram.svg)
```

**Done when:** `README.md` renders both SVGs and explains layer responsibilities in 3 lines per layer.

## Reference

### Verify

- [ ] C4/UML in PlantUML and SVGs rendered (`plantuml -tsvg` green)
- [ ] Every ADR has context/decision/consequences/alternatives; justified GoF matrix
- [ ] Dependency Rule respected; no `Entities` imports `Frameworks`
- [ ] Every class/module traced `FR/UC/US → RTM.csv`; NFR → ADR
- [ ] Human approval recorded

### Gates by profile

- **RUP (Jacobson)**: Elaboration delivers executable architectural baseline.
- **Waterfall (Royce)**: Complete heavy SDD, detailed UML, signed.
- **Agile**: Just-enough C4 + ADR per significant decision, UML only as needed.

### Rules

Do not invent a layer outside `docs/agents/architecture.md` without new ADR.
