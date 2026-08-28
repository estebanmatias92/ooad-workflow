---
name: ooad-build
description: Implementación OOAD — código Clean 4 capas + TDD + OpenAPI/Migrations. Construye desde docs/03-architecture, con traza RF/CU/US. Lee docs/agents/workflow.md.
---

# OOAD Build — Implementation

## Objetivo

Escribir código en capas Clean + tests TDD que satisfagan los artefactos de RE y arquitectura, con traza a consignas. Ver `xp.md: TDD/CI/Refactoring`, `artefactos-por-fase-y-metodologia.md: Implementation`, `software-development-life-cycle.md:Implementation`.

## Precondición

- `docs/02-requirements/` validado.
- `docs/03-architecture/` aprobado (C4/UML + ADRs).
- `docs/agents/workflow.md` + `docs/agents/architecture.md`.

## Proceso

### 1. Prepara entorno

Según stack (elegido en `ooad-architect`):

| Stack | Archivos |
|-------|----------|
| python-venv | `requirements.txt + .gitignore` |
| python-nix | `flake.nix + .envrc` |
| node | `package.json + tsconfig` |
| any | `README.md + .gitignore` |

Reusa infra previa si existe (idempotencia). Ver `templates/gitignore-template.md`.

### 2. Slicing — por CU/US, no horizontal masivo

No construyas toda la DB, luego toda la API, luego toda la UI. Vertical slice por CU/US pero respetando capas Clean:

```
Slice 1: CU-001 Crear cuenta (Entity User + UseCase CreateUser + Adapter Repo + Controller) → TDD → verde → commit
Slice 2: CU-002 Login (UseCase Auth + Strategy para cifrado) → TDD → commit
```

Cada slice deja el sistema compilable y tests en verde.

### 3. Reglas de codificación

1.  **Traza**: cada módulo/clase inicia con comentario `// RF-001 / CU-001 — título` o `# RF-001`.
2.  **Clean 4 capas** (default):
    ```
    src/
    ├── entities/        # Enterprise Business Rules (puro dominio)
    ├── usecases/        # Application Business Rules (casos de uso)
    ├── adapters/        # Interface Adapters (repo, presenter, gateway)
    └── frameworks/      # Frameworks & Drivers (web, db, config)
    ```
    Dependencias solo hacia adentro. Nunca `entities` importa `frameworks`.

3.  **SOLID + GRASP + GoF**: una responsabilidad por clase; asigna responsabilidad al experto en información; usa GoF solo cuando justificado por ADR.
4.  **Clean Code**: nombres descriptivos, funciones cortas, sin duplicación.
5.  **TDD**: `RED → GREEN → REFACTOR`. Un test por comportamiento, no por método privado. Ver `criterios-aceptacion.md: Gherkin`.

### 4. TDD loop por slice

```bash
# RED: escribe test que falla (unit en entities/usecases, integración en adapters)
pytest tests/test_create_user.py -v   # debe fallar
# GREEN: mínimo código para pasar
# REFACTOR: limpia, tests siguen verde
# VERIFY: corre suite
pytest && npm test / go test ./...
```

Preferir `real implementation > fake > stub > mock` (mock solo en boundaries lentos).

### 5. Especificación de APIs

Si hay API REST: `openapi.yaml` (contract-first) en `docs/03-architecture/` o `api/` — genera antes o junto al controller.

### 6. No editar artefactos upstream

No modifiques `docs/02-requirements/` ni `docs/03-architecture/` sin aprobación. Si hay inconsistencia, pregunta.

### 7. Verifica

- [ ] Cada clase trazable a RF/CU/US
- [ ] Regla dependencia Clean respetada
- [ ] TDD: test falla antes, pasa después
- [ ] Suite verde (`pytest`, `go test`, `npm test` según stack)
- [ ] Build + lint ok
- [ ] OpenAPI si aplica
- [ ] Commit atómico por slice (`feat: CU-001 CreateUser entity+usecase`)

### 8. Gates por perfil

- **RUP**: Construction itera slices; cada iteración entrega incremento ejecutable.
- **Waterfall**: Build al final, tras diseño completo.
- **Ágil**: Build por sprint, slice = US, CI corre por push.
