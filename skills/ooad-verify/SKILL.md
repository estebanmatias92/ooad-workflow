---
name: ooad-verify
description: Verificación OOAD — plan de pruebas, Gherkin, reportes QA. Deriva casos de prueba desde SRS/CU/US + arquitectura. Complementa TDD de ooad-build.
---

# OOAD Verify — Testing / QA

## Objetivo

Derivar y ejecutar el **plan de pruebas** desde los artefactos RE (SRS/CU/US + AC Gherkin), no desde el código. Verifica caja negra/blanca, integración y UAT. Ver `artefactos-por-fase-y-metodologia.md:112 Testing`, `validacion-requerimientos.md`, `criterios-aceptacion.md`.

## Precondición

- `docs/02-requirements/` + `docs/03-architecture/` existen.
- `src/` build verde (al menos un slice de `ooad-build`).

## Proceso

### 1. Deriva casos de prueba

Desde cada `RF/CU/US+AC`:

| Fuente RE | Caso de prueba | Técnica |
|-----------|----------------|---------|
| RF funcional + flujo CU | `cases/CU-001-happy.feature` | Partición equivalencia, valores borde |
| RNF rendimiento | `perf/RNF-003-p95.feature` | Prueba carga, p95<200ms |
| Regla negocio | `cases/RN-001-regla.feature` | Tabla decisión |
| AC Gherkin de US | ya es caso ejecutable | `Given/When/Then` directo |

Plantilla Gherkin (`criterios-aceptacion.md`):

```gherkin
Feature: CU-001 Crear cuenta
  Scenario: Alta exitosa con email válido
    Given un usuario no registrado con email "a@b.com"
    When solicita crear cuenta con datos válidos
    Then la cuenta queda en estado "pendiente verificacion"
    And se registra RF-001 en RTM como cubierto

  Scenario: Email duplicado
    Given un usuario existente con email "a@b.com"
    When solicita crear cuenta con el mismo email
    Then el sistema rechaza con error "email ya existe"
```

**Reglas Gherkin:** un comportamiento por escenario, datos concretos, sin UI, cubrir feliz/borde/error/nulo.

### 2. Escribe estructura

```
tests/
├── unit/           # entities/usecases (TDD, pirámide 80%)
├── integration/    # adapters + db (15%)
├── e2e/            # flujo CU completo (5%)
└── cases/
    ├── CU-001-happy.feature
    └── RNF-003.feature

docs/05-qa/
├── plan-pruebas.md      (estrategia, niveles, criterios entrada/salida)
├── casos-prueba.md      (matriz RF→caso→resultado)
├── reporte-qa.md
└── reporte-bugs.md      (issue tracker)
```

### 3. Ejecuta

```bash
pytest tests/unit --cov
pytest tests/integration
behave tests/cases/        # o cucumber / pytest-bdd
```

Valida: caja blanca (cobertura, ramas), caja negra (partición), UAT con stakeholder.

### 4. Gates por perfil

- **Waterfall**: Plan de pruebas completo al inicio, formal, evidencias documentales.
- **RUP**: Plan por iteración, automatizado incremental.
- **Ágil**: Plan emergente por sprint, todo automatizado en CI/CD, evidencias en pipeline.

### 5. Verifica

- [ ] Cada RF/CU/US tiene al menos 1 caso Gherkin
- [ ] Pirámide respetada (80/15/5)
- [ ] Casos cubren feliz + borde + error + nulo
- [ ] Suite automatizada verde
- [ ] Reporte QA sin bloqueantes
- [ ] Trazabilidad `RF→caso` en RTM
