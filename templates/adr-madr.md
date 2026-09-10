# ADR-{{ NNN }}: {{ Title }}

- **Status**: Proposed <!-- Proposed | Accepted | Deprecated | Superseded by ADR-xxx -->
- **Date**: {{ YYYY-MM-DD }}
- **Deciders**: {{ names }}
- **Consulted**: {{ ... }}

## Context

{{ what problem, which NFR/FR motivates it, what forces are in tension }}

## Decision

{{ what is decided, in one sentence }}

## Responsibility assignment (GRASP)

{{ per new class/operation: GRASP pattern + its one-line Mission from references/ooad-vocabulary.md — e.g. Creator for Order.create() (one stable owner per lifecycle), Controller for CreateUserUseCase (single entry point per system operation), Protected Variations → Strategy for validation rules (instability never leaks to clients) }}

## Consequences

- **Positive**: {{ ... }}
- **Negative / Costs**: {{ ... }}
- **Risks**: {{ ... }}

## Alternatives Considered

| Alternative | Pros | Cons | Why not |
|-------------|------|------|---------|
| {{ e.g.: simple MVC }} | {{ simple }} | {{ couples to framework }} | {{ violates Clean }} |

## Compliance

{{ how to verify: test, metric, review }}

## References

- {{ FR-xxx, NFR-xxx, UC-xxx }}
- {{ link to issue/PR }}
