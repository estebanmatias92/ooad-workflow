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

| Layer | Typical Pattern | GRASP driver | Use |
|-------|-----------------|--------------|-----|
| Use Cases | Strategy, Command, State | Protected Variations / Polymorphism | interchangeable rules |
| Use Cases | (UseCase as Controller) | Controller | system-event entry point, never UI logic |
| Adapters | Adapter, Proxy, Decorator | Indirection / Protected Variations | decouple framework |
| Entities | (creation via aggregate root) | Creator / Information Expert | ownership-driven construction |
| Any | — helper with no domain fit | Pure Fabrication | preserve High Cohesion, note rationale |
| Frameworks | Factory, Singleton (with caution) | Creator | configured creation |

## How to Verify

- Import graph does not violate direction (lint `dependency-cruiser` or review).
- Each UseCase mapped to UC/US.
