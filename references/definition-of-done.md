# Definition of Done — OOAD

Cross-cutting checklist that every increment must pass, regardless of profile.

## Per RE Artifact

- [ ] FR/NFR with ID, priority, source, dependency, verifiable criterion
- [ ] NFR with metric and target (`p95<200ms`, `99.9%`)
- [ ] Glossary consistent, referenced by every FR
- [ ] RTM traceable `PRD → FR/UC/US → Class → ADR → Test`
- [ ] Fagan inspection passed (complete/consistent/unambiguous/verifiable/traceable)

## Per Architecture

- [ ] C4/UML in PlantUML + rendered SVGs
- [ ] ADR-MADR with alternatives and consequences
- [ ] Clean dependency rule respected (imports point inward)
- [ ] GoF justified (no pattern for fashion)

## Per Code

- [ ] TDD RED→GREEN, tests by behavior not privates
- [ ] Pyramid 80/15/5, coverage ≥80%
- [ ] Build + lint green
- [ ] Trace `// FR-001 / UC-001` in each module
- [ ] OpenAPI if API exists

## Per QA

- [ ] Each FR/UC/US with Gherkin case happy+edge+error+null
- [ ] Automated suite green
- [ ] No blocking bug

## Per Delivery

- [ ] Prod checklist + rollback tested
- [ ] Release Notes traceable to FR/UC
- [ ] CHANGELOG updated
- [ ] Runbooks versioned
