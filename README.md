# OOAD Workflow — Professional Agentic Framework

Agentic framework **OOAD + Clean 4 Layers + TDD**, aligned with the Systems Analysis paradigm (`systems-analysis-ooad-paradigm.md:3` — `IEEE830/Use Cases → UML/GoF → TDD → MVC/Layers`). Professional alternative to `mattpocock/skills` (DDD/VSA) and `addyosmani/agent-skills` (PRD→VSA SaaS).

## Methodology Profiles (selectable via `setup-ooad`)

| Profile | When | Required Artifact |
|---------|------|-------------------|
| **Iterative RUP** *(default)* | Medium product, small-to-medium team, evolving requirements with risk | Vision + detailed UCs + C4/UML + iterative ADR |
| **Waterfall** | Fixed contract, regulation, large team | Signed SRS IEEE830 + heavy SDD |
| **Agile / Scrum** | Digital product, changing requirements | US backlog INVEST + Gherkin AC + just-enough ADR |

The same 7-phase SDLC base (`Discovery → RE → Design → Implementation → Testing → Deployment → Maintenance`) is scheduled differently per profile (`artefactos-por-fase-y-metodologia.md:72-149` — *artifacts-by-phase-and-methodology*, ES).

## Skills (manual activation, suggested order)

1. `/setup-ooad` — configure profile + tracker + architecture + domain docs (once per repo)
2. `/ooad-discover` — PRD + Vision + personas + draft glossary
3. `/ooad-requirements` — SRS **or** US+UC+Gherkin + conceptual model + RTM + Fagan validation
4. `/ooad-architect` — C4/UML + data model + GoF + Clean 4 Layers + ADR-MADR
5. `/ooad-build` — Clean code (entities/usecases/adapters/frameworks) + TDD + OpenAPI
6. `/ooad-verify` — test plan + executable Gherkin (pyramid 80/15/5)
7. `/ooad-ship` — prod checklist + runbooks + rollback + changelog + pipeline

> Suggested order, not enforced: brownfield can start at `ooad-architect` with gap → US.

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

Each skill reads `docs/agents/workflow.md` to decide template and gate.

## Structure

```
ooad-workflow/
├── skills/
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
└── references/
    ├── artifacts-matrix.md
    └── definition-of-done.md
```

## Comparison

| OOAD Criterion | `ooad-workflow` | Matt Pocock | AddyOsmani |
|----------------|-----------------|-------------|------------|
| IEEE830/FR-xxx | ✅ native per profile | ❌ DDD User Stories | ❌ SaaS PRD |
| UC→Sequence→Classes | ✅ | ❌ seams | ❌ VSA |
| GoF + Clean 4 | ✅ MADR justified | Deep modules | Generic contract-first |
| TDD | ✅ RED→GREEN per layer | seam-based | ✅ |
| MVC/Layers | ✅ default | VSA | VSA SaaS |

## References

- `systems-analysis-ooad-paradigm.md` (ES)
- `artefactos-por-fase-y-metodologia.md` (ES)
- `requirements-engineering.md` + 5 RE sub-phases (ES)
- `architecture-decision-record.md` (MADR) (ES)
