---
name: ooad-discover
description: Fase Discovery OOAD — produce PRD, Vision y glosario draft. Primera skill del workflow RUP/Waterfall/Ágil. Lee docs/agents/workflow.md para gating por perfil.
---

# OOAD Discover — Discovery / Investigación

## Objetivo

Transformar una idea vaga o charter inicial en un **PRD** con visión, KPIs, personas y límite de alcance. Alimenta la fase RE. Ver `product-requirements-document.md`, `lean-startup.md`, `glosario-dominio.md`, `artefactos-por-fase-y-metodologia.md:72 Discovery`.

## Cuándo usar

- Repo recién configurado con `setup-ooad` sin PRD.
- Nueva iniciativa/producto antes de escribir SRS/US.
- Brownfield: cuando hay que reconstruir visión perdida.

**No usar para:** fix de una línea, typo, refactor sin cambio de alcance.

## Precondición

- `docs/agents/workflow.md` existe (perfil elegido).
- Charter o descripción stakeholder mínima (aunque sea 1 párrafo).

## Proceso

### 1. Explora

- Lee `docs/agents/workflow.md` (perfil) y `docs/agents/domain.md` (dónde va glosario).
- Lee `CONTEXT.md` si existe; si no, se creará draft aquí.
- Revisa `elicitacion-requerimientos.md: técnicas entrevista/JAD/observación`.

### 2. Entrevista (si falta contexto)

Si la idea está subespecificada, aplica `interview-me` minimal (1 pregunta a la vez con hipótesis):

- ¿Quién es el usuario? ¿Por qué ahora? ¿Qué éxito medible? ¿Qué queda fuera?

No bloquees si el usuario quiere velocidad — genera draft con supuestos listados.

### 3. Produce artefactos

| Artefacto | Ruta | Perfil |
|-----------|------|--------|
| **PRD** | `docs/01-discovery/PRD.md` (plantilla `templates/prd.md`) | Todos: Waterfall=firmado completo, RUP=Vision+KPIs, Ágil=1 pág vivo |
| **Vision Statement** | sección dentro de PRD | RUP obligatorio (Inception) |
| **User Personas** | `docs/01-discovery/personas.md` | RUP/Ágil sí, Waterfall a veces |
| **Glosario draft** | `docs/01-discovery/glosario-draft.md` → luego `CONTEXT.md` | Todos draft aquí, refinado en `ooad-requirements` |
| **Diagrama Contexto tentativo** | `docs/01-discovery/contexto-tentativo.puml` | Opcional en Discovery, obligatorio en RE |

Plantillas: `templates/prd.md`, `templates/glossary.md`.

**Secciones PRD mínimas:**

```
# PRD: [Nombre]
## Visión / Elevator pitch
## Usuarios / Personas
## KPIs / Success criteria (medibles)
## Features (Waterfall: narrativa completa; Ágil: lista priorizada MoSCoW)
## Out of scope
## Supuestos / Riesgos iniciales
## Open questions
```

### 4. Gates por perfil

- **RUP**: Vision revisada con stakeholder; glosario draft sin ambigüedad crítica.
- **Waterfall**: PRD completo revisado y pre-firmado antes de RE.
- **Ágil**: PRD 1 pág revisado; backlog inicial con 5-10 US priorizadas.

### 5. Verifica

- [ ] PRD cubre visión + KPIs + out-of-scope + supuestos
- [ ] Glosario draft sin términos contradictorios con `CONTEXT.md` existente
- [ ] Supuestos listados explícitamente (no llenados en silencio)
- [ ] Humano revisó y aprobó

No avances a `ooad-requirements` sin aprobación.
