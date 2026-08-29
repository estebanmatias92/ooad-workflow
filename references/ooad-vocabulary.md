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

- **Clean Architecture / Clean 4 Layers (Robert C. Martin)** — `Entities → Use Cases → Interface Adapters → Frameworks & Drivers`. Dependency Rule: imports point inward, `Entities` know nothing external.
- **MVC — Classic (Reenskaug/Krasner)** — `Presentation → Business Logic → Data` layered alternative.
- **Hexagonal / Ports & Adapters (Alistair Cockburn)** — explicit ports/adapters, alternative to Clean 4.
- **C4 (Simon Brown)** — L1 Context, L2 Container, L3 Component. Predecessor `Kruchten 4+1 Views`.
- **UML 2.5.1 (OMG/Booch)** — class, sequence, state diagrams in PlantUML.
- **GoF (Gamma, Helm, Johnson, Vlissides, 1994)** — creational: Factory, Singleton; structural: Adapter, Decorator, Composite, Proxy; behavioral: Observer, Strategy, State, Command. Justify per ADR.
- **SOLID (Martin)** + **GRASP (Craig Larman)** — single responsibility, information expert, etc.
- **ADR / MADR (Michael Nygard / Oliver Starke)** — Architecture Decision Record, MADR variant: Context → Decision → Consequences → Alternatives.

## Implementation

- **TDD (Kent Beck)** — `RED → GREEN → REFACTOR`. One test per behavior, not per private method. Prefer `real > fake > stub > mock` (mock only at slow boundaries).
- **SOLID/GRASP/GoF** — apply only when justified by ADR, not by fashion.
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
