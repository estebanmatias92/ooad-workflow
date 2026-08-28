# Definition of Done — OOAD

Checklist transversal que cada incremento debe pasar, cualquiera sea el perfil.

## Por artefacto RE

- [ ] RF/RNF con ID, prioridad, origen, dependencia, criterio verificable
- [ ] RNF con métrica y target (`p95<200ms`, `99.9%`)
- [ ] Glosario sin contradicciones, referenciado por cada RF
- [ ] RTM trazable `PRD → RF/CU/US → Clase → ADR → Test`
- [ ] Validación Fagan pasada (completo/consistente/no-ambiguo/verificable/trazable)

## Por arquitectura

- [ ] C4/UML en PlantUML + SVGs renderizados
- [ ] ADR-MADR con alternativas y consecuencias
- [ ] Regla dependencia Clean respetada (import hacia adentro)
- [ ] GoF justificado (no patrón por moda)

## Por código

- [ ] TDD RED→GREEN, tests por comportamiento no por privados
- [ ] Pirámide 80/15/5, cobertura ≥80%
- [ ] Build + lint verde
- [ ] Traza `// RF-001 / CU-001` en cada módulo
- [ ] OpenAPI si hay API

## Por QA

- [ ] Cada RF/CU/US con caso Gherkin feliz+borde+error+nulo
- [ ] Suite automatizada verde
- [ ] Sin bug bloqueante

## Por entrega

- [ ] Checklist prod + rollback probado
- [ ] Release Notes trazables a RF/CU
- [ ] CHANGELOG actualizado
- [ ] Runbooks versionados
