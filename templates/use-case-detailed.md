# UC-{{ NNN }}: {{ Title }}

> Detailed Use Case — RUP/Waterfall driver. See `especificacion-requerimientos.md` (ES).

- **ID**: UC-{{ NNN }}
- **Traced FRs**: FR-{{ ... }}
- **Primary Actor**: {{ user / system }}
- **Secondary Actors**: {{ ... }}
- **Precondition**: {{ prior state }}
- **Success Postcondition**: {{ resulting state }}
- **Priority**: Must / Should / Could
- **Source**: PRD F-{{ ... }}

## Main Flow (happy path)

1. {{ actor does ... }}
2. {{ system responds ... }}
3. {{ ... }}

## Alternative Flows

| Step | Condition | Action |
|------|-----------|--------|
| 3a | {{ invalid data }} | {{ show error E-001 }} |

## Exception Flows

| ID | Error | Handling |
|----|-------|----------|
| E-001 | {{ duplicate email }} | {{ reject 409 }} |

## Associated Business Rules

- BR-001: {{ rule }}

## Acceptance Criteria (Gherkin)

```gherkin
Feature: UC-{{ NNN }} {{ Title }}
  Scenario: {{ happy }}
    Given {{ precondition }}
    When {{ action }}
    Then {{ result }}

  Scenario: {{ alternative }}
    Given {{ ... }}
    When {{ ... }}
    Then {{ ... }}
```

## Sequence Diagram

See `../../03-architecture/sequence-diagram-UC-{{ NNN }}.puml`.

## Notes / Open

- [ ] {{ question }}
