# CRC Card — {{ Class }} (RDD — Wirfs-Brock)

> One card per candidate class. Source: `docs/02-requirements/crc-cards.md`. Template for `ooad-requirements` CRC workshop; feeds `ooad-architect` GRASP assignment.

- **Class**: {{ Name }}
- **Role stereotype**: {{ Information holder | Structurer | Service provider | Coordinator | Controller | Interfacer }}
- **Source**: {{ UC-xxx / US-xxx / FR-xxx }} — which flow nominated this class
- **Responsibilities — doing**: {{ verbs from the UC flow, e.g. creates Order, validates email }}
- **Responsibilities — knowing**: {{ data it holds, e.g. knows its line items }}
- **Collaborators**: {{ other classes it talks to, e.g. Order → Email, Order → OrderRepository }}
- **GRASP (filled in ooad-architect)**: {{ Information Expert | Creator | Controller | Low Coupling | High Cohesion | Polymorphism | Indirection | Pure Fabrication | Protected Variations → GoF xxx }}

## Walkthrough

- {{ UC-xxx step N }} → {{ responsibility }} → {{ collaborator }}
