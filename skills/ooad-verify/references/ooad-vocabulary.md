# OOAD Vocabulary — Shared Leading Words

Single source of truth for OOAD leading words used across all `ooad-*` skills. Every skill repeats the **token only** — definition lives here. Inspired by `codebase-design` shared vocabulary (`writing-for-agents`).

Use these terms exactly. Do not substitute `component, service, API, boundary, layer` for `module`/`layer` distinctions already defined here.

## Methodology

- **RUP (Jacobson, Booch, Rumbaugh, Kruchten)** — iterative, UC-driven, 4 phases `Inception / Elaboration / Construction / Transition`. Heavy UML, iterative within phases. Default profile.
- **Waterfall (Royce)** — sequential, heavy `SRS IEEE 29148` + `SDD` signed, legal gate, pure sequence.
- **Agile / Scrum (Schwaber, Sutherland, Beck)** — living PRD, `INVEST` US + `Gherkin` AC per sprint, just-enough ADR. Continuous delivery.

## Requirements

- **IEEE 29148 (ex-830)** — successor to IEEE 830. Contractual SRS: FR/NFR with ID, source, priority, dependency, verifiable criterion. Supersedes IEEE 830-1998.
- **FR / NFR** — Functional / Non-Functional Requirement. NFR measurable with `ISO 25010` metric (`p95<200ms`, `99.9%`).
- **Use Case — UC (Cockburn, Jacobson)** — detailed flow with primary/secondary actors, pre/postconditions, happy/alternative/exception flows. RUP driver.
- **User Story — US (Wake, Cohn)** — `INVEST (Bill Wake)` + `MoSCoW (Dai Clegg)` priority. Card/Conversation/Confirmation. Agile driver.
- **Gherkin / BDD (Dan North)** — `Given/When/Then` executable acceptance criteria. One behavior per scenario, concrete data, cover happy/edge/error/null.
- **RTM — Requirements Traceability Matrix** — `PRD → FR/UC/US → Conceptual Class → ADR → Test`. Single matrix in `RTM.csv`.
- **Fagan Inspection (Michael Fagan, 1976)** — checklist: complete, consistent, unambiguous, verifiable, traceable, correct, boundary defined.
- **MoSCoW / Kano** — prioritization: Must/Should/Could/Won't; Kano model for satisfaction.
- **BR — Business Rule** — domain origin, non-negotiable, referenced by FR.

## Architecture & Design

- **Clean Architecture / Clean 4 Layers (Robert C. Martin, Clean Architecture, 2017, ch.22)** — `Entities → Use Cases → Interface Adapters → Frameworks & Drivers`. Dependency Rule: imports point inward, `Entities` know nothing external. `Mission:` framework-independent, testable business rules — swappable UI/database with core untouched. `Symptom if ignored:` framework annotations in entities, slow/fragile tests, UI-or-DB change rewrites business rules.
- **MVC — Classic (Reenskaug/Krasner)** — `Presentation → Business Logic → Data` layered alternative.
- **Hexagonal / Ports & Adapters (Alistair Cockburn)** — explicit ports/adapters, alternative to Clean 4.
- **C4 (Simon Brown)** — L1 Context, L2 Container, L3 Component. Predecessor `Kruchten 4+1 Views`.
- **UML 2.5.1 (OMG/Booch)** — class, sequence, state diagrams in PlantUML.
- **GoF (Gamma, Helm, Johnson, Vlissides, Design Patterns, 1994, Preface + ch.1)** — creational: Factory, Singleton; structural: Adapter, Decorator, Composite, Proxy; behavioral: Observer, Strategy, State, Command. Justify per ADR. `Mission:` record recurring designs as named, evaluated solutions — shared vocabulary plus explicit tradeoffs/consequences, so designs are reusable and their intent is documented. `Symptom if ignored:` unnamed ad-hoc structures nobody recognizes, repeated design debates, pattern applied for fashion with no stated forces.
- **RDD — Responsibility-Driven Design (Wirfs-Brock, Wilkerson, Wiener, OOPSLA 1989; Wirfs-Brock & McKean, Object Design, 2003)** — design by assigning doing/knowing responsibilities to objects with collaborators. Technique: `CRC cards` (Class / Responsibilities / Collaborators) walked through against UC flows. Role stereotypes: Information holder, Structurer, Service provider, Coordinator, Controller, Interfacer. CRC output feeds GRASP assignment in `ooad-architect`. `Mission:` architectural capability goals — maximize flexibility, reusability, and encapsulation via the client–server contract (clients see intent, servers hide how). `Symptom if ignored:` data-bag classes with procedural controllers, responsibilities discovered only during coding when they are expensive to move.
- **GRASP (Craig Larman, Applying UML and Patterns, 3rd ed., ch.17 + ch.22)** — 9 responsibility-assignment patterns: a methodical, explainable way to decide what goes where, with Low Coupling as the continual evaluative goal. Use to justify every sequence-message → operation mapping; cite the pattern in the trace header and ADR:
  - **Information Expert** — assign to the class holding the data needed (default first choice). `Mission:` co-locate behavior with information so coupling stays low.
  - **Creator** — assign creation to the aggregate/container that owns or closely uses the parts. `Mission:` one stable owner per lifecycle, no scattered `new`.
  - **Controller** — a non-UI UseCase object receives system events; UI/Framework controllers only delegate. `Mission:` single entry point per system operation, UI stays thin.
  - **Low Coupling** — prefer the assignment that minimizes dependencies between classes. `Mission:` independent classes; change stops rippling.
  - **High Cohesion** — keep each class focused on one responsibility area; split God classes. `Mission:` every class earns its keep; fixes land in one place.
  - **Polymorphism** — vary behavior by type/subtype instead of conditionals on type codes. `Mission:` new variants without touching tested code.
  - **Indirection** — insert a mediator to decouple sender from receiver. `Mission:` both sides depend on something stable.
  - **Pure Fabrication** — invent a non-domain helper (e.g. saver, validator) to preserve cohesion when no domain class fits. `Mission:` protect domain cohesion; all GoF patterns are fabrications of this kind.
  - **Protected Variations** — wrap likely-to-change variation points behind a stable interface; each instance must name the GoF pattern that implements it. `Mission:` predicted instability never leaks to clients.
  - `Symptom if ignored:` God-controller, Feature Envy, repeated type-code switches, creation logic smeared across callers.
