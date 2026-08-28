# Domain Docs — Consumption Rules

How `ooad-*` skills consume domain docs.

## Before Exploring, Read

- `CONTEXT.md` at root, or `CONTEXT-MAP.md` if it exists (points to a `CONTEXT.md` per context). Read each relevant one.
- `docs/adr/` and `src/*/docs/adr/` if contexts exist.

If none exist, proceed silently; `ooad-discover`/`ooad-requirements` create them lazily when the first term/decision is resolved.

## Structure

Single-context (majority):

```
/ 
├── CONTEXT.md
├── docs/adr/
│   ├── 0001-clean-4-layer-architecture.md
│   └── 0002-postgres-for-write-model.md
└── src/
```

Multi-context (if `CONTEXT-MAP.md` exists):

```
/ 
├── CONTEXT-MAP.md
├── docs/adr/                      ← system decisions
└── src/
    ├── ordering/CONTEXT.md + docs/adr/
    └── billing/CONTEXT.md + docs/adr/
```

## Use Glossary Vocabulary

Name concepts as in `CONTEXT.md`. Do not drift to discarded synonyms. If the concept does not exist, create an entry or reconsider.

## Flag Conflicts with ADR

If your output contradicts an existing ADR, call it out: `Contradicts ADR-0002, but worth reopening because...`
