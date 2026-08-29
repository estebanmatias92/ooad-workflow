---
name: setup-ooad
description: RUP/Waterfall/Agile + Clean Architecture (Robert C. Martin) — configure methodology profile, issue tracker and 4-layer layout. Use when bootstrapping a repo before any ooad-* skill.
disable-model-invocation: true
---

# Setup OOAD Workflow

Scaffold the per-repo configuration `ooad-*` skills assume. One run per repo; re-run only to change profile/tracker. See `references/ooad-vocabulary.md` for leading words (RUP, Clean 4 Layers, IEEE 29148, etc.).

## Preconditions

- Repo is `git init`'d (remote may be empty).

## Process

### 1. Explore — do not assume

Read whatever exists:

- `git remote -v` → GitHub / GitLab / none
- `AGENTS.md` / `CLAUDE.md` → does `## Agent skills (OOAD)` exist?
- `CONTEXT.md`, `CONTEXT-MAP.md`, `docs/adr/`, `src/*/docs/adr/`, `docs/agents/`
- `.scratch/` → prior local-markdown tracker
- `pnpm-workspace.yaml` / `package.json:workspaces` / `packages/*` → monorepo signal
- `ooad-workflow/templates/workflow.md` — base template

**Done when:** profile, tracker, architecture, and domain layout are all known or known-missing.

### 2. Present and Ask — one section, one answer

Lead each question with the recommended answer so user can accept in one word. Skip resolved sections.

**A — Methodology profile (required).** Determines required artifacts and gates (`references/artifacts-matrix.md`).

- **Iterative RUP (Jacobson/Kruchten) — default** — `Inception/Elaboration/Construction/Transition`, UC-driven, heavy UML, iterations within phases. Required: `Vision + glossary + detailed UCs + C4/UML + ADR`.
- **Sequential Waterfall (Royce)** — `SRS IEEE 29148` + heavy `SDD` signed, legal gate. Required: `complete PRD + SRS + SDD + formal Test Plan`.
- **Iterative Agile/Scrum (Schwaber/Sutherland/Beck)** — `living PRD + INVEST (Wake) US + Gherkin/BDD (North) AC` per sprint, just-enough ADR. Required: `US backlog + executable AC + ADR`.

Ask: `Profile? [RUP* / Waterfall / Agile]`

**B — Issue tracker.** Where `ooad-*` issues live.

- **GitHub** (default if remote → github.com): `gh issue create/view/list` (`templates/issue-tracker-github.md:5`)
- **GitLab**: `glab issue create/view/list`
- **Local Markdown**: `.scratch/<feature>/spec.md + issues/NN-slug.md` (`templates/issue-tracker-local.md:5`)
- **Other** (Jira/Linear/etc.): one paragraph workflow → saved as prose

Ask: `Tracker? [GitHub* / GitLab / Local / Other]`

**C — Architecture (default: Clean 4 Layers).**

- **Clean 4 Layers (Robert C. Martin) — default** — `Entities → Use Cases → Interface Adapters → Frameworks` (`references/ooad-vocabulary.md`).
- **Classic MVC (Reenskaug)** — `Presentation → Business Logic → Data`.
- **Hexagonal / Ports & Adapters (Cockburn)** — explicit ports/adapters.

Ask: `Architecture? [Clean4* / MVC / Hexagonal]`

**D — Domain docs layout.** Default `single-context` (`CONTEXT.md + docs/adr/`). Offer `multi-context` (`CONTEXT-MAP.md`) only if monorepo signal found.

**Done when:** user answered A (and B/C/D if not auto-resolved).

### 3. Confirm and Edit

Show drafts of:

- `## Agent skills (OOAD)` block for `CLAUDE.md` / `AGENTS.md`
- `docs/agents/workflow.md`, `issue-tracker.md`, `architecture.md`, `domain.md`

Let user edit before writing.

### 4. Write

Pick file to edit: if `CLAUDE.md` exists → edit it; else `AGENTS.md`; if neither → ask which to create (never create both).

If block exists, update in-place:

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

Write `docs/agents/*.md` from `ooad-workflow/templates/`:

- `workflow.md` — profile + artifacts matrix
- `issue-tracker-github.md` / `issue-tracker-local.md` (or freeform for Other)
- `domain.md` — CONTEXT/ADR consumption rules
- `architecture.md` — layers + Dependency Rule

**Done when:** all four files written; `AGENTS.md`/`CLAUDE.md` block updated; user can open each path and see expected content.

## Reference

### Done

Setup complete when `docs/agents/workflow.md` is readable and `/ask-ooad` lists the next skill. Mention files are hand-editable; re-running is only for profile/tracker change.
