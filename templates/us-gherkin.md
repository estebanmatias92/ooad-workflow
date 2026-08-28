# US-{{ NNN }}: {{ Título }}

> User Story INVEST + Confirmation Gherkin. Ver `user-stories.md`, `criterios-aceptacion.md`.

- **ID**: US-{{ NNN }}
- **RF trazado**: RF-{{ ... }} (si híbrido)
- **Prioridad MoSCoW**: Must | Should | Could | Won't
- **Estimación**: {{ story points / t-shirt }}
- **Dependencias**: US-{{ ... }}

## Card

> **Como** {{ rol }}
> **Quiero** {{ acción }}
> **Para** {{ beneficio }}

## Conversation (notas)

{{ contexto, mockup link, decisión }}

## Confirmation — Criterios de Aceptación (Gherkin)

```gherkin
Feature: US-{{ NNN }} {{ Título }}
  Scenario: {{ happy path }}
    Given {{ contexto }}
    When {{ acción }}
    Then {{ resultado }}

  Scenario: {{ borde }}
    Given {{ ... }}
    When {{ ... }}
    Then {{ ... }}

  Scenario: {{ error }}
    Given {{ ... }}
    When {{ ... }}
    Then {{ ... }}

  Scenario Outline: {{ tabla ejemplos }}
    Given un valor <entrada>
    When proceso
    Then obtengo <salida>
    Examples:
      | entrada | salida |
      | a       | b      |
```

Reglas: un comportamiento por escenario, datos concretos, sin UI, cubrir feliz/borde/error/nulo.

## DoD de esta US

- [ ] Código en Clean 4 capas + TDD verde
- [ ] AC Gherkin automatizados (`behave/pytest-bdd/cucumber`)
- [ ] Documentada en RTM

## Notas

- [ ] {{ open }}
