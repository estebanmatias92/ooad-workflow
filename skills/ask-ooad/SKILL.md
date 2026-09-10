---
name: ask-ooad
description: Ask which OOAD skill or flow fits your situation. Router over the 7 ooad-workflow skills.
disable-model-invocation: true
---

# Ask OOAD — Router

User-invoked router over the `ooad-workflow` pack. Never fires autonomously — human must call `/ask-ooad`. Cures cognitive load of remembering 7 skill names (one router to remember instead of many).

## When to Use (branches)

Lifecycle order — one trigger per branch (collapse synonyms):

0. **Repo not bootstrapped** → `/setup-ooad` (RUP/Waterfall/Agile + tracker + architecture) — once per repo.
1. **No PRD / lost vision** → `/ooad-discover` (RUP Inception + Vision + MoSCoW) → produces `docs/01-discovery/PRD.md`.
2. **PRD exists, needs SRS or backlog** → `/ooad-requirements` (IEEE 29148 + UC/INVEST/Gherkin + RDD/CRC + Fagan + RTM).
3. **RE baselined, needs architecture** → `/ooad-architect` (C4 + UML + RDD→GRASP + GoF + Clean 4 Layers + ADR-MADR).
4. **Architecture approved, needs code** → `/ooad-build` (Clean 4 Layers + TDD + OpenAPI) — slice by UC/US.
5. **Code slice green, needs test plan** → `/ooad-verify` (BDD/Gherkin + Test Pyramid 80/15/5) — `4 ↔ 5` iterates per UC/US until green.
6. **QA green, needs release** → `/ooad-ship` (Continuous Delivery + SRE).
- **Brownfield gap** → start at `/ooad-architect` with gap → US (documented in `README.md:31`).

## Process

### 1. Ask

Read `docs/agents/workflow.md` if it exists to know profile (`RUP/Waterfall/Agile`). If missing → recommend `/setup-ooad` first.

Ask user one-branch question:

> `Which fits? [setup / discover / requirements / architect / build / verify / ship] — or describe your goal in one sentence.`

Map answer to branch above. If ambiguous, grill for blocker:

- What artifact is missing? PRD / SRS / UC / C4 / code / Gherkin / pipeline?
- What is blocked? `docs/agents/workflow.md` says RUP needs `Vision → UC → C4 → slices`; Waterfall needs `SRS signed → SDD → Build`; Agile needs `backlog → slices → ship`.

### 2. Dispatch

Tell user: `Run /<skill>` and show next artifact path from `references/artifacts-matrix.md` plus the next skill in lifecycle order. Do not start the skill — user must invoke it (user-invoked skills fire only by human call, never by dispatch).

**Done when:** user knows which `/ooad-*` to run next and why.

## Reference

### Vocabulary

Shared leading words live in `references/ooad-vocabulary.md` — router repeats tokens only, never redefines. See also `references/artifacts-matrix.md` for phase→artifact mapping and `templates/workflow.md` for profile gates.

### Related

- `ooad-workflow` pack is distribution-only; consumer repo workflow lives in `docs/agents/workflow.md`.
- Which bias? See `docs/dev-cycle-comparison.md` §5 decision table (OOAD vs Matt Pocock) before dispatching brownfield repos — do not mix vocabularies mid-repo.
- Future composable skills (model-invoked) will be discoverable here when `disable-model-invocation: false` is added.