- **SOLID (Robert C. Martin, Design Principles and Design Patterns, 2000; Agile Software Development, 2003)** — five class-design principles that fight design rot (rigidity, fragility, immobility): SRP — one reason to change; OCP — open for extension, closed for modification; LSP — subtypes substitutable for base types; ISP — no client forced onto unused interfaces; DIP — depend on abstractions. Complements GRASP; cite per ADR when it drives a split. `Mission:` designs that stay soft under growth — flexible, robust, reusable. `Symptom if ignored:` shotgun surgery (one change scatters across files), divergent change (one module changes for unrelated reasons), speculative generality.
- **ADR / MADR (Michael Nygard / Oliver Starke)** — Architecture Decision Record, MADR variant: Context → Decision → Consequences → Alternatives.

## Implementation

- **TDD (Kent Beck)** — `RED → GREEN → REFACTOR`. One test per behavior, not per private method. Prefer `real > fake > stub > mock` (mock only at slow boundaries).
- **SOLID / GRASP / GoF / RDD** — apply only when justified by ADR, not by fashion, and state which `Mission:` the choice serves. Every new class cites its GRASP pattern in the trace header (`// FR-001 / UC-001 [Creator]`).
- **OpenAPI 3.1 (Swagger)** — contract-first REST spec, generated before/alongside controller.

## Verification

- **Test Pyramid (Mike Cohn) 80/15/5** — unit 80% (`entities/usecases`), integration 15% (`adapters+db`), e2e 5% (`UC flow`).
- **ISTQB** — equivalence partitioning, boundary values, decision table; black-box / white-box / UAT.
- **Gherkin execution** — `behave / cucumber / pytest-bdd / playwright`.

## Delivery

- **Continuous Delivery (Jez Humble & David Farley, 2010)** — `Build → Test → Staging → Prod` pipeline. Big-bang (Waterfall) vs incremental/beta (RUP) vs continuous with flags (Agile).
- **SRE (Google — Beyer/Jones)** — SLI/SLO/SLA, dashboards, blameless post-mortem.
- **Keep a Changelog + SemVer + Conventional Commits** — `CHANGELOG.md` with `feat/fix/breaking`.
- **Infrastructure as Code / 12-Factor** — `Dockerfile`, `infra/*.tf`, vault for secrets.

## Domain

- **Ubiquitous Language (Eric Evans, DDD)** — glossary in `CONTEXT.md`, single source, referenced by every FR.
- **CONTEXT.md / CONTEXT-MAP.md / docs/adr/** — single-context (majority) vs multi-context (monorepo).

## How to use

- Skills repeat the token (`RUP`, `Clean 4 Layers`, `Gherkin`) — do not redefine. Link here on first mention if needed.
- Adding a new leading word? Add it here first, then use token-only elsewhere.
- Human index: `docs/glossary.md` — acronym expansion + A–Z index into sections above (no definitions duplicated).
