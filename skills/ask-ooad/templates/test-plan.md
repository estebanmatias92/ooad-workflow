# Test Plan — {{ Product }}

## Strategy by Levels (pyramid 80/15/5)

| Level | Scope | Framework | Location |
|-------|-------|-----------|----------|
| Unit | entities/usecases | pytest/jest | tests/unit |
| Integration | adapters+db | pytest+testcontainers | tests/integration |
| E2E | UC flow | behave/cucumber/playwright | tests/e2e |

## Entry / Exit Criteria

- Entry: FR/UC validated, architecture approved.
- Exit: all `FR→case` in RTM covered, no blocking bug, coverage ≥80%.

## Cases

See `tests/cases/*.feature` (Gherkin).

## Execution

```bash
pytest tests/unit --cov
pytest tests/integration
behave tests/cases/
```
