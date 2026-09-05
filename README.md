# OOAD Workflow — Professional Agentic Framework

Agentic framework **OOAD + Clean 4 Layers + TDD**, aligned with the Systems Analysis paradigm (`systems-analysis-ooad-paradigm.md:3` — `IEEE830/Use Cases → UML/GoF → TDD → MVC/Layers`). Professional alternative to `mattpocock/skills` (DDD/VSA) and `addyosmani/agent-skills` (PRD→VSA SaaS).

## Methodology Profiles (selectable via `setup-ooad`)

| Profile | When | Required Artifact |
|---------|------|-------------------|
| **Iterative RUP** *(default)* | Medium product, small-to-medium team, evolving requirements with risk | Vision + detailed UCs + C4/UML + iterative ADR |
| **Waterfall** | Fixed contract, regulation, large team | Signed SRS IEEE830 + heavy SDD |
| **Agile / Scrum** | Digital product, changing requirements | US backlog INVEST + Gherkin AC + just-enough ADR |

The same 7-phase SDLC base (`Discovery → RE → Design → Implementation → Testing → Deployment → Maintenance`) is scheduled differently per profile (`artefactos-por-fase-y-metodologia.md:72-149` — *artifacts-by-phase-and-methodology*, ES).

## Skills (all `disable-model-invocation: true`, human calls `/name`)

Router: `/ask-ooad` — “which skill fits?” (one trigger per branch). Then:

1. `/setup-ooad` — RUP/Waterfall/Agile + Clean Architecture — bootstrap repo (once)
2. `/ooad-discover` — RUP Inception + Vision + MoSCoW — PRD + draft glossary
3. `/ooad-requirements` — IEEE 29148 + UC/INVEST/Gherkin + Fagan + RTM
4. `/ooad-architect` — C4 + UML + GoF + Clean 4 Layers + ADR-MADR
5. `/ooad-build` — Clean 4 Layers + TDD (Beck) + OpenAPI — slice by UC/US
6. `/ooad-verify` — BDD/Gherkin + Test Pyramid 80/15/5 — RTM-traced
7. `/ooad-ship` — Continuous Delivery + SRE — checklist + rollback + changelog

> Suggested order, not enforced: brownfield can start at `ooad-architect` with gap → US. Not sure? `/ask-ooad`.

## Installation

### Development (this repo)

Skills live in `./ooad-workflow/` and are exposed to opencode via global symlink:

```bash
ln -s $(pwd)/ooad-workflow ~/.config/opencode/skills/ooad-workflow
```

Verify:

```bash
ls -l ~/.config/opencode/skills/ooad-workflow
# should point to .../ooad-systems-modeling/ooad-workflow
```

### Alternative local repo

```
ooad-workflow/.opencode/skills/  # if you prefer not to use global
```

## Usage

```bash
# 1) Configure new repo
/setup-ooad   # choose RUP* / Waterfall / Agile, tracker, architecture

# 2) Cycle per feature (RUP example: per iteration)
 /ooad-discover      # PRD + Vision
 /ooad-requirements  # UC-001.. + RTM
 /ooad-architect     # C4 + classes + ADR
 /ooad-build         # TDD per UC
 /ooad-verify        # Gherkin E2E
 /ooad-ship          # release
```

Each skill reads `docs/agents/workflow.md` for profile gating (`templates/workflow.md`). Shared vocabulary in `references/ooad-vocabulary.md` — no synonym drift.

## Structure

```
ooad-workflow/
├── skills/
│   ├── ask-ooad/ (router)
│   ├── setup-ooad/
│   ├── ooad-discover/
│   ├── ooad-requirements/
│   ├── ooad-architect/
│   ├── ooad-build/
│   ├── ooad-verify/
│   └── ooad-ship/
├── templates/
│   ├── prd.md, srs-830.md, use-case-detailed.md, us-gherkin.md
│   ├── glossary.md, rtm.csv, adr-madr.md
│   ├── c4.puml, class-diagram.puml, sequence-diagram.puml
│   └── workflow.md, domain.md, architecture.md, issue-tracker-*.md
├── docs/
 │   ├── glossary.md               # term & acronym index → references/ooad-vocabulary.md (single source)
 │   ├── dev-cycle-comparison.md   # DDD vs OOAD comparison + activity diagram
 │   └── diagrams/dev-cycle-comparison.puml+.svg
 └── references/
     ├── artifacts-matrix.md
     ├── definition-of-done.md
     └── ooad-vocabulary.md  # shared leading words (single source; human index: docs/glossary.md)
```

## Comparison

> **Which cycle to follow?** Side-by-side activity diagram + origin, step-by-step outputs/state,
> profile variants and decision table: [`docs/dev-cycle-comparison.md`](docs/dev-cycle-comparison.md)
> — diagram source `docs/diagrams/dev-cycle-comparison.puml` (render: `plantuml -tsvg docs/diagrams/dev-cycle-comparison.puml`).

| OOAD Criterion | `ooad-workflow` | Matt Pocock | AddyOsmani |
|----------------|-----------------|-------------|------------|
| IEEE830/FR-xxx | ✅ native per profile | ❌ DDD User Stories | ❌ SaaS PRD |
| UC→Sequence→Classes | ✅ | ❌ seams | ❌ VSA |
| GoF + Clean 4 | ✅ MADR justified | Deep modules | Generic contract-first |
| TDD | ✅ RED→GREEN per layer | seam-based | ✅ |
| MVC/Layers | ✅ default | VSA | VSA SaaS |

## References

- `docs/glossary.md` — acronym & term index (human entry point)
- `references/ooad-vocabulary.md` — single source for leading words (writing-for-agents)
- `docs/systems-analysis-ooad-paradigm.md` (ES) (canonical is `docs/systems-analysis-ooad-paradigm.md`)
- `artefactos-por-fase-y-metodologia.md` (ES)
- `requirements-engineering.md` + 5 RE sub-phases (ES)
- `architecture-decision-record.md` (MADR) (ES)
