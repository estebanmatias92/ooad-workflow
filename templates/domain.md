# Domain Docs — reglas de consumo

Cómo las skills `ooad-*` consumen docs de dominio.

## Antes de explorar, lee

- `CONTEXT.md` en root, o `CONTEXT-MAP.md` si existe (apunta a un `CONTEXT.md` por contexto). Lee cada uno relevante al tema.
- `docs/adr/` y `src/*/docs/adr/` si hay contextos.

Si no existen, procede en silencio; `ooad-discover`/`ooad-requirements` los crean lazy cuando se resuelve el primer término/decisión.

## Estructura

Single-context (mayoría):

```
/ 
├── CONTEXT.md
├── docs/adr/
│   ├── 0001-arquitectura-clean-4-capas.md
│   └── 0002-postgres-para-write-model.md
└── src/
```

Multi-context (si hay `CONTEXT-MAP.md`):

```
/ 
├── CONTEXT-MAP.md
├── docs/adr/                      ← decisiones sistema
└── src/
    ├── ordering/CONTEXT.md + docs/adr/
    └── billing/CONTEXT.md + docs/adr/
```

## Usa el vocabulario del glosario

Nombra conceptos como en `CONTEXT.md`. No derives a sinónimos descartados. Si el concepto no existe, crea entrada o reconsidera.

## Flag conflictos con ADR

Si tu output contradice ADR existente, señálalo: `Contradice ADR-0002, pero vale reabrir porque...`
