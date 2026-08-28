---
name: setup-ooad
description: Configure a repo for the professional OOAD workflow (RUP/Waterfall/Agile). Choose methodology profile, tracker, architecture and docs layout. Run once per repo before using ooad-* skills.
disable-model-invocation: false
---

# Setup OOAD Workflow

Scaffold the per-repo configuration that `ooad-*` skills assume. Inspired by `setup-matt-pocock-skills` but for the `OOAD + Clean Architecture` paradigm (`systems-analysis-ooad-paradigm.md:3`, `artefactos-por-fase-y-metodologia.md:137-149` (ES)).

- **Methodology profile**: RUP (default) / Waterfall / Agile — determines which artifacts are required and which gates apply.
- **Issue tracker**: where issues live (GitHub / GitLab / Local markdown / Other).
- **Architecture**: Clean 4 Layers (default) / Classic MVC Layers / Hexagonal.
- **Domain docs layout**: single-context vs multi-context.

Prompt-driven skill, not a deterministic script. Explore, present, confirm and write.

## Process

### 1. Explore

Read initial state; do not assume:

- `git remote -v` and `.git/config`: GitHub? GitLab? no remote?
- `AGENTS.md` / `CLAUDE.md` at root: does `## Agent skills` exist? which to edit?
- `CONTEXT.md` and `CONTEXT-MAP.md` at root
- `docs/adr/` and `src/*/docs/adr/`
- `docs/agents/`: does `workflow.md` / `issue-tracker.md` / `domain.md` already exist?
- `.scratch/`: indicates prior local-markdown tracker
- `pnpm-workspace.yaml`, `package.json:workspaces`, `packages/*`: monorepo signal → multi-context
- `ooad-workflow/templates/workflow.md`: base template

### 2. Present and Ask

Summarize findings and missing pieces. One section, one answer, then the next. Lead with the recommended answer so the user can accept in one word. Skip already-resolved sections.

**Section A: Methodology profile (required).**

> Profile defines which artifacts are required and the gating. See `artefactos-por-fase-y-metodologia.md:72-129` (ES).

- **Iterative RUP (recommended, default)** — 4 phases `Inception/Elaboration/Construction/Transition`, UC-driven, heavy UML, iterations within phases. Ideal for Systems Analysis curriculum (`rup.md` ES). Required artifacts: `Vision + glossary + detailed UCs + C4/UML + ADR`.
- **Sequential Waterfall** — heavy `SRS IEEE830 + heavy SDD` signed, legal gate, pure sequential (`waterfall.md` ES). Required artifacts: `complete PRD + SRS + SDD + formal Test Plan`.
- **Iterative Agile / Scrum** — `living PRD + INVEST US + Gherkin AC` per sprint, just-enough ADR (`agile-scrum.md`, `user-stories.md`, `criterios-aceptacion.md` ES). Required artifacts: `US backlog + executable AC + ADR`.

Question: `Profile? [RUP* / Waterfall / Agile]`

Save to `docs/agents/workflow.md` (see template `templates/workflow.md`).

**Section B: Issue tracker.**

> Where `ooad-*` issues live. See `setup-matt-pocock-skills:issue-tracker-*.md`.

- **GitHub** (default if remote points to github.com): `gh issue create/view/list` (`issue-tracker-github.md:5`)
- **GitLab**: `glab issue create/view/list`
- **Local markdown**: `.scratch/<feature>/spec.md + issues/NN-slug.md` (`issue-tracker-local.md:5`)
- **Other** (Jira/Linear/etc.): describe workflow in one paragraph; saved as freeform prose

Question: `Tracker? [GitHub* / GitLab / Local / Other]`

Save to `docs/agents/issue-tracker.md`.

**Section C: Architecture.**

- **Clean 4 Layers (recommended, default)** — `Entities → Use Cases → Interface Adapters → Frameworks` (majority of curriculum, `systems-analysis-ooad-paradigm.md:49` ES).
- **Classic MVC Layers** — `Presentation → Business Logic → Data`.
- **Hexagonal (Ports & Adapters)** — explicit ports/adapters.

Question: `Architecture? [Clean4* / MVC / Hexagonal]`

Save to `docs/agents/architecture.md`.

**Section D: Domain docs layout.** Default **single-context** (`CONTEXT.md + docs/adr/`). Offer **multi-context** (`CONTEXT-MAP.md` per context) only if monorepo signal found. If no signal, write single without asking.

Save to `docs/agents/domain.md` (see `domain.md:14`).

### 3. Confirm and Edit

Show draft of:

- Block `## Agent skills (OOAD)` for `CLAUDE.md` / `AGENTS.md`.
- Contents of `docs/agents/workflow.md`, `issue-tracker.md`, `architecture.md`, `domain.md`.

Let user edit before writing.

### 4. Write

**Pick file to edit:**

- If `CLAUDE.md` exists, edit it.
- Else `AGENTS.md`.
- If neither exists, ask which to create; do not choose.

Never create `AGENTS.md` when `CLAUDE.md` already exists (or vice versa). If block `## Agent skills (OOAD)` already exists, update in-place.

**Block:**

```markdown
## Agent skills (OOAD)

### Workflow profile

[Iterative RUP | Waterfall | Agile] — Clean 4 Layers. See `docs/agents/workflow.md`.

### Issue tracker

[one-line summary]. See `docs/agents/issue-tracker.md`.

### Architecture

[Clean 4 Layers | MVC | Hexagonal]. See `docs/agents/architecture.md`.

### Domain docs

[single-context | multi-context]. See `docs/agents/domain.md`.
```

Write `docs/agents/*.md` using templates in `ooad-workflow/templates/`:

- `workflow.md` — profile + artifacts matrix by phase
- `issue-tracker-github.md` / `issue-tracker-gitlab.md` / `issue-tracker-local.md`
- `domain.md` — CONTEXT/ADR consumption rules
- `architecture.md` — layers + dependency rules

For `Other` tracker, write `issue-tracker.md` from scratch with user description.

### 5. Done

Tell user setup is complete and which `ooad-*` skills will now read the config. Mention `docs/agents/*.md` is hand-editable; re-running `setup-ooad` is only needed to change profile/tracker.
