# US-{{ NNN }}: {{ Title }}

> User Story INVEST + Confirmation Gherkin. See `user-stories.md` (ES), `criterios-aceptacion.md` (ES).

- **ID**: US-{{ NNN }}
- **Traced FR**: FR-{{ ... }} (if hybrid)
- **MoSCoW Priority**: Must | Should | Could | Won't
- **Estimate**: {{ story points / t-shirt }}
- **Dependencies**: US-{{ ... }}

## Card

> **As a** {{ role }}
> **I want** {{ action }}
> **So that** {{ benefit }}

## Conversation (notes)

{{ context, mockup link, decision }}

## Confirmation — Acceptance Criteria (Gherkin)

```gherkin
Feature: US-{{ NNN }} {{ Title }}
  Scenario: {{ happy path }}
    Given {{ context }}
    When {{ action }}
    Then {{ result }}

  Scenario: {{ edge }}
    Given {{ ... }}
    When {{ ... }}
    Then {{ ... }}

  Scenario: {{ error }}
    Given {{ ... }}
    When {{ ... }}
    Then {{ ... }}

  Scenario Outline: {{ table examples }}
    Given a value <input>
    When processed
    Then I get <output>
    Examples:
      | input | output |
      | a     | b      |
```

Rules: one behavior per scenario, concrete data, no UI, cover happy/edge/error/null.

## DoD for this US

- [ ] Code in Clean 4 layers + green TDD
- [ ] Automated Gherkin AC (`behave/pytest-bdd/cucumber`)
- [ ] Documented in RTM

## Notes

- [ ] {{ open }}
