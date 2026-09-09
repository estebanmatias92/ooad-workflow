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

{{ per new class/operation: GRASP pattern — e.g. Creator for Order.create(), Controller for CreateUserUseCase, Protected Variations → Strategy for validation rules }}

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
