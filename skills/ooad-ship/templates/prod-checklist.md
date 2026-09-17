# Prod Checklist — Release {{ version }}

- [ ] Migrations tested on staging
- [ ] Env vars / secrets in vault
- [ ] Feature flags defined
- [ ] Rollback script tested (`scripts/rollback-{{ version }}.sh`)
- [ ] Runbooks updated (`docs/06-deploy/runbooks/`)
- [ ] SLI/SLO configured
- [ ] Release Notes from RTM

## Rollback

```bash
./scripts/rollback-{{ version }}.sh
```
