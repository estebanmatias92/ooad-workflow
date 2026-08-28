# Plan de Pruebas — {{ Producto }}

## Estrategia por niveles (pirámide 80/15/5)

| Nivel | Scope | Framework | Dónde |
|-------|-------|-----------|-------|
| Unit | entities/usecases | pytest/jest | tests/unit |
| Integration | adapters+db | pytest+testcontainers | tests/integration |
| E2E | flujo CU | behave/cucumber/playwright | tests/e2e |

## Criterios entrada/salida

- Entrada: RF/CU validado, arquitectura aprobada.
- Salida: todos los `RF→caso` en RTM cubiertos, sin bug bloqueante, cobertura ≥80%.

## Casos

Ver `tests/cases/*.feature` (Gherkin).

## Ejecución

```bash
pytest tests/unit --cov
pytest tests/integration
behave tests/cases/
```
