---
name: setup-ooad
description: Configura un repo para el workflow OOAD profesional (RUP/Waterfall/Ágil). Elige perfil metodológico, tracker, arquitectura y layout de docs. Ejecutar una vez por repo antes de usar las skills ooad-*.
disable-model-invocation: false
---

# Setup OOAD Workflow

Scaffold la configuración por-repo que asumen las skills `ooad-*`. Inspirado en `setup-matt-pocock-skills` pero para el paradigma `OOAD + Clean Architecture` (`systems-analysis-ooad-paradigm.md:3`, `artefactos-por-fase-y-metodologia.md:137-149`).

- **Perfil metodológico**: RUP (default) / Waterfall / Ágil — determina qué artefactos son obligatorios y qué gates aplican.
- **Issue tracker**: dónde viven las issues (GitHub / GitLab / Local markdown / Otro).
- **Arquitectura**: Clean 4 capas (default) / Capas MVC clásica / Hexagonal.
- **Domain docs layout**: single-context vs multi-context.

Skill prompt-driven, no script determinístico. Explora, presenta, confirma y escribe.

## Proceso

### 1. Explora

Lee el estado inicial; no asumas:

- `git remote -v` y `.git/config`: ¿GitHub? ¿GitLab? ¿sin remote?
- `AGENTS.md` / `CLAUDE.md` en root: ¿existe `## Agent skills`? ¿cuál editar?
- `CONTEXT.md` y `CONTEXT-MAP.md` en root
- `docs/adr/` y `src/*/docs/adr/`
- `docs/agents/`: ¿ya existe `workflow.md` / `issue-tracker.md` / `domain.md`?
- `.scratch/`: indica tracker local-markdown previo
- `pnpm-workspace.yaml`, `package.json:workspaces`, `packages/*`: señal monorepo → multi-context
- `ooad-workflow/templates/workflow.md`: plantilla base

### 2. Presenta y pregunta

Resume lo hallado y lo faltante. Una sección, una respuesta, luego la siguiente. Lidera con la respuesta recomendada para que el usuario pueda aceptar con una palabra. Salta secciones ya resueltas.

**Sección A: Perfil metodológico (obligatoria).**

> El perfil define qué artefactos son obligatorios y el gating. Ver `artefactos-por-fase-y-metodologia.md:72-129`.

- **RUP iterativo (recomendado, default)** — 4 fases `Inception/Elaboration/Construction/Transition`, CU-driver, UML pesado, iteraciones dentro de fases. Ideal para tu carrera (`rup.md`). Artefactos obligatorios: `Vision + glosario + CU detallados + C4/UML + ADR`.
- **Waterfall secuencial** — `SRS IEEE830 pesado + SDD pesado` firmados, gate legal, secuencial puro (`waterfall.md`). Artefactos obligatorios: `PRD completo + SRS + SDD + Plan de Pruebas formal`.
- **Ágil / Scrum iterativo** — `PRD vivo + US INVEST + Gherkin AC` por sprint, ADR just-enough (`agile-scrum.md`, `user-stories.md`, `criterios-aceptacion.md`). Artefactos obligatorios: `backlog US + AC ejecutables + ADR`.

Pregunta: `¿Perfil? [RUP* / Waterfall / Ágil]`

Guarda en `docs/agents/workflow.md` (ver plantilla `templates/workflow.md`).

**Sección B: Issue tracker.**

> Dónde viven las issues que leen/escriben `ooad-*`. Ver `setup-matt-pocock-skills:issue-tracker-*.md`.

- **GitHub** (default si remote apunta a github.com): `gh issue create/view/list` (`issue-tracker-github.md:5`)
- **GitLab**: `glab issue create/view/list`
- **Local markdown**: `.scratch/<feature>/spec.md + issues/NN-slug.md` (`issue-tracker-local.md:5`)
- **Otro** (Jira/Linear/etc.): describe en un párrafo el workflow; se graba como prosa libre

Pregunta: `¿Tracker? [GitHub* / GitLab / Local / Otro]`

Guarda en `docs/agents/issue-tracker.md`.

**Sección C: Arquitectura.**

- **Clean 4 capas (recomendado, default)** — `Entities → Use Cases → Interface Adapters → Frameworks` (tu mayoría curricular, `systems-analysis-ooad-paradigm.md:49`).
- **Capas MVC clásica** — `Presentación → Lógica Negocio → Datos`.
- **Hexagonal (Ports & Adapters)** — puertos/adaptadores explícitos.

Pregunta: `¿Arquitectura? [Clean4* / MVC / Hexagonal]`

Guarda en `docs/agents/architecture.md`.

**Sección D: Domain docs layout.** Default **single-context** (`CONTEXT.md + docs/adr/`). Ofrece **multi-context** (`CONTEXT-MAP.md` por contexto) solo si hallaste señal monorepo. Si no hay señal, escribe single sin preguntar.

Guarda en `docs/agents/domain.md` (ver `domain.md:14`).

### 3. Confirma y edita

Muestra borrador de:

- Bloque `## Agent skills (OOAD)` para `CLAUDE.md` / `AGENTS.md`.
- Contenidos de `docs/agents/workflow.md`, `issue-tracker.md`, `architecture.md`, `domain.md`.

Deja editar antes de escribir.

### 4. Escribe

**Elige archivo a editar:**

- Si `CLAUDE.md` existe, edítalo.
- Si no, `AGENTS.md`.
- Si ninguno existe, pregunta cuál crear; no elijas.

Nunca crees `AGENTS.md` si `CLAUDE.md` ya existe (o viceversa). Si el bloque `## Agent skills (OOAD)` ya existe, actualiza in-place.

**Bloque:**

```markdown
## Agent skills (OOAD)

### Workflow profile

[RUP iterativo | Waterfall | Ágil] — Clean 4 capas. Ver `docs/agents/workflow.md`.

### Issue tracker

[one-line summary]. Ver `docs/agents/issue-tracker.md`.

### Architecture

[Clean 4 capas | MVC | Hexagonal]. Ver `docs/agents/architecture.md`.

### Domain docs

[single-context | multi-context]. Ver `docs/agents/domain.md`.
```

Escribe los `docs/agents/*.md` usando plantillas en `ooad-workflow/templates/`:

- `workflow.md` — perfil + matriz artefactos por fase
- `issue-tracker-github.md` / `issue-tracker-gitlab.md` / `issue-tracker-local.md`
- `domain.md` — reglas consumo CONTEXT/ADR
- `architecture.md` — capas + reglas dependencia

Para `Other` tracker, escribe `issue-tracker.md` from scratch con la descripción del usuario.

### 5. Done

Indica que el setup está completo y qué skills `ooad-*` leerán la config. Menciona que `docs/agents/*.md` es editable a mano; re-ejecutar `setup-ooad` solo es necesario para cambiar perfil/tracker.
