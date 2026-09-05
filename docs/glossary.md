# Glossary — terms & acronyms

> **Human index.** Canonical definitions live in `../references/ooad-vocabulary.md` (single source; `AGENTS.md:31` / `README.md:67`). Every `ooad-*` skill repeats the **token only** — definition stays in `references/`. This file is the reader-side lookup: acronym expansion plus links into the canonical sections.
> Per-project domain words (entities, roles, business rules) live in the **consumer** `CONTEXT.md` (`../templates/glossary.md`, `../templates/domain.md`), not here.

## How to use

* **Token rule:** use leading words exactly as in `../references/ooad-vocabulary.md` — no synonym drift (`AGENTS.md:38`). Link to the canonical file on first mention if the reader may not know it.
* **Adding a term:** add it to `../references/ooad-vocabulary.md` first, then link it here. Never define the same concept in two places.

## Acronyms — expanded

| Acronym | Expands to | Canonical definition |
|---------|------------|----------------------|
| AC | Acceptance Criteria | [Gherkin / BDD](../references/ooad-vocabulary.md#requirements) |
| ADR | Architecture Decision Record | [ADR / MADR](../references/ooad-vocabulary.md#architecture--design) |
| BDD | Behavior-Driven Development | [Gherkin / BDD](../references/ooad-vocabulary.md#requirements) |
| BR | Business Rule | [BR — Business Rule](../references/ooad-vocabulary.md#requirements) |
| C4 | C4 Model (Context, Container, Component) | [C4](../references/ooad-vocabulary.md#architecture--design) |
| CCB | Change Control Board | [RTM — Requirements Traceability Matrix](../references/ooad-vocabulary.md#requirements) (CHANGELOG-RE) |
| DORA | DevOps Research and Assessment metrics | [SRE](../references/ooad-vocabulary.md#delivery) |
| FR | Functional Requirement | [FR / NFR](../references/ooad-vocabulary.md#requirements) |
| GoF | Gang of Four (Gamma et al.) | [GoF](../references/ooad-vocabulary.md#architecture--design) |
| GRASP | General Responsibility Assignment Software Patterns | [SOLID + GRASP](../references/ooad-vocabulary.md#architecture--design) |
| INVEST | Independent, Negotiable, Valuable, Estimable, Small, Testable | [User Story — US](../references/ooad-vocabulary.md#requirements) |
| ISTQB | International Software Testing Qualifications Board | [ISTQB](../references/ooad-vocabulary.md#verification) |
| KPI | Key Performance Indicator | [MoSCoW / Kano](../references/ooad-vocabulary.md#requirements) (PRD) |
| MADR | Markdown ADR | [ADR / MADR](../references/ooad-vocabulary.md#architecture--design) |
| MoSCoW | Must, Should, Could, Won't | [MoSCoW / Kano](../references/ooad-vocabulary.md#requirements) |
| MVC | Model-View-Controller | [MVC — Classic](../references/ooad-vocabulary.md#architecture--design) |
| NFR | Non-Functional Requirement | [FR / NFR](../references/ooad-vocabulary.md#requirements) |
| PRD | Product Requirements Document | [RUP — Vision](../references/ooad-vocabulary.md#methodology) |
| RTM | Requirements Traceability Matrix | [RTM — Requirements Traceability Matrix](../references/ooad-vocabulary.md#requirements) |
| RUP | Rational Unified Process | [RUP](../references/ooad-vocabulary.md#methodology) |
| SDD | Software Design Description | [RUP](../references/ooad-vocabulary.md#methodology) / [ADR / MADR](../references/ooad-vocabulary.md#architecture--design) |
| SDLC | Software Development Life Cycle | [RUP](../references/ooad-vocabulary.md#methodology) |
| SLA | Service Level Agreement | [SRE](../references/ooad-vocabulary.md#delivery) |
| SLI | Service Level Indicator | [SRE](../references/ooad-vocabulary.md#delivery) |
| SLO | Service Level Objective | [SRE](../references/ooad-vocabulary.md#delivery) |
| SOLID | Single responsibility, Open/closed, Liskov, Interface segregation, Dependency inversion | [SOLID + GRASP](../references/ooad-vocabulary.md#architecture--design) |
| SRS | Software Requirements Specification (IEEE 29148 ex-830) | [IEEE 29148](../references/ooad-vocabulary.md#requirements) |
| SRE | Site Reliability Engineering | [SRE](../references/ooad-vocabulary.md#delivery) |
| TDD | Test-Driven Development | [TDD](../references/ooad-vocabulary.md#implementation) |
| UAT | User Acceptance Testing | [ISTQB](../references/ooad-vocabulary.md#verification) |
| UC | Use Case | [Use Case — UC](../references/ooad-vocabulary.md#requirements) |
| UML | Unified Modeling Language | [UML 2.5.1](../references/ooad-vocabulary.md#architecture--design) |
| US | User Story | [User Story — US](../references/ooad-vocabulary.md#requirements) |
| VSA | Vertical Slice Architecture | [Clean Architecture — Clean 4 Layers](../references/ooad-vocabulary.md#architecture--design) (contrast) |

## Terms A–Z — index into canonical sections

Links below are entry points into `../references/ooad-vocabulary.md`; the canonical file remains the definition.

* **Methodology:** [RUP](../references/ooad-vocabulary.md#methodology) · [Waterfall](../references/ooad-vocabulary.md#methodology) · [Agile / Scrum](../references/ooad-vocabulary.md#methodology)
* **Requirements:** [IEEE 29148](../references/ooad-vocabulary.md#requirements) · [FR / NFR](../references/ooad-vocabulary.md#requirements) · [Use Case — UC](../references/ooad-vocabulary.md#requirements) · [User Story — US](../references/ooad-vocabulary.md#requirements) · [Gherkin / BDD](../references/ooad-vocabulary.md#requirements) · [RTM](../references/ooad-vocabulary.md#requirements) · [Fagan Inspection](../references/ooad-vocabulary.md#requirements) · [MoSCoW / Kano](../references/ooad-vocabulary.md#requirements) · [BR](../references/ooad-vocabulary.md#requirements)
* **Architecture & Design:** [Clean Architecture / Clean 4 Layers](../references/ooad-vocabulary.md#architecture--design) · [MVC — Classic](../references/ooad-vocabulary.md#architecture--design) · [Hexagonal / Ports & Adapters](../references/ooad-vocabulary.md#architecture--design) · [C4](../references/ooad-vocabulary.md#architecture--design) · [UML 2.5.1](../references/ooad-vocabulary.md#architecture--design) · [GoF](../references/ooad-vocabulary.md#architecture--design) · [SOLID + GRASP](../references/ooad-vocabulary.md#architecture--design) · [ADR / MADR](../references/ooad-vocabulary.md#architecture--design)
* **Implementation:** [TDD](../references/ooad-vocabulary.md#implementation) · [OpenAPI 3.1](../references/ooad-vocabulary.md#implementation)
* **Verification:** [Test Pyramid](../references/ooad-vocabulary.md#verification) · [ISTQB](../references/ooad-vocabulary.md#verification) · [Gherkin execution](../references/ooad-vocabulary.md#verification)
* **Delivery:** [Continuous Delivery](../references/ooad-vocabulary.md#delivery) · [SRE](../references/ooad-vocabulary.md#delivery) · [Keep a Changelog + SemVer + Conventional Commits](../references/ooad-vocabulary.md#delivery) · [Infrastructure as Code / 12-Factor](../references/ooad-vocabulary.md#delivery)
* **Domain:** [Ubiquitous Language](../references/ooad-vocabulary.md#domain) · [CONTEXT.md / CONTEXT-MAP.md / docs/adr/](../references/ooad-vocabulary.md#domain)

## Contrast terms — Matt Pocock pack (not OOAD)

> Definitions live outside this repo (`~/.agents/skills/`). Summarized here so `docs/dev-cycle-comparison.md` readers can follow the comparison without importing DDD vocabulary into OOAD artifacts. **Do not use these as substitutes for OOAD leading words** — see no-drift rule `AGENTS.md:38`.

| Term (Matt) | What it means there | Source (external) | OOAD counterpart / note |
|-------------|--------------------|--------------------|------------------------|
| Seam | Highest testable boundary — the public interface you test through | `~/.agents/skills/tdd/SKILL.md:20` + `~/.agents/skills/codebase-design/SKILL.md` | No OOAD equivalent; OOAD tests via Clean layer boundaries and `RTM`-traced Gherkin |
| Deep module | A lot of behavior behind a small interface at a clean seam | `~/.agents/skills/codebase-design/SKILL.md` | Contrast with Clean 4 layer modules — different modularity criterion |
| Tracer bullet | Narrow but complete vertical slice through every layer, demoable alone | `~/.agents/skills/to-tickets/SKILL.md:31` | Similar to OOAD vertical slice (`ooad-build`: Entity + UseCase + Adapter + Controller) but declared via blocking edges, not RTM |
| Blocking edges | `Blocked by` declarations between tickets; determines frontier | `~/.agents/skills/to-tickets/SKILL.md:38` | OOAD traces via `RTM.csv` (`PRD → FR/UC → Class → ADR → Test`) |
| Frontier | Every decision whose prerequisites are settled — ask the whole frontier per round | `~/.agents/skills/grilling/SKILL.md:8` | RUP frontier is artifact-gated (PRD → RE → Arch), not conversation-gated |
| Grilling | Relentless interview by rounds until frontier empty | `~/.agents/skills/grilling/SKILL.md` | OOAD elicitation is time-boxed interviews/JAD then Fagan validation |
| ready-for-agent | Triage label meaning an issue is agent-grabbable | `~/.agents/skills/to-spec/SKILL.md:19` / `to-tickets` | OOAD uses `RTM` + `validation.md` sign-off as gate, not labels |
| CONTEXT.md (Matt) | Project glossary built inline during grilling | `~/.agents/skills/domain-modeling/SKILL.md` | Same file name as OOAD consumer `CONTEXT.md` (`templates/glossary.md`), but lifecycle differs — OOAD refines per iteration in `ooad-requirements` analysis |

## See also

* Canonical: `../references/ooad-vocabulary.md` — single source (add terms there first)
* Consumer templates: `../templates/glossary.md` + `../templates/domain.md` + `../templates/workflow.md`
* Pack docs: `../README.md:Structure` + `../AGENTS.md:References` + `dev-cycle-comparison.md` + `systems-analysis-ooad-paradigm.md`
* Matrix: `../references/artifacts-matrix.md` + `../references/definition-of-done.md`
