---
name: ooad-requirements
description: Ingeniería de Requerimientos OOAD — Elicitación → Análisis/Negociación → Especificación → Validación. Produce SRS IEEE830 o backlog US+Gherkin + glosario refinado + RTM. Lee docs/agents/workflow.md.
---

# OOAD Requirements — Requirements Engineering (RE)

Cubre las 5 sub-fases de `requirements-engineering.md`: `Elicitación → Análisis/Negociación → Especificación → Validación → Gestión (transversal)`. Ver `requerimientos-y-tipos.md`, `elicitacion-requerimientos.md`, `analisis-negociacion-requerimientos.md`, `especificacion-requerimientos.md`, `criterios-aceptacion.md`, `validacion-requerimientos.md`, `gestion-requerimientos.md`.

## Precondición

- `docs/agents/workflow.md` con perfil (RUP/Waterfall/Ágil).
- `docs/01-discovery/PRD.md` existe (o visión equivalente).
- `CONTEXT.md` o `docs/01-discovery/glosario-draft.md` existe.

## Proceso

### 1. Elicitación (fricciones crudas)

Lee `docs/01-discovery/*`. Clasifica cada hallazgo en los 5 tipos (`requerimientos-y-tipos.md`):

- **Funcionales (RF)** — qué hace el sistema.
- **No Funcionales (RNF)** — atributos calidad ISO25010 (`p95<200ms`, `99.9% uptime`, OWASP).
- **Restricciones** — tecnológicas/legales.
- **Reglas de Negocio** — origen dominio, no negociables.
- **De Dominio** — compliance industria.

Técnicas: entrevista, JAD, observación, encuesta, prototipo.

**Salida intermedia:** `docs/02-requirements/necesidades-crudas.md` lista `RN-001: ...`.

### 2. Análisis / Negociación

- Prioriza con **MoSCoW** o **Kano** (`analisis-negociacion-requerimientos.md`).
- Resuelve conflictos; refina glosario (`CONTEXT.md`).
- Produce **Diagrama de Clases Conceptual (dominio)** + **Diagrama Contexto / System Boundary** (`docs/02-requirements/modelo-conceptual.puml`).

**DoD análisis:** sin conflictos abiertos, glosario validado, boundary acordado.

### 3. Especificación — elige formato según perfil

| Perfil | Formato obligatorio | Template | Artefacto |
|--------|---------------------|----------|-----------|
| **Waterfall** | **SRS IEEE830** pesado, contractual (`especificacion-requerimientos.md: SRS`, `waterfall.md`) | `templates/srs-830.md` | `docs/02-requirements/SRS.md` con `RF-NNN`, `RNF-NNN`, trazabilidad `PRD→RF→RNF`, métricas |
| **RUP** | **CU detallados** + SRS híbrido (CU driver) (`rup.md`) | `templates/cu-detallado.md` | `docs/02-requirements/casos-de-uso/CU-001-*.md` + SRS resumido |
| **Ágil** | **US INVEST + Gherkin AC** (`user-stories.md: Como/Quiero/Para + INVEST`, `criterios-aceptacion.md: Given/When/Then`) | `templates/us-gherkin.md` | `docs/02-requirements/backlog/US-001-*.md` con AC ejecutables |

Híbrido permitido: RNF/restricciones en `SRS` + RF en `US/CU`. Cada RF/US referencia término glosario y `PRD`.

**Reglas:**

- Cada RF/CU/US lleva `ID` único, prioridad, origen, dependencia, criterio de aceptación.
- RNF medibles con umbral.
- Trazabilidad `PRD → RF/CU/US → Clase conceptual` en `RTM.csv`.

### 4. Validación

Aplica checklist Fagan (`validacion-requerimientos.md`):

- [ ] Completo, Consistente, No ambiguo, Verificable, Trazable, Correcto, Boundary definido

Técnicas: inspección, walkthrough, review stakeholder, prototipo. Formaliza **sign-off** (Waterfall/RUP) o **DoD por US** (Ágil).

**Salida:** `docs/02-requirements/validacion.md` + firmas / actas.

### 5. Gestión (transversal)

Establece **baseline versionada** + **RTM** (`gestion-requerimientos.md`):

- `docs/02-requirements/RTM.csv` — matriz trazabilidad.
- `docs/02-requirements/CHANGELOG-RE.md` — CCB: Request → impacto → aprobar/rechazar → nueva baseline.
- `CONTEXT.md` vivo — glosario versionado por iteración.

### 6. Output files

```
docs/02-requirements/
├── SRS.md                  (Waterfall/RUP) o
├── backlog/US-001-*.md     (Ágil)
├── casos-de-uso/CU-001-*.md (RUP)
├── glosario.md             (refinado → CONTEXT.md)
├── modelo-conceptual.puml  + .svg
├── contexto.puml
├── RTM.csv
└── validacion.md
```

### 7. Red flags

- SRS sin RNF medibles.
- US sin AC Gherkin.
- Glosario con sinónimos contradictorios.
- Matriz trazabilidad vacía.
- Avanzar a `ooad-architect` sin validación firmada (Waterfall/RUP).

### 8. Verifica

- [ ] RF/RNF clasificados y con ID
- [ ] SRS o backlog completo según perfil
- [ ] CU/US con AC Gherkin
- [ ] Modelo conceptual + contexto en PlantUML
- [ ] RTM trazable PRD→RE
- [ ] Validación aprobada
- [ ] Humano aprobó artefactos antes de diseñar
