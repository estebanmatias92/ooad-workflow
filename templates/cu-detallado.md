# CU-{{ NNN }}: {{ Título }}

> Caso de Uso detallado — RUP/Waterfall driver. Ver `especificacion-requerimientos.md`.

- **ID**: CU-{{ NNN }}
- **RF trazados**: RF-{{ ... }}
- **Actor primario**: {{ usuario / sistema }}
- **Actores secundarios**: {{ ... }}
- **Precondición**: {{ estado previo }}
- **Postcondición éxito**: {{ estado posterior }}
- **Prioridad**: Must / Should / Could
- **Fuente**: PRD F-{{ ... }}

## Flujo principal (happy path)

1. {{ actor hace ... }}
2. {{ sistema responde ... }}
3. {{ ... }}

## Flujos alternos

| Paso | Condición | Acción |
|------|-----------|--------|
| 3a | {{ dato inválido }} | {{ mostrar error E-001 }} |

## Flujos de excepción

| ID | Error | Manejo |
|----|-------|--------|
| E-001 | {{ email duplicado }} | {{ rechaza 409 }} |

## Reglas de negocio asociadas

- RN-001: {{ regla }}

## Criterios de aceptación (Gherkin)

```gherkin
Feature: CU-{{ NNN }} {{ Título }}
  Scenario: {{ happy }}
    Given {{ precondición }}
    When {{ acción }}
    Then {{ resultado }}

  Scenario: {{ alterno }}
    Given {{ ... }}
    When {{ ... }}
    Then {{ ... }}
```

## Diagrama de secuencia

Ver `../../03-architecture/diagrama-secuencia-CU-{{ NNN }}.puml`.

## Notas / Open

- [ ] {{ duda }}
