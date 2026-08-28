# Architecture — Clean 4 Layers (default)

## Layers

```
Frameworks & Drivers  →  Interface Adapters  →  Use Cases  →  Entities
(external, web/db)        (controllers,      (application    (enterprise
                          presenters,        business       business
                          gateways, repo)    rules)         rules)
```

Dependency rule: arrows point inward. `Entities` know nothing external. `Use Cases` do not import `Frameworks`.

## RUP/Waterfall vs Agile

- RUP/Waterfall: document in `docs/03-architecture/` with C4 + detailed UML + ADR per decision.
- Agile: ADR + just-enough C4; UML only for critical parts.

## Associated GoF Patterns

| Layer | Typical Pattern | Use |
|-------|-----------------|-----|
| Use Cases | Strategy, Command, State | interchangeable rules |
| Adapters | Adapter, Proxy, Decorator | decouple framework |
| Frameworks | Factory, Singleton (with caution) | configured creation |

## How to Verify

- Import graph does not violate direction (lint `dependency-cruiser` or review).
- Each UseCase mapped to UC/US.
