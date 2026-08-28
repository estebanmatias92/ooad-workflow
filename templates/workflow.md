# Workflow Profile — OOAD

> Generado por `setup-ooad`. Editar a mano es válido; re-ejecutar setup solo si cambias perfil/tracker.

## Perfil metodológico

- **Perfil**: RUP iterativo  <!-- RUP | Waterfall | Ágil -->
- **Arquitectura**: Clean 4 capas  <!-- Clean 4 capas | MVC | Hexagonal -->
- **Tracker**: GitHub  <!-- GitHub | GitLab | Local | Other -->
- **Domain docs**: single-context  <!-- single-context | multi-context -->

## Matriz artefactos por perfil

| Artefacto | RUP (default) | Waterfall | Ágil |
|-----------|---------------|-----------|------|
| `docs/01-discovery/PRD.md` | Vision + KPIs, revisado Elaboration | Completo, firmado | 1 pág vivo |
| `docs/02-requirements/SRS.md` | Híbrido (CU driver + SRS resumido) | **Obligatorio pesado IEEE830** | Rara vez; si exigen, mínimo |
| `docs/02-requirements/casos-de-uso/CU-*.md` | **Obligatorio detallado** | Sí | Liviano o US |
| `docs/02-requirements/backlog/US-*.md + Gherkin` | Opcional | No | **Obligatorio INVEST + AC** |
| `docs/02-requirements/glosario.md + RTM.csv` | Obligatorio, refinado por iteración | Obligatorio al inicio, formal | Emergente, vivo |
| `docs/03-architecture/C4.puml + UML` | Baseline ejecutable en Elaboration | SDD pesado, UML detallado | Just-enough |
| `docs/03-architecture/adrs/` | ADR por decisión significativa | Rara vez (no existía en origen) | ADR por decisión |
| `src/` Clean 4 capas | Iterativo (Construction) | Al final | Por sprint |
| `docs/05-qa/plan-pruebas*.feature` | Por iteración | Completo al inicio, formal | Emergente automatizado |
| `docs/06-deploy/*` | Transition | Formal, ventana | Continuo + flags |

Fuente: `artefactos-por-fase-y-metodologia.md:68-149`.

## Gates

- **RUP**: Inception (Vision ok) → Elaboration (arquitectura corre) → Construction (incrementos) → Transition (beta→prod)
- **Waterfall**: SRS firmado → SDD firmado → Build → QA formal → Release
- **Ágil**: PRD vivo → Sprint Planning (US+AC) → Build+TDD → Review → Ship

## Cómo cambiar perfil

Edita la línea `Perfil:` arriba y adapta artefactos obligatorios. Las skills `ooad-*` leen este archivo en su paso 1.
