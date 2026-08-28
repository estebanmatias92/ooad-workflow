# OOAD Workflow — Framework agéntico profesional

Framework agéntico **OOAD + Clean 4 capas + TDD**, alineado al paradigma de la Tecnicatura en Análisis de Sistemas (`systems-analysis-ooad-paradigm.md:3` — `IEEE830/Casos de Uso → UML/GoF → TDD → MVC/Capas`). Alternativa profesional a `mattpocock/skills` (DDD/VSA) y `addyosmani/agent-skills` (PRD→VSA SaaS).

## Perfiles metodológicos (elegible en `setup-ooad`)

| Perfil | Cuándo | Artefacto obligatorio |
|--------|--------|-----------------------|
| **RUP iterativo** *(default)* | Producto mediano, equipo pequeño-mediano, requisitos evolutivos con riesgo | Vision + CU detallados + C4/UML + ADR iterativo |
| **Waterfall** | Contrato fijo, regulación, equipo grande | SRS IEEE830 + SDD pesado firmados |
| **Ágil / Scrum** | Producto digital, requisitos cambiantes | Backlog US INVEST + Gherkin AC + ADR just-enough |

La misma base SDLC 7 fases (`Discovery → RE → Design → Implementation → Testing → Deployment → Maintenance`) se agenda distinto por perfil (`artefactos-por-fase-y-metodologia.md:72-149`).

## Skills (activación manual, en orden sugerido)

1. `/setup-ooad` — configura perfil + tracker + arquitectura + domain docs (una vez por repo)
2. `/ooad-discover` — PRD + Vision + personas + glosario draft
3. `/ooad-requirements` — SRS **ó** US+CU+Gherkin + modelo conceptual + RTM + validación Fagan
4. `/ooad-architect` — C4/UML + modelo datos + GoF + Clean 4 capas + ADR-MADR
5. `/ooad-build` — código Clean (entities/usecases/adapters/frameworks) + TDD + OpenAPI
6. `/ooad-verify` — plan pruebas + Gherkin ejecutable (pirámide 80/15/5)
7. `/ooad-ship` — checklist prod + runbooks + rollback + changelog + pipeline

> Orden sugerido, no forzado: brownfield puede iniciar en `ooad-architect` con gap→US.

## Instalación

### Desarrollo (este repo)

Skills viven en `./ooad-workflow/` y se exponen a opencode vía symlink global:

```bash
ln -s $(pwd)/ooad-workflow ~/.config/opencode/skills/ooad-workflow
```

Verifica:

```bash
ls -l ~/.config/opencode/skills/ooad-workflow
# debe apuntar a .../ooad-systems-modeling/ooad-workflow
```

### Repo local alternativo

```
ooad-workflow/.opencode/skills/  # si prefieres no usar global
```

## Uso

```bash
# 1) Configurar repo nuevo
/setup-ooad   # elige RUP* / Waterfall / Ágil, tracker, arquitectura

# 2) Ciclo por feature (RUP ejemplo: por iteración)
 /ooad-discover      # PRD + Vision
 /ooad-requirements  # CU-001.. + RTM
 /ooad-architect     # C4 + clases + ADR
 /ooad-build         # TDD por CU
 /ooad-verify        # Gherkin E2E
 /ooad-ship          # release
```

Cada skill lee `docs/agents/workflow.md` para decidir plantilla y gate.

## Estructura

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
│   ├── prd.md, srs-830.md, cu-detallado.md, us-gherkin.md
│   ├── glossary.md, rtm.csv, adr-madr.md
│   ├── c4.puml, class-diagram.puml, sequence-diagram.puml
│   └── workflow.md, domain.md, architecture.md, issue-tracker-*.md
└── references/
    ├── artefactos-matrix.md
    └── definition-of-done.md
```

## Comparativa

| Criterio OOAD | `ooad-workflow` | Matt Pocock | AddyOsmani |
|---------------|-----------------|-------------|------------|
| IEEE830/RN-xxx | ✅ nativo por perfil | ❌ User Stories DDD | ❌ PRD SaaS |
| CU→Secuencia→Clases | ✅ | ❌ seams | ❌ VSA |
| GoF + Clean 4 | ✅ MADR justificado | Deep modules | Contract-first genérico |
| TDD | ✅ RED→GREEN por capa | seam-based | ✅ |
| MVC/Capas | ✅ default | VSA | VSA SaaS |

## Referencias

- `systems-analysis-ooad-paradigm.md`
- `artefactos-por-fase-y-metodologia.md`
- `requirements-engineering.md` + 5 sub-fases RE
- `architecture-decision-record.md` (MADR)
