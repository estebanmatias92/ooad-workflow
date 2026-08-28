# Architecture — Clean 4 capas (default)

## Capas

```
Frameworks & Drivers  →  Interface Adapters  →  Use Cases  →  Entities
(externo, web/db)        (controllers,      (application    (enterprise
                          presenters,        business       business
                          gateways, repo)    rules)         rules)
```

Regla de dependencia: flechas apuntan hacia adentro. `Entities` no conoce nada externo. `Use Cases` no importa `Frameworks`.

## RUP/Waterfall vs Ágil

- RUP/Waterfall: documenta en `docs/03-architecture/` con C4 + UML detallado + ADR por decisión.
- Ágil: ADR + C4 just-enough; UML solo lo crítico.

## Patrones GoF asociados

| Capa | Patrón típico | Uso |
|------|---------------|-----|
| Use Cases | Strategy, Command, State | reglas intercambiables |
| Adapters | Adapter, Proxy, Decorator | desacoplar framework |
| Frameworks | Factory, Singleton (con cautela) | creación configurada |

## Cómo verificar

- Import graph no viola dirección (lint `dependency-cruiser` o review).
- Cada UseCase mapeado a CU/US.
