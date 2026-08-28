---
name: ooad-architect
description: OOAD Design — C4/UML + GoF + Clean 4 Layers + ADR-MADR. Transforms SRS/UC/US into architecture. Reads docs/agents/workflow.md and docs/agents/architecture.md.
---

# OOAD Architect — Design / Architecture

## Objective

Transform validated requirements into **architecture**: C4/UML structure, data model, GoF pattern selection and Clean 4 Layers layout, with traceable decisions in **ADR-MADR**. See `architecture-decision-record.md` (ES), `software-development-life-cycle.md: Design` (ES), `artefactos-por-fase-y-metodologia.md:93 Design` (ES).

## Preconditions

- `docs/02-requirements/` validated and baselined (SRS or backlog).
- `docs/agents/workflow.md` + `docs/agents/architecture.md` (chosen layers).
- `CONTEXT.md` + `conceptual-model.puml` exist.

## Process

### 1. Review RE

Read `docs/02-requirements/SRS.md` or `backlog/US-*.md + UC-*.md` + `RTM.csv` + `conceptual-model.puml` + `context.puml`.

### 2. Propose Architecture

Based on requirements, propose:

- **Architectural style**: Clean 4 Layers (default) `Entities → Use Cases → Interface Adapters → Frameworks & Drivers`; alternative MVC or Hexagonal per `docs/agents/architecture.md`.
- **C4**: Level 1 Context, Level 2 Container, Level 3 Component (per size).
- **UML**: `class-diagram.puml` (classes, relations, methods), `sequence-diagram.puml` per critical UC, `state-diagram.puml` if applicable.
- **Data model**: ER → relational schema + normalization (`Base de Datos` paradigm ES).
- **GoF patterns**: selection matrix — `Creational: Factory, Singleton; Structural: Adapter, Decorator, Composite, Proxy; Behavioral: Observer, Strategy, State, Command` (`systems-analysis-ooad-paradigm.md:38` ES). Justify each (what problem it solves, discarded alternative).
- **Modules / packages**: what to create and responsibility.
- **Clean dependency rule**: dependencies point inward (`Frameworks → Adapters → UseCases → Entities`). Flag violations.

**Do not proceed without explicit human approval.** Present and ask: architecture OK? preferred pattern? anything to add/remove?

### 3. Produce Artifacts (after approval)

```
docs/03-architecture/
├── c4-context.puml / c4-container.puml
├── class-diagram.puml       (→ .svg pre-rendered)
├── sequence-diagram-UC-001.puml
├── data-model-er.puml
├── adrs/
│   ├── 0001-clean-4-layer-architecture.md  (MADR)
│   ├── 0002-strategy-pattern-for-rules.md
│   └── 0003-orm-vs-sql.md
└── README.md (explains layers and responsibilities)
```

MADR ADR format (`architecture-decision-record.md` ES):

```
# ADR-000N: Title
- Status: Proposed | Accepted | Deprecated
- Context: ...
- Decision: ...
- Consequences: ...
- Alternatives considered: ...
```

Templates: `templates/adr-madr.md`, `templates/c4.puml`, `templates/class-diagram.puml`.

**Pre-render:**

```bash
plantuml -tsvg docs/03-architecture/*.puml
```

### 4. Update Scaffold README

Create/update `docs/03-architecture/README.md` with scaffold section + embedded SVGs:

```markdown
![C4 Context](c4-context.svg)
![Classes](class-diagram.svg)
```

### 5. Gates by Profile

- **RUP**: Elaboration delivers executable architectural baseline (architecture runs, even if incomplete). Style ADR + C4 required.
- **Waterfall**: Complete heavy SDD, detailed UML, signed.
- **Agile**: ADR per significant decision + just-enough C4, UML only as needed.

### 6. Rules

- Each class/module traceable to `FR/UC/US` (`RTM.csv` updated).
- Each ADR references motivating NFR (e.g., `NFR-03 p95<200ms → ADR caching`).
- Do not invent a layer outside `docs/agents/architecture.md` without new ADR.

### 7. Verify

- [ ] C4/UML in PlantUML and rendered SVGs
- [ ] ADR-MADR with context/decision/consequences/alternatives
- [ ] Justified GoF matrix
- [ ] Clean dependency rule respected
- [ ] Human approved architecture
