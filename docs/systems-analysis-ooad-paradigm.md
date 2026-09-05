A partir del diseño curricular oficial de la **Tecnicatura Superior en Análisis de Sistemas (Res. 6790/19)**, queda formalmente determinado el mapa de contenidos y el linaje formativo de tu carrera.

El plan de estudios no sigue un enfoque de Domain-Driven Design (DDD) ni arquitecturas reactivas/orientadas a eventos. Sigue la **escuela clásica de Análisis y Diseño de Sistemas Orientado a Objetos (OOAD)** basada en la transición **IEEE 830 / Casos de Uso ➔ UML / Patrones GoF ➔ TDD / Arquitecturas en Capas y MVC**.

---

## 1. Mapeo Oficial de tu Carrera por Materia

A continuación se detalla cómo se articula la columna vertebral técnica de tu carrera a lo largo de los 3 años:

```text
[1° AÑO] Sistemas y Organizaciones + Algoritmos I
          │ (Teoría General de Sistemas, Flujo de Datos, Intro POO)
          ▼
[2° AÑO] Ingeniería de Software I + Algoritmos II + Base de Datos
          │ (IEEE 830, Casos de Uso, UML, Patrones GoF, Refactoring, TDD, Modelo E-R / SQL)
          ▼
[3° AÑO] Ingeniería de Software II + Prácticas Profesionalizantes III
          │ (Calidad/CMMI, Testing Caja Blanca/Negra, MVC, APIs RESTful)

```

### 1° Año: Fundación y Abstracción

- **Sistemas y Organizaciones:** Introduce la Teoría General de Sistemas (TGS) y los flujos organizacionales.

- **Algoritmos y Estructuras de Datos I:** Paradigma algorítmico estructurado y la primera transición hacia la POO elemental (clases, objetos, métodos).

### 2° Año: El Núcleo de Modelado, Patrones y Pruebas

Este es el año clave donde se concentran los conceptos que venías integrando:

- **Ingeniería de Software I:** Requerimientos formales (IEEE 830), Casos de Uso, Proceso Unificado y Metodologías Ágiles.

- **Algoritmos y Estructuras de Datos II:**
- _Modelado:_ UML (Diagramas de Clases, Secuencia e Interacción).

- _Diseño:_ Catálogo de Patrones GoF (Creacionales: _Factory_, _Singleton_; Estructurales: _Composite_, _Decorator_, _Adapter_, _Proxy_; Comportamiento: _Observer_, _State_, _Strategy_, _Command_).

- _Código:_ Refactoring hacia patrones, pruebas (unitarias, integración, aceptación) y **TDD (Test-Driven Development)**.

- **Base de Datos:** Modelo Entidad-Relación, Álgebra Relacional, SQL y Transacciones.

### 3° Año: Calidad, Arquitectura e Implementación

- **Ingeniería de Software II:** Aseguramiento de calidad (CMMI, ISO), diseño formal de casos de prueba (caja negra y caja blanca) y auditoría.

- **Prácticas Profesionalizantes III:** Arquitectura Web basada en **MVC**, diseño de **APIs RESTful** y frameworks orientados a objetos.

---

## 2. A qué prestarle atención estricta (Tu Foco)

Para maximizar tu rendimiento académico y profesional alineado con la carrera, enfoca tu energía en este circuito:

1. **De Casos de Uso a Diagramas de Secuencia (Ing. de Software I + Algoritmos II):** Entender cómo los pasos narrativos de un Caso de Uso se traducen en llamadas a métodos entre clases en UML.

2. **Patrones de Diseño GoF y Refactoring (Algoritmos II):** Dominar cuándo aplicar _Strategy_ para reemplazar condicionales o _Adapter_ para desacoplar interfaces.

3. **TDD y Testing de Unidad (Algoritmos II + Ing. de Software II):** Diseñar código escribiendo la prueba unitaria primero, desacoplando dependencias externas mediante interfaces.

4. **Diseño Relacional y Transacciones (Base de Datos):** Mapeo de objetos al modelo Entidad-Relación y normalización.

5. **Patrón MVC y APIs RESTful (Prácticas III):** Estructurar la interacción cliente-servidor separando la lógica de negocio de los controladores HTTP.

---

## 3. Qué descartar o dejar fuera de tu radar actual

Estos conceptos **no forman parte de tu currícula** y son los causantes directos de la confusión conceptual cuando intentas mezclarlos:

| Concepto | Razón para mantenerte al margen por ahora |
| -------- | ----------------------------------------- |
| **Tactical DDD** (_Aggregates_, _Domain Events_, _Invariants boundaries_) | Tu plan aborda el diseño desde los **Patrones de Diseño GoF** y **Casos de Uso**, no desde consistencia transaccional de agregados en memoria. |
| **Event Sourcing / CQRS Avanzado** | Tu programa de persistencia está centrado en el **Modelo Relacional clásico y transaccional (SQL-ANSI)**. |
| **Flujos agénticos sesgados a DDD** (ej. _skills_ de Matt Pocock) | Esos entornos intentan forzar especificaciones basadas en eventos y agregados que chocan con el flujo `Caso de Uso -> UML -> Patrón GoF -> TDD` que evalúa tu carrera. |
| **Microservicios distribuidos** | El foco del tercer año es el desarrollo web sólido mediante **MVC y servicios RESTful**. |
